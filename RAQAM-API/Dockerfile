FROM public.ecr.aws/lambda/python:3.11

# Installer les outils de compilation nécessaires
RUN yum update -y && \
    yum install -y gcc gcc-c++ make curl && \
    yum clean all

# Installer Rust (nécessaire pour tiktoken)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Crée le répertoire de travail
WORKDIR /var/task

# Copier les fichiers
COPY src/ src/
COPY config/ config/
COPY api/lambda_function.py api/lambda_function.py
COPY requirements.txt .

# Installer les dépendances dans le bon dossier
RUN pip install --upgrade pip \
    && pip install -r requirements.txt -t .

# Vérifier les dépendances
RUN pip check

# Définir le handler
CMD ["api.lambda_function.lambda_handler"]
