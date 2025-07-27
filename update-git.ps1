# Script para atualizar o Git com as melhorias do site ZYNKO
# Autor: Assistente IA
# Data: $(Get-Date)

Write-Host "🚀 Atualizando repositório Git para o projeto ZYNKO" -ForegroundColor Green
Write-Host ""

# Verificar se o Git está instalado
$gitPath = $null
$possiblePaths = @(
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe",
    "$env:USERPROFILE\AppData\Local\Programs\Git\bin\git.exe"
)

foreach ($path in $possiblePaths) {
    if (Test-Path $path) {
        $gitPath = $path
        break
    }
}

if ($gitPath) {
    Write-Host "✅ Git encontrado em: $gitPath" -ForegroundColor Green
} else {
    Write-Host "❌ Git não encontrado no sistema" -ForegroundColor Red
    Write-Host ""
    Write-Host "📥 Para instalar o Git:" -ForegroundColor Yellow
    Write-Host "1. Acesse: https://git-scm.com/download/win" -ForegroundColor Cyan
    Write-Host "2. Baixe e instale o Git para Windows" -ForegroundColor Cyan
    Write-Host "3. Execute este script novamente" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "🔄 Ou use o comando manual:" -ForegroundColor Yellow
    Write-Host "winget install --id Git.Git -e --source winget" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Pressione Enter para continuar..."
    exit
}

# Função para executar comandos Git
function Invoke-GitCommand {
    param([string]$Command)
    $fullCommand = "& '$gitPath' $Command"
    Write-Host "Executando: git $Command" -ForegroundColor Blue
    Invoke-Expression $fullCommand
}

# Verificar status do repositório
Write-Host "📊 Verificando status do repositório..." -ForegroundColor Yellow
Invoke-GitCommand "status"

# Adicionar todos os arquivos modificados
Write-Host ""
Write-Host "📁 Adicionando arquivos modificados..." -ForegroundColor Yellow
Invoke-GitCommand "add ."

# Verificar o que foi adicionado
Write-Host ""
Write-Host "📋 Arquivos que serão commitados:" -ForegroundColor Yellow
Invoke-GitCommand "status"

# Fazer o commit
$commitMessage = "feat: implementar melhorias completas do site ZYNKO

✅ Prioridade Alta:
- Adicionar imagens reais nos placeholders
- Implementar menu mobile responsivo
- Adicionar favicon e meta tags SEO
- Conectar formulário a backend real

✅ Prioridade Média:
- Adicionar animações de entrada
- Implementar lazy loading para imagens
- Adicionar analytics (Google Analytics)
- Otimizar para SEO

✅ Prioridade Baixa:
- Adicionar mais interatividade com JavaScript
- Implementar dark mode
- Adicionar blog/seção de conteúdo
- Integrar com redes sociais

🎨 Melhorias implementadas:
- Design responsivo completo
- Backend Python funcional
- SEO otimizado
- Performance melhorada
- Dark mode com preferência salva
- Animações e interatividade"

Write-Host ""
Write-Host "💾 Fazendo commit das melhorias..." -ForegroundColor Yellow
Invoke-GitCommand "commit -m `"$commitMessage`""

# Verificar se há um remote configurado
Write-Host ""
Write-Host "🌐 Verificando repositório remoto..." -ForegroundColor Yellow
$remote = Invoke-GitCommand "remote -v" | Out-String

if ($remote -match "origin") {
    Write-Host "✅ Repositório remoto encontrado" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 Fazendo push para o repositório remoto..." -ForegroundColor Yellow
    Invoke-GitCommand "push origin main"
} else {
    Write-Host "⚠️  Nenhum repositório remoto configurado" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "📝 Para configurar um repositório remoto:" -ForegroundColor Cyan
    Write-Host "git remote add origin https://github.com/seu-usuario/zynko-tcc.git" -ForegroundColor Gray
    Write-Host "git push -u origin main" -ForegroundColor Gray
}

Write-Host ""
Write-Host "🎉 Atualização do Git concluída!" -ForegroundColor Green
Write-Host "📊 Para ver o histórico de commits: git log --oneline" -ForegroundColor Cyan 