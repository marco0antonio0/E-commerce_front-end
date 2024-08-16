# Use a imagem oficial do Dart que suporta a versão >=3.4.1
FROM dart:stable

# Instale o Flutter manualmente
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter

# Defina o Flutter no PATH
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Verifique se o Flutter está utilizando a versão correta do Dart
RUN flutter doctor -v

# Defina o diretório de trabalho
WORKDIR /app

# Copie o projeto para o container
COPY . .

# Instale as dependências
RUN flutter pub get

# Exponha a porta onde a aplicação irá rodar
EXPOSE 3005

# Comando para iniciar o servidor
CMD ["flutter", "run", "-d", "web-server", "--release", "--web-hostname=0.0.0.0", "--web-port=3005"]
