#!/bin/bash

# Remover pacotes não utilizados
echo "Removendo pacotes não utilizados..."
sudo apt-get autoremove --purge -y
sudo apt-get autoremove
sudo apt-get remove

# Limpar cache de pacotes
echo "Limpando cache de pacotes..."
sudo apt-get autoclean
sudo apt-get clean

# Limpar pacotes ausentes
echo "Removendo pacotes ausentes..."
sudo apt-get autoremove --purge -y
sudo apt-get autoclean
sudo apt-get clean

# Limpar logs do sistema
echo "Limpando logs do sistema..."
sudo journalctl --rotate && sudo journalctl --vacuum-time=1s
sudo rm -rf /var/log/*.log*

# Limpando comandos do terminal
echo "Limpando comandos do terminal..."
sudo rm -rf ~/.bash_history*

# Limpar logs de pacotes
echo "Limpando logs do pacote..."
sudo rm -f /var/log/apt/history.log.*
sudo rm -f /var/log/apt/term.log.*
sudo rm -f /var/log/apt/*.gz

# Limpar relatório de erros
echo "Limpando relatório de erros..."
sudo rm -f ~/.xsession-errors*

# Limpar arquivos temporários
echo "Limpando arquivos temporários..."
sudo rm -rf /var/cache/apt/*
sudo rm -rf /var/tmp/*
sudo rm -rf /tmp/*

# Limpar cache de navegadores 
echo "Limpando cache de navegadores..."
sudo rm -rf ~/.cache/google-chrome/*
sudo rm -rf ~/.config/Min/Cache*
sudo rm -rf ~/.cache/mozilla/*
sudo rm -rf ~/.cache/min/*

# Limpar arquivos de "thumbnails"
echo "Limpando cache de thumbnails..."
sudo rm -rf ~/.cache/thumbnails/large/*
sudo rm -rf ~/.cache/thumbnails/fail/*
sudo rm -rf ~/.cache/thumbnails/*

# Limpar arquivos de "spool" e "crash reports"
echo "Limpando arquivos de spool e crash reports..."
sudo rm -rf /var/spool/*
sudo rm -rf /var/crash/*

# Limpar arquivos temporários do wine
echo "Limpando arquivos temporário do wine..."
sudo rm -rf ~/.wine/drive_c/users/*/AppData/Roaming/Microsoft/Windows/Recent/*
sudo rm -rf ~/.wine/drive_c/users/*/AppData/Local/Temp*
sudo rm -rf ~/.wine/dosdevices/c:/windows/temp*

# Limpar arquivos de configuração e pacotes não utilizados
echo "Removendo pacotes e configurações não utilizados..."
sudo rm -rf /var/lib/apt/lists/*

# Limpar arquivos temporários e caches de fontes
echo "Limpando caches de fontes e arquivos temporários..."
sudo rm -rf ~/.cache/fontconfig/*

# Limpar caches do Dns
sudo resolvectl flush-caches
sudo systemctl restart systemd-resolved

# Limpar cache do pip
echo "Limpando caches do pip..."
sudo pip3 cache purge

clear

echo "Limpeza concluída!"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
