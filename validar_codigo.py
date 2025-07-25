#!/usr/bin/env python3
"""
Script para validar o código HTML e CSS
"""

import re
import os

def validar_html():
    print("🔍 Validando HTML...")
    
    with open('index.html', 'r', encoding='utf-8') as f:
        html = f.read()
    
    # Verificar tags não fechadas
    tags_abertas = re.findall(r'<([a-zA-Z][a-zA-Z0-9]*)[^>]*>', html)
    tags_fechadas = re.findall(r'</([a-zA-Z][a-zA-Z0-9]*)>', html)
    
    # Verificar se há tags não fechadas
    for tag in tags_abertas:
        if tag not in ['img', 'br', 'hr', 'input', 'meta', 'link']:
            if f'</{tag}>' not in html:
                print(f"⚠️  Tag não fechada: {tag}")
    
    # Verificar classes CSS
    classes = re.findall(r'class="([^"]*)"', html)
    print(f"✅ Encontradas {len(classes)} classes CSS")
    
    return True

def validar_css():
    print("🔍 Validando CSS...")
    
    with open('styles.css', 'r', encoding='utf-8') as f:
        css = f.read()
    
    # Verificar se há chaves não fechadas
    chaves_abertas = css.count('{')
    chaves_fechadas = css.count('}')
    
    if chaves_abertas != chaves_fechadas:
        print(f"⚠️  Chaves não balanceadas: {chaves_abertas} abertas, {chaves_fechadas} fechadas")
        return False
    
    # Verificar seletores CSS
    seletores = re.findall(r'([.#][a-zA-Z][a-zA-Z0-9_-]*)\s*{', css)
    print(f"✅ Encontrados {len(seletores)} seletores CSS")
    
    return True

def verificar_arquivos():
    print("🔍 Verificando arquivos...")
    
    arquivos_necessarios = ['index.html', 'styles.css']
    
    for arquivo in arquivos_necessarios:
        if os.path.exists(arquivo):
            tamanho = os.path.getsize(arquivo)
            print(f"✅ {arquivo}: {tamanho} bytes")
        else:
            print(f"❌ {arquivo} não encontrado")
            return False
    
    return True

def main():
    print("🚀 Iniciando validação do código...")
    print("=" * 50)
    
    # Verificar arquivos
    if not verificar_arquivos():
        print("❌ Problema com arquivos")
        return
    
    # Validar HTML
    if not validar_html():
        print("❌ Problema no HTML")
        return
    
    # Validar CSS
    if not validar_css():
        print("❌ Problema no CSS")
        return
    
    print("=" * 50)
    print("✅ Código validado com sucesso!")
    print("🌐 Site pronto para uso")

if __name__ == "__main__":
    main() 