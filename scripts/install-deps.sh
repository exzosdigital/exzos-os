#!/bin/bash

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo "${BLUE}Instalando dependências necessárias...${NC}"

# Verificar e instalar Homebrew se necessário
if ! command -v brew &> /dev/null; then
    echo "${BLUE}Instalando Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Instalar dependências via Homebrew
echo "${BLUE}Instalando ferramentas via Homebrew...${NC}"
brew install jq mutagen-io/mutagen/mutagen

# Instalar Zed se não estiver instalado
if ! command -v zed &> /dev/null; then
    echo "${BLUE}Instalando Zed...${NC}"
    brew install --cask zed
fi

# Instalar Cursor se não estiver instalado
if ! command -v cursor &> /dev/null; then
    echo "${BLUE}Instalando Cursor...${NC}"
    brew install --cask cursor
fi

# Configurar diretórios necessários
echo "${BLUE}Configurando diretórios...${NC}"
mkdir -p ~/.config/zed
mkdir -p ~/.cursor/config
mkdir -p ~/.config/windsurf

echo "${GREEN}Todas as dependências foram instaladas!${NC}"
echo "${BLUE}Agora você pode executar:${NC}"
echo "yarn remote:setup"
