#!/bin/bash

echo "🔄 Atualizando projeto ZYNKO..."
echo ""

# Adiciona todas as mudanças
echo "📁 Adicionando mudanças..."
git add .

# Faz commit
echo "💾 Salvando mudanças..."
git commit -m "Atualização automática - $(date)"

# Faz push
echo "📤 Enviando para GitHub..."
git push

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Atualização realizada com sucesso!"
    echo ""
    echo "🌐 Seu site será atualizado em alguns minutos:"
    echo "https://nick-tcc.github.io/zynko-tcc"
    echo ""
    echo "⏰ Aguarde 2-5 minutos para ver as mudanças online."
else
    echo ""
    echo "❌ Erro na atualização. Verifique sua conexão."
fi 