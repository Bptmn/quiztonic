#!/bin/bash

# Script de configuration de l'environnement de développement local
# Utilise exactement les mêmes contraintes que l'environnement de production

set -e

echo "🚀 Configuration de l'environnement de développement RAQAM-API"
echo "================================================================"

# Vérifier que nous sommes dans le bon répertoire
if [ ! -f "requirements.txt" ] || [ ! -f "constraints.txt" ]; then
    echo "❌ Erreur: Les fichiers requirements.txt et constraints.txt doivent être présents"
    exit 1
fi

# Créer un environnement virtuel
echo "📦 Création de l'environnement virtuel..."
python3 -m venv venv

# Activer l'environnement virtuel
echo "🔌 Activation de l'environnement virtuel..."
source venv/bin/activate

# Mettre à jour pip
echo "⬆️  Mise à jour de pip..."
pip install --upgrade pip

# Installer les dépendances avec les mêmes contraintes que la production
echo "📥 Installation des dépendances avec les contraintes de production..."
pip install -r requirements.txt --constraint constraints.txt

# Vérifier les dépendances
echo "✅ Vérification des dépendances..."
pip check

echo ""
echo "================================================================"
echo "✅ Environnement de développement configuré avec succès!"
echo ""
echo "🔌 Pour activer l'environnement virtuel:"
echo "   source venv/bin/activate"
echo ""
echo "🧪 Pour tester votre code:"
echo "   python -m pytest"
echo "   # ou"
echo "   python api/api.py"
echo ""
echo "🔌 Pour désactiver l'environnement:"
echo "   deactivate"
echo ""
echo "⚠️  Cet environnement utilise EXACTEMENT les mêmes versions"
echo "   que l'environnement de production (contrôlé par constraints.txt)"
echo "================================================================"
