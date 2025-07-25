#!/bin/bash

echo "🚀 Deploy do projeto ZYNKO para GitHub Pages"
echo "👤 Usuário: Nick-TCC"
echo ""

# Verifica se git está configurado
if ! git config --get user.name > /dev/null; then
    echo "⚠️  Git não está configurado. Configure primeiro:"
    echo "git config --global user.name 'Seu Nome'"
    echo "git config --global user.email 'seu-email@exemplo.com'"
    echo ""
    read -p "Pressione Enter para continuar..."
fi

# Verifica se o repositório remoto está configurado
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "🔧 Configurando repositório remoto..."
    git remote add origin https://github.com/Nick-TCC/zynko-tcc.git
fi

echo "📤 Fazendo upload para GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Upload realizado com sucesso!"
    echo ""
    echo "🎯 Próximos passos:"
    echo "1. Acesse: https://github.com/Nick-TCC/zynko-tcc"
    echo "2. Vá em Settings → Pages"
    echo "3. Em Source, selecione 'Deploy from a branch'"
    echo "4. Em Branch, selecione 'main'"
    echo "5. Clique Save"
    echo ""
    echo "🌐 Seu site ficará disponível em:"
    echo "https://nick-tcc.github.io/zynko-tcc"
    echo ""
    echo "⏰ Aguarde alguns minutos para o deploy ser concluído."
else
    echo ""
    echo "❌ Erro no upload. Verifique:"
    echo "1. Se você tem acesso ao repositório"
    echo "2. Se o repositório foi criado no GitHub"
    echo "3. Se sua conta está logada no git"
fi 