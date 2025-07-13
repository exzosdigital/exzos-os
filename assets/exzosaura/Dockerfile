# Use uma imagem base leve do Nginx
FROM nginx:alpine

# Copie o arquivo de configuração personalizado do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copie todos os ativos de branding para o diretório web do Nginx
COPY . /usr/share/nginx/html

# Exponha a porta 80
EXPOSE 80
