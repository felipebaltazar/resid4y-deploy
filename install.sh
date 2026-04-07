#!/bin/bash
# Instalador RESID4Y para Raspberry Pi
# Uso: curl -sSL https://raw.githubusercontent.com/felipebaltazar/resid4y-deploy/main/install.sh | bash

set -e

echo ""
echo "==========================================================="
echo "  INSTALANDO RESID4Y NO RASPBERRY PI"
echo "==========================================================="
echo ""

DEST="$HOME/resid4y"
URL=$(curl -s https://api.github.com/repos/felipebaltazar/resid4y-deploy/releases/latest | grep "browser_download_url.*tar.gz" | head -1 | cut -d '"' -f 4)

if [ -z "$URL" ]; then
    echo "  [ERRO] Nao encontrou a release no GitHub!"
    exit 1
fi

echo "  Baixando..."
curl -L -o /tmp/resid4y.tar.gz "$URL"

echo "  Instalando em $DEST..."
mkdir -p "$DEST"
tar -xzf /tmp/resid4y.tar.gz -C "$DEST"
chmod +x "$DEST"/RESID4Y*
rm -f /tmp/resid4y.tar.gz

echo ""
echo "  [OK] Instalado com sucesso!"
echo ""
echo "  Para rodar:"
echo "    cd $DEST && sudo ./RESID4Y*"
echo ""
echo "==========================================================="
echo ""

cd "$DEST" && sudo ./RESID4Y*
