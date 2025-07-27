#!/usr/bin/env python3
"""
Servidor local simples para o projeto ZYNKO
Útil para apresentações e desenvolvimento
"""

import http.server
import socketserver
import webbrowser
import os
import json
import urllib.parse
from pathlib import Path
from datetime import datetime

# Configurações
PORT = 8000
DIRECTORY = Path(__file__).parent

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(DIRECTORY), **kwargs)
    
    def do_POST(self):
        if self.path == '/contato':
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            
            # Decodificar dados do formulário
            form_data = urllib.parse.parse_qs(post_data.decode('utf-8'))
            
            # Extrair informações do formulário
            nome = form_data.get('nome', [''])[0]
            email = form_data.get('email', [''])[0]
            telefone = form_data.get('telefone', [''])[0]
            plano = form_data.get('plano', [''])[0]
            mensagem = form_data.get('mensagem', [''])[0]
            
            # Salvar dados em arquivo (simulando banco de dados)
            contato_data = {
                'timestamp': datetime.now().isoformat(),
                'nome': nome,
                'email': email,
                'telefone': telefone,
                'plano': plano,
                'mensagem': mensagem
            }
            
            # Salvar em arquivo JSON
            try:
                with open('contatos.json', 'a', encoding='utf-8') as f:
                    f.write(json.dumps(contato_data, ensure_ascii=False) + '\n')
                
                # Resposta de sucesso
                self.send_response(200)
                self.send_header('Content-type', 'application/json')
                self.send_header('Access-Control-Allow-Origin', '*')
                self.end_headers()
                
                response = {
                    'success': True,
                    'message': 'Mensagem enviada com sucesso! Entraremos em contato em breve.'
                }
                self.wfile.write(json.dumps(response).encode())
                
            except Exception as e:
                # Resposta de erro
                self.send_response(500)
                self.send_header('Content-type', 'application/json')
                self.send_header('Access-Control-Allow-Origin', '*')
                self.end_headers()
                
                response = {
                    'success': False,
                    'message': 'Erro ao enviar mensagem. Tente novamente.'
                }
                self.wfile.write(json.dumps(response).encode())
        else:
            self.send_response(404)
            self.end_headers()
    
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

def main():
    # Muda para o diretório atual
    os.chdir(DIRECTORY)
    
    # Cria o servidor
    with socketserver.TCPServer(("", PORT), CustomHTTPRequestHandler) as httpd:
        print(f"🚀 Servidor iniciado em http://localhost:{PORT}")
        print(f"📁 Servindo arquivos de: {DIRECTORY}")
        print("📝 Formulário de contato ativo em /contato")
        print("🔄 Pressione Ctrl+C para parar o servidor")
        
        # Abre o navegador automaticamente
        webbrowser.open(f"http://localhost:{PORT}")
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n👋 Servidor parado!")

if __name__ == "__main__":
    main() 