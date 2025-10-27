#!/bin/bash
# Script de déploiement AWS Lambda pour RAQAM

# Variables
FUNCTION_NAME="raqam-api"
REGION="us-east-1"
ROLE_NAME="raqam-lambda-role"

# Créer le rôle IAM si nécessaire
aws iam create-role --role-name $ROLE_NAME --assume-role-policy-document '{
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
}' 2>/dev/null || echo "Rôle existe déjà"

# Attacher les politiques nécessaires
aws iam attach-role-policy --role-name $ROLE_NAME --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

# Attendre que le rôle soit prêt
sleep 10

# Créer le package de déploiement
zip -r raqam-lambda.zip . -x "*.pyc" "__pycache__/*" "*.git*"

# Obtenir l'ARN du rôle
ROLE_ARN=$(aws iam get-role --role-name $ROLE_NAME --query 'Role.Arn' --output text)

# Créer ou mettre à jour la fonction Lambda
aws lambda create-function \
    --function-name $FUNCTION_NAME \
    --runtime python3.9 \
    --role $ROLE_ARN \
    --handler api.lambda_function.lambda_handler \
    --zip-file fileb://raqam-lambda.zip \
    --timeout 300 \
    --memory-size 1024 \
    --description "RAQAM API - Quiz and Flashcard Generator with Language Detection" \
    --region $REGION 2>/dev/null || \
aws lambda update-function-code \
    --function-name $FUNCTION_NAME \
    --zip-file fileb://raqam-lambda.zip \
    --region $REGION

echo "✅ Déploiement terminé!"
echo "🔗 URL de la fonction: https://console.aws.amazon.com/lambda/home?region=$REGION#/functions/$FUNCTION_NAME"
