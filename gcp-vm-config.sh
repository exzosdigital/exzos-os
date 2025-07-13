#!/bin/bash

# Script de configuração da VM GCP para ExzosOS

VM_NAME="exzos-hub-vm"
ZONE="us-central1-a"
PROJECT="exzosverce"

echo "🚀 Configurando VM GCP para ExzosOS..."

# 1. Conectar à VM
connect_vm() {
    echo "📡 Conectando à VM..."
    gcloud compute ssh $VM_NAME --zone=$ZONE
}

# 2. Copiar arquivos para a VM
copy_to_vm() {
    echo "📤 Copiando arquivos para a VM..."
    gcloud compute scp --recurse . $VM_NAME:~/exzos-os --zone=$ZONE
}

# 3. Configurar desenvolvimento remoto
setup_remote_dev() {
    echo "🔧 Configurando desenvolvimento remoto..."
    gcloud compute ssh $VM_NAME --zone=$ZONE --command="
        # Instalar Node.js 22
        curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
        sudo apt-get install -y nodejs
        
        # Instalar Yarn
        npm install -g yarn
        
        # Instalar dependências do projeto
        cd ~/exzos-os && yarn install
        
        # Instalar PM2 para gerenciar processos
        npm install -g pm2
        
        # Configurar firewall para desenvolvimento
        sudo ufw allow 3000:3010/tcp
        sudo ufw allow 8080:8090/tcp
        sudo ufw allow 5173/tcp
    "
}

# 4. Criar túnel SSH para desenvolvimento
create_tunnel() {
    echo "🌐 Criando túnel SSH..."
    gcloud compute ssh $VM_NAME --zone=$ZONE -- -L 3000:localhost:3000 -L 8080:localhost:8080 -L 5173:localhost:5173
}

# 5. Configurar SSH config local
setup_ssh_config() {
    echo "🔐 Configurando SSH..."
    cat >> ~/.ssh/config << EOF

# ExzosOS GCP VM
Host exzos-gcp
    HostName 35.225.93.223
    User $(whoami)
    IdentityFile ~/.ssh/google_compute_engine
    ForwardAgent yes
    LocalForward 3000 localhost:3000
    LocalForward 8080 localhost:8080
    LocalForward 5173 localhost:5173
    LocalForward 8081 localhost:8081
    ServerAliveInterval 60
    ServerAliveCountMax 10
EOF
}

# Menu principal
echo "
Escolha uma opção:
1. Conectar à VM
2. Copiar arquivos para VM
3. Configurar desenvolvimento remoto
4. Criar túnel SSH
5. Configurar SSH local
6. Executar setup completo
"

read -p "Opção: " choice

case $choice in
    1) connect_vm ;;
    2) copy_to_vm ;;
    3) setup_remote_dev ;;
    4) create_tunnel ;;
    5) setup_ssh_config ;;
    6) 
        copy_to_vm
        setup_remote_dev
        setup_ssh_config
        echo "✅ Setup completo! Use 'ssh exzos-gcp' para conectar"
        ;;
    *) echo "Opção inválida" ;;
esac