FROM mcr.microsoft.com/devcontainers/typescript-node:22

# Instalar dependências adicionais
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        build-essential \
        curl \
        git \
        gnupg2 \
        lsb-release \
        software-properties-common \
        unzip \
        wget \
        vim \
        htop \
        tree \
        jq \
    && apt-get autoremove -y && apt-get clean -y

# Instalar Google Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update \
    && apt-get install -y google-cloud-cli

# Instalar Yarn versão específica
RUN npm install -g yarn@1.22.19

# Instalar Turbo globalmente
RUN npm install -g turbo@latest

# Configurar Git para contêiner
RUN git config --global init.defaultBranch main

# Criar diretórios de trabalho
RUN mkdir -p /workspace
WORKDIR /workspace

# Configurar usuário vscode
USER vscode