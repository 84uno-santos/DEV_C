import os
import subprocess
import sys

# Caminho padrão do Git Bash no Windows
DEFAULT_GIT_BASH_PATH = r"C:\Program Files\Git\git-bash.exe"

def run_command(command_list, check_result=True):
    """Executa um comando no terminal (usando o binário do git) e verifica o resultado."""
    try:
        # Usa shell=True para comandos complexos (como o mergetool.cmd com variáveis)
        # Embora subprocess.run seja mais seguro, aqui optamos pela compatibilidade do comando
        result = subprocess.run(command_list, check=check_result, capture_output=True, text=True)
        if result.stderr:
            # Emite stderr apenas se houver erro
            if check_result and result.returncode != 0:
                print(f"[ERRO] Comando falhou: {' '.join(command_list)}\n{result.stderr}")
        return result
    except FileNotFoundError:
        print("\n[ERRO CRÍTICO] O comando 'git' não foi encontrado no PATH do sistema.")
        print("Certifique-se de que o Git esteja instalado e adicionado ao seu PATH.")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(f"\n[ERRO] O comando Git retornou um erro: {e}")
        sys.exit(1)


def get_git_bash_path():
    """Verifica e solicita interativamente o caminho completo para o git-bash.exe."""
    if os.path.exists(DEFAULT_GIT_BASH_PATH):
        print(f"[*] Git Bash encontrado no caminho padrão: {DEFAULT_GIT_BASH_PATH}")
        return DEFAULT_GIT_BASH_PATH
    else:
        print("\n[AVISO] Git Bash não encontrado no caminho padrão.")
        while True:
            path = input(f"Por favor, digite o caminho COMPLETO para o git-bash.exe (Ex: D:\\Git\\git-bash.exe): ")
            if os.path.exists(path):
                return path
            else:
                print("[ERRO] Caminho inválido. Verifique o caminho e tente novamente.")


def main():
    # ------------------------------------------------------------
    # 1. OBTER ENTRADAS INTERATIVAS
    # ------------------------------------------------------------
    print("=====================================================")
    print("       Configurador Automatizado de Ambiente Git")
    print("=====================================================")
    folder_name = input("1. Digite o nome da PASTA a ser criada: ")
    user_name = input("2. Digite o NOME DE USUARIO (user.name): ")
    user_email = input("3. Digite o EMAIL (user.email): ")
    repo_url = input("4. Digite a URL do REPOSITORIO (Clone URL): ")

    if not all([folder_name, user_name, user_email, repo_url]):
        print("[ERRO] Todos os campos são obrigatórios. Abortando.")
        sys.exit(1)

    # ------------------------------------------------------------
    # 2. CONFIGURAÇÕES GLOBAIS (VS Code Mergetool e Editor)
    # ------------------------------------------------------------
    print("\n--- Configurando VS Code como editor e mergetool GLOBALMENTE ---")
    
    # core.editor (para rebase, commit messages, etc.)
    run_command(['git', 'config', '--global', 'core.editor', 'code --wait'], check_result=False)
    
    # merge.tool (ferramenta padrão para resolver conflitos de merge)
    run_command(['git', 'config', '--global', 'merge.tool', 'vscode'], check_result=False)
    
    # mergetool.vscode.cmd (o comando exato que o VS Code deve usar)
    # Usamos shell=True para garantir que as variáveis do shell do Git (\$REMOTE, \$BASE, etc.) sejam interpretadas corretamente.
    run_command(f'git config --global mergetool.vscode.cmd "code --wait --merge \$REMOTE \$BASE \$LOCAL \$MERGED"', shell=True, check_result=False)
    
    # mergetool.keepbackup (limpa os arquivos de backup .orig após o merge)
    run_command(['git', 'config', '--global', 'mergetool.keepbackup', 'false'], check_result=False)
    
    print("[+] Configurações globais concluídas.")

    # ------------------------------------------------------------
    # 3. CRIAÇÃO, CLONE E CONFIGURAÇÕES LOCAIS
    # ------------------------------------------------------------
    
    print(f"\n--- Criando e Clonando o Repositório em '{folder_name}' ---")
    
    # Cria a pasta se não existir
    os.makedirs(folder_name, exist_ok=True)
    os.chdir(folder_name)
    
    # Clonar o repositório no diretório atual (.)
    run_command(["git", "clone", repo_url, "."])
    
    # Configurar user.name e user.email LOCALMENTE (dentro do repositório clonado)
    print("[+] Configurando user.name local...")
    run_command(["git", "config", "user.name", user_name])
    
    print("[+] Configurando user.email local...")
    run_command(["git", "config", "user.email", user_email])
    
    print("\n[SUCESSO] Repositório configurado e pronto para uso!")

    # ------------------------------------------------------------
    # 4. ABRIR GIT BASH
    # ------------------------------------------------------------
    git_bash_path = get_git_bash_path()
    
    print(f"\n--- Abrindo Git Bash na pasta '{folder_name}' ---")
    
    # Abre o Git Bash na pasta atual. Popen não bloqueia o script, permitindo que o Python saia.
    subprocess.Popen([git_bash_path], cwd=os.getcwd())
    
    print("Script finalizado. O terminal Git Bash foi aberto.")


if __name__ == "__main__":
    main()
