#!/bin/bash

# Remover qualquer instalação anterior do .NET SDK
sudo apt-get remove --purge -y 'dotnet*'
sudo rm -rf /usr/share/dotnet /etc/dotnet /usr/lib/dotnet /usr/local/share/dotnet
sudo rm -rf ~/.dotnet

# Instalar dependências necessárias
sudo apt-get update
sudo apt-get install -y apt-transport-https

# Adicionar o feed de pacotes do Microsoft
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Atualizar os repositórios
sudo apt-get update

# Instalar o .NET SDK 8.0
sudo apt-get install -y dotnet-sdk-8.0

# Verificar a instalação
dotnet --version
