#!/bin/bash

# Limpar cache de pacotes
echo "Limpando cache de pacotes..."
sudo apt-get clean
sudo apt-get autoclean

# Remover pacotes não utilizados
echo "Removendo pacotes não utilizados..."
sudo apt-get autoremove --purge -y
sudo apt-get autoremove
sudo apt-get remove

# Limpar conexões de pacotes ausentes
echo "Removendo pacotes ausentes..."
sudo apt-get autoremove --purge -y
sudo apt-get autoclean
sudo apt-get clean

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

# Limpar cache de navegadores 
echo "Limpando cache de navegadores..."
rm -rf ~/.cache/google-chrome/*
rm -rf ~/.cache/mozilla/*
rm -rf ~/.cache/min/*

# Limpar arquivos de "thumbnails"
echo "Limpando cache de thumbnails..."
rm -rf ~/.cache/thumbnails/*
rm -rf ~/.cache/thumbnails/fail/*
rm -rf ~/.cache/thumbnails/large/*

# Limpar arquivos de "spool" e "crash reports"
echo "Limpando arquivos de spool e crash reports..."
sudo rm -rf /var/spool/*
sudo rm -rf /var/crash/*

# Limpar arquivos temporários do wine
echo "Limpando arquivos temporário do wine..."
rm -rf ~/.wine/dosdevices/c:/windows/temp*
rm -rf ~/.wine/drive_c/users/cowanbas/AppData/Local/Temp*
rm -rf ~/.wine/drive_c/users/cowanbas/AppData/Roaming/Microsoft/Windows/Recent/*

# Limpar pacotes orfãos, se houver
echo "Removendo pacotes orfãos..."
sudo apt-get autoremove --purge -y

# Limpar arquivos de configuração e pacotes não utilizados
echo "Removendo pacotes e configurações não utilizados..."
sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Limpar logs do sistema
echo "Limpando logs do sistema..."
sudo rm -rf /var/log/*.log*

# Limpar arquivos temporários e caches de fontes
echo "Limpando caches de fontes e arquivos temporários..."
rm -rf ~/.cache/fontconfig/*

# Limpar caches do Dns
sudo systemd-resolve --flush-caches

clear

echo "Limpeza concluída!"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
