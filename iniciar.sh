#!/bin/bash

echo "🚀 Iniciando projeto ZYNKO..."
echo ""

# Verifica se Python está instalado
if command -v python3 &> /dev/null; then
    echo "✅ Python encontrado"
    python3 server.py
elif command -v python &> /dev/null; then
    echo "✅ Python encontrado"
    python server.py
else
    echo "❌ Python não encontrado"
    echo ""
    echo "Alternativas:"
    echo "1. Abra o arquivo Zynko/index.html diretamente no navegador"
    echo "2. Use um servidor local como Live Server (VS Code)"
    echo "3. Instale Python: https://www.python.org/downloads/"
    echo ""
    echo "Pressione Enter para abrir o arquivo HTML..."
    read
    open Zynko/index.html
fi 