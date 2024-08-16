# Use a imagem base do Flutter mais recente
FROM cirrusci/flutter:latest

# Defina o diretório de trabalho
WORKDIR /app

# Copie todos os arquivos do projeto para o container
COPY . .

# Defina o canal do Flutter para 'stable' e instale as dependências
RUN flutter channel stable && \
    flutter config --enable-web && \
    flutter pub get

# Compile o projeto Flutter para a Web
RUN flutter build web

# Exponha a porta 8080 para acessar a aplicação web
EXPOSE 8080

# Use o servidor HTTP simples do Python para servir a aplicação
CMD ["python3", "-m", "http.server", "8080", "-d", "build/web"]
