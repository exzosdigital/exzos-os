#!/bin/bash

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

# Carregar configurações
CONFIG_FILE="../.remote-config.json"
HOST=$(jq -r '.remoteSettings.host' "$CONFIG_FILE")
USERNAME=$(jq -r '.remoteSettings.username' "$CONFIG_FILE")
SSH_KEY=$(jq -r '.remoteSettings.sshKeyPath' "$CONFIG_FILE")
WORKSPACE=$(jq -r '.remoteSettings.workspaceRoot' "$CONFIG_FILE")

# Função para configurar túneis SSH
setup_ssh_tunnels() {
    echo "${BLUE}Configurando túneis SSH...${NC}"
    
    # Verificar se já existe uma conexão
    if pgrep -f "ssh.*$HOST" > /dev/null; then
        echo "${RED}Conexão SSH já existe. Fechando...${NC}"
        pkill -f "ssh.*$HOST"
    fi
    
    # Configurar túneis SSH para cada editor
    ssh -N -L 3000:localhost:3000 \
           -L 3001:localhost:3001 \
           -L 3002:localhost:3002 \
           -i "$SSH_KEY" \
           -o ServerAliveInterval=60 \
           "$USERNAME@$HOST" &
    
    echo "${GREEN}Túneis SSH configurados!${NC}"
}

# Função para sincronizar arquivos
setup_sync() {
    echo "${BLUE}Configurando sincronização...${NC}"
    
    # Criar diretório remoto se não existir
    ssh -i "$SSH_KEY" "$USERNAME@$HOST" "mkdir -p $WORKSPACE"
    
    # Configurar sincronização bidirecional com mutagen
    mutagen sync create \
        --name="exzos-remote" \
        --ignore-vcs \
        --ignore="node_modules" \
        --ignore="dist" \
        --ignore=".turbo" \
        ./ \
        "$USERNAME@$HOST:$WORKSPACE"
    
    echo "${GREEN}Sincronização configurada!${NC}"
}

# Função para configurar editores
setup_editors() {
    echo "${BLUE}Configurando editores...${NC}"
    
    # Configurar Zed
    mkdir -p ~/.config/zed
    cat > ~/.config/zed/settings.json <<EOF
{
    "remote": {
        "hostname": "$HOST",
        "username": "$USERNAME",
        "directory": "$WORKSPACE"
    }
}
EOF
    
    # Configurar Cursor
    mkdir -p ~/.cursor/config
    cat > ~/.cursor/config/remote.json <<EOF
{
    "host": "$HOST",
    "user": "$USERNAME",
    "workspace": "$WORKSPACE",
    "port": 3001
}
EOF
    
    # Configurar WindSurf
    mkdir -p ~/.config/windsurf
    cat > ~/.config/windsurf/config.json <<EOF
{
    "remote": {
        "host": "$HOST",
        "user": "$USERNAME",
        "root": "$WORKSPACE",
        "port": 3002
    }
}
EOF
    
    echo "${GREEN}Editores configurados!${NC}"
}

# Função principal
main() {
    echo "${BLUE}Iniciando configuração do ambiente remoto...${NC}"
    
    # Verificar dependências
    command -v jq >/dev/null 2>&1 || { echo "${RED}jq não está instalado. Instalando...${NC}"; brew install jq; }
    command -v mutagen >/dev/null 2>&1 || { echo "${RED}mutagen não está instalado. Instalando...${NC}"; brew install mutagen-io/mutagen/mutagen; }
    
    # Configurar tudo
    setup_ssh_tunnels
    setup_sync
    setup_editors
    
    echo "${GREEN}Configuração completa!${NC}"
    echo "${BLUE}Para conectar:${NC}"
    echo "1. Zed: Command + Shift + P -> 'Connect to Remote'"
    echo "2. Cursor: Menu -> Connect -> Remote Server"
    echo "3. WindSurf: Click no ícone de conexão remota"
}

# Executar
main
