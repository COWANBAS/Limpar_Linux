#!/bin/bash

# Limpar cache de pacotes
echo "Limpando cache de pacotes..."
sudo apt-get clean
sudo apt-get autoclean

# Remover pacotes não utilizados
echo "Removendo pacotes não utilizados..."
sudo apt-get autoremove --purge -y

# Limpar conexões de pacotes ausentes
echo "Removendo pacotes ausentes..."
sudo apt-get autoremove --purge -y
sudo apt-get autoclean

# Limpar logs antigos
echo "Limpando logs antigos..."
sudo journalctl --vacuum-time=1d 

# Limpar logs de pacotes
echo "Limpando logs do pacote..."
sudo rm -f /var/log/apt/*.gz
sudo rm -f /var/log/apt/history.log.*
sudo rm -f /var/log/apt/term.log.*

# Limpar arquivos temporários
echo "Limpando arquivos temporários..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

# Limpar cache de navegadores (se aplicável)
echo "Limpando cache de navegadores..."
rm -rf ~/.cache/google-chrome/*
rm -rf ~/.cache/mozilla/*

# Limpar arquivos de "thumbnails"
echo "Limpando cache de thumbnails..."
rm -rf ~/.cache/thumbnails/*

# Limpar caches de pacotes snap (se usar Snap)
echo "Limpando cache do Snap..."
sudo rm -rf /var/snap/*

# Limpar arquivos de "spool" e "crash reports"
echo "Limpando arquivos de spool e crash reports..."
sudo rm -rf /var/spool/*
sudo rm -rf /var/crash/*

# Limpar pacotes não utilizados, se houver
echo "Removendo pacotes não utilizados..."
sudo deborphan | xargs sudo apt-get -y remove --purge

# Limpar cache do Snapd
echo "Limpando cache do Snapd..."
sudo rm -rf /var/cache/snapd/

# Limpar arquivos de configuração e pacotes não utilizados
echo "Removendo pacotes e configurações não utilizados..."
sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Limpar logs do sistema
echo "Limpando logs do sistema..."
sudo rm -rf /var/log/*.log*

# Limpar arquivos temporários e caches de fontes
echo "Limpando caches de fontes e arquivos temporários..."
rm -rf ~/.cache/fontconfig/*

# Limpar pacotes Flatpak não utilizados
echo "Removendo pacotes Flatpak não utilizados..."
flatpak uninstall --unused

# Limpar caches do Dns
sudo systemd-resolve --flush-caches

clear

echo "Limpeza concluída!"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
