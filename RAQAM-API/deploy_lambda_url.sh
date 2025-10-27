#!/bin/bash
# Script de déploiement RAQAM avec Lambda Function URL

set -e

echo "🚀 Déploiement RAQAM avec Lambda Function URL"
echo "============================================="

# Vérifier les prérequis
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI n'est pas installé. Installez-le d'abord."
    exit 1
fi

if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé. Installez-le d'abord."
    exit 1
fi

# Vérifier la configuration AWS
echo "🔍 Vérification de la configuration AWS..."
if ! aws sts get-caller-identity --profile raqam-deployer &> /dev/null; then
    echo "❌ AWS CLI n'est pas configuré pour le profil 'raqam-deployer'."
    echo ""
    echo "📋 Configurez d'abord votre profil:"
    echo "   aws configure --profile raqam-deployer"
    echo ""
    echo "📋 Informations nécessaires:"
    echo "   - AWS Access Key ID"
    echo "   - AWS Secret Access Key"
    echo "   - Default region (us-east-1)"
    echo "   - Default output format (json)"
    echo ""
    echo "🔗 Obtenez ces informations dans AWS Console → IAM → Users → raqam-deployer → Security credentials"
    exit 1
fi

# Afficher les informations du compte
echo "✅ Configuration AWS OK"
ACCOUNT_ID=$(aws sts get-caller-identity --profile raqam-deployer --query Account --output text)
REGION=$(aws configure get region --profile raqam-deployer || echo "us-east-1")
echo "📊 Compte AWS: $ACCOUNT_ID"
echo "🌍 Région: $REGION"

# Variables
FUNCTION_NAME="raqam-api"
ROLE_NAME="raqam-lambda-role"

# Demander la clé OpenAI si pas définie
if [ -z "$OPENAI_API_KEY" ]; then
    echo "🔑 Entrez votre clé OpenAI API:"
    read -s OPENAI_API_KEY
    echo ""
fi

# 1. Créer le rôle IAM
echo "🔐 Création du rôle IAM..."
aws iam create-role \
    --profile raqam-deployer \
    --role-name $ROLE_NAME \
    --assume-role-policy-document '{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }' 2>/dev/null || echo "✅ Rôle existe déjà"

# Attacher la politique
echo "📋 Attachement de la politique..."
aws iam attach-role-policy \
    --profile raqam-deployer \
    --role-name $ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

# Attendre que le rôle soit prêt
echo "⏳ Attente de la propagation du rôle..."
sleep 10

# 2. Construire et déployer la Lambda
echo "🐳 Construction de l'image Docker..."
docker build -t raqam-lambda .

echo "📦 Création du package de déploiement..."
docker run --rm -v $(pwd):/output raqam-lambda cp -r /var/task /output/lambda-package

echo "🗜️  Création du fichier ZIP..."
cd lambda-package
zip -r ../raqam-lambda.zip . -x "*.pyc" "__pycache__/*" "*.git*"
cd ..

# Obtenir l'ARN du rôle
ROLE_ARN=$(aws iam get-role --profile raqam-deployer --role-name $ROLE_NAME --query 'Role.Arn' --output text)
echo "🔗 ARN du rôle: $ROLE_ARN"

# Créer ou mettre à jour la fonction Lambda
echo "⚡ Déploiement de la fonction Lambda..."
aws lambda create-function \
    --profile raqam-deployer \
    --function-name $FUNCTION_NAME \
    --runtime python3.9 \
    --role $ROLE_ARN \
    --handler api.lambda_function.lambda_handler \
    --zip-file fileb://raqam-lambda.zip \
    --timeout 300 \
    --memory-size 1024 \
    --description "RAQAM API - Quiz and Flashcard Generator with Language Detection" \
    --environment Variables="{OPENAI_API_KEY=$OPENAI_API_KEY}" \
    --region $REGION 2>/dev/null || \
aws lambda update-function-code \
    --profile raqam-deployer \
    --function-name $FUNCTION_NAME \
    --zip-file fileb://raqam-lambda.zip \
    --region $REGION

# Mettre à jour la configuration
aws lambda update-function-configuration \
    --profile raqam-deployer \
    --function-name $FUNCTION_NAME \
    --environment Variables="{OPENAI_API_KEY=$OPENAI_API_KEY}" \
    --timeout 300 \
    --memory-size 1024 \
    --region $REGION 2>/dev/null || true

# 3. Créer la Lambda Function URL
echo "🔗 Création de la Lambda Function URL..."
FUNCTION_URL=$(aws lambda create-function-url-config \
    --profile raqam-deployer \
    --function-name $FUNCTION_NAME \
    --auth-type NONE \
    --cors '{
        "AllowCredentials": false,
        "AllowHeaders": ["content-type"],
        "AllowMethods": ["*"],
        "AllowOrigins": ["*"],
        "ExposeHeaders": [],
        "MaxAge": 86400
    }' \
    --query 'FunctionUrl' \
    --output text 2>/dev/null || \
aws lambda get-function-url-config \
    --profile raqam-deployer \
    --function-name $FUNCTION_NAME \
    --query 'FunctionUrl' \
    --output text 2>/dev/null)

echo "🌐 Lambda Function URL: $FUNCTION_URL"

# Nettoyer les fichiers temporaires
echo "🧹 Nettoyage..."
rm -rf lambda-package
rm -f raqam-lambda.zip

# Résumé
echo ""
echo "✅ Déploiement terminé!"
echo "============================================="
echo "🔗 Fonction Lambda: $FUNCTION_NAME"
echo "🌍 Région: $REGION"
echo "🌐 Lambda Function URL: $FUNCTION_URL"
echo ""
echo "📊 Console AWS:"
echo "   Lambda: https://console.aws.amazon.com/lambda/home?region=$REGION#/functions/$FUNCTION_NAME"
echo ""
echo "🧪 Test de l'API:"
echo "curl -X POST $FUNCTION_URL \\"
echo "  -H \"Content-Type: application/json\" \\"
echo "  -d '{\"data\":{\"url\":\"https://en.wikipedia.org/wiki/Machine_learning\",\"num_questions\":4,\"num_choices\":4,\"generate_flashcards\":true}}'"
echo ""
echo "📱 Intégration dans votre app:"
echo "   Remplacez l'ancienne URL par: $FUNCTION_URL"
echo ""
echo "🔧 Configuration CORS:"
echo "   ✅ Toutes les origines autorisées"
echo "   ✅ Toutes les méthodes autorisées"
echo "   ✅ Headers Content-Type autorisés"
echo ""
echo "📚 Pour plus d'informations, consultez DEPLOYMENT_GUIDE.md"
