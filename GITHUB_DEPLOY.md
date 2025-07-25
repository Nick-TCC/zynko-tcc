# 🚀 Guia Completo: Deploy no GitHub Pages

## Passo a Passo Detalhado

### **1. Criar conta no GitHub**
- Acesse: https://github.com
- Clique em "Sign up" e crie sua conta gratuita

### **2. Criar repositório**
1. Clique no botão verde "New repository"
2. **Repository name:** `zynko-tcc`
3. **Description:** "Projeto ZYNKO - Soluções acessíveis com IA para TCC"
4. **Visibility:** Public ✅
5. **NÃO** marque "Add a README file" (já temos)
6. Clique "Create repository"

### **3. Fazer upload do projeto**

**Opção A: Via Terminal (Recomendado)**
```bash
# Comando já configurado para Nick-TCC
git remote set-url origin https://github.com/Nick-TCC/zynko-tcc.git
git push -u origin main
```

**Opção B: Via Interface Web**
1. No repositório criado, clique em "uploading an existing file"
2. Arraste a pasta `Zynko/` para o repositório
3. Adicione uma mensagem de commit: "Primeira versão do projeto ZYNKO"
4. Clique "Commit changes"

### **4. Ativar GitHub Pages**
1. Vá em **Settings** (aba do repositório)
2. Role até **Pages** (menu lateral esquerdo)
3. Em **Source**, selecione **Deploy from a branch**
4. Em **Branch**, selecione **main** e **/(root)**
5. Clique **Save**

### **5. Configurar branch principal**
1. Vá em **Settings** → **Pages**
2. Em **Branch**, selecione **main**
3. Clique **Save**

## 🎯 **URL que você vai receber:**

Após configurar, seu site ficará disponível em:
```
https://nick-tcc.github.io/zynko-tcc
```

**URL específica para Nick-TCC:**
```
https://nick-tcc.github.io/zynko-tcc
```

## ⚡ **Comandos para fazer upload:**

```bash
# 1. Configure seu usuário (substitua pelos seus dados)
git config --global user.name "Seu Nome"
git config --global user.email "seu-email@exemplo.com"

# 2. Adicione o repositório remoto (já configurado para Nick-TCC)
git remote set-url origin https://github.com/Nick-TCC/zynko-tcc.git

# 3. Faça o push
git push -u origin main
```

## 🔧 **Estrutura correta no GitHub:**

O GitHub Pages precisa que o arquivo `index.html` esteja na raiz. Vamos ajustar:

```bash
# Mova os arquivos para a raiz
git mv Zynko/* .
rmdir Zynko
git add .
git commit -m "Ajusta estrutura para GitHub Pages"
git push
```

## ✅ **Checklist final:**

- [ ] Conta GitHub criada
- [ ] Repositório criado
- [ ] Arquivos enviados
- [ ] GitHub Pages ativado
- [ ] Site funcionando em `https://nick-tcc.github.io/zynko-tcc`

## 🆘 **Se algo der errado:**

1. **Verifique se o repositório é público**
2. **Aguarde alguns minutos** - o deploy pode demorar
3. **Verifique se o arquivo `index.html` está na raiz**
4. **Teste a URL:** `https://nick-tcc.github.io/zynko-tcc`

---

**🎉 Pronto! Seu site estará online e acessível de qualquer dispositivo!** 