#!/usr/bin/env python3
"""
Servidor local simples para o projeto ZYNKO
Útil para apresentações e desenvolvimento
"""

import http.server
import socketserver
import webbrowser
import os
from pathlib import Path

# Configurações
PORT = 8000
DIRECTORY = Path(__file__).parent

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(DIRECTORY), **kwargs)

def main():
    # Muda para o diretório atual
    os.chdir(DIRECTORY)
    
    # Cria o servidor
    with socketserver.TCPServer(("", PORT), CustomHTTPRequestHandler) as httpd:
        print(f"🚀 Servidor iniciado em http://localhost:{PORT}")
        print(f"📁 Servindo arquivos de: {DIRECTORY}")
        print("🔄 Pressione Ctrl+C para parar o servidor")
        
        # Abre o navegador automaticamente
        webbrowser.open(f"http://localhost:{PORT}")
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n👋 Servidor parado!")

if __name__ == "__main__":
    main() 