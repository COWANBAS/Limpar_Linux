#!/bin/bash

# Atualizar repositórios
echo "Atualizando repositórios..."
sudo apt update

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
sudo journalctl --vacuum-time=3d  # Remove logs de sistema com mais de 3 dias

# Limpar arquivos temporários
echo "Limpando arquivos temporários..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

# Limpar cache de navegadores (se aplicável)
echo "Limpando cache de navegadores..."
rm -rf ~/.cache/google-chrome/*
rm -rf ~/.cache/mozilla/*
rm -rf ~/.cache/min/*  # Limpar cache do Min Browser

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

# Limpar pacotes órfãos, se houver
echo "Removendo pacotes órfãos..."
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

# Limpar logs e caches na pasta home do usuário
echo "Limpando logs e arquivos de cache da pasta home..."
rm -rf ~/.local/share/Trash/*        # Limpar itens da lixeira
rm -rf ~/.cache/*                    # Limpar cache de aplicativos gerais
rm -rf ~/.local/share/gnome-shell/*  # Limpar cache do GNOME Shell 
rm -rf ~/.dbus/*                     # Limpar caches do DBus

# Limpar ambientes virtuais Python (se houver)
echo "Limpeza de ambientes virtuais do Python..."
find ~ -type d -name "venv" -exec rm -rf {} \;  # Limpa qualquer diretório de ambiente virtuais

# Limpar histórico de comandos do terminal
echo "Limpando histórico de comandos do terminal..."
history -c  # Limpa o histórico atual da sessão
rm -f ~/.bash_history  # Remove o arquivo de histórico do bash
touch ~/.bash_history  # Cria um novo arquivo de histórico vazio

# Limpar caches e dados do Wine
echo "Limpando cache e logs do Wine..."

# Limpar cache de aplicativos do Wine
rm -rf ~/.cache/wine/            # Limpa o cache dos aplicativos executados via Wine
rm -rf ~/.wine/drive_c/users/$USER/Application\ Data/*  # Limpa cache de dados do Windows

# Limpar logs do Wine (se existirem)
rm -rf ~/.wine/drive_c/users/$USER/Local\ Settings/Temp/*  # Limpa arquivos temporários do Wine
rm -rf ~/.wine/drive_c/users/$USER/Local\ Settings/History/*  # Limpa histórico do Wine

clear

echo "Limpeza concluída!"

read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
