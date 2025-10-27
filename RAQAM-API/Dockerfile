FROM public.ecr.aws/lambda/python:3.11

# Crée le répertoire de travail
WORKDIR /var/task

# Copier les fichiers
COPY src/ src/
COPY config/ config/
COPY api/lambda_function.py api/lambda_function.py
COPY requirements.txt .
COPY constraints.txt .

# Installer les dépendances dans le bon dossier
# Utilisation de contraintes pour forcer les versions numpy et faiss
# Installation des wheels pre-compilés pour éviter les problèmes de compilation
RUN pip install --upgrade pip \
    && pip install -r requirements.txt -t . --constraint constraints.txt --prefer-binary --only-binary=:all:

# Vérifier les dépendances
RUN pip check

# Définir le handler
CMD ["api.lambda_function.lambda_handler"]
