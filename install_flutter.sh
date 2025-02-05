#!/bin/bash

# Instalação do Flutter
if [ ! -d "flutter" ]; then 
  git clone https://github.com/flutter/flutter.git 
fi

cd flutter && git pull

# Adiciona o Flutter ao PATH
export PATH="$PWD/bin:$PATH"

# Configuração e dependências
flutter config --enable-web
flutter doctor
sed -i 's/collection: .*/collection: ^1.18.0/' ../pubspec.yaml
flutter pub get
