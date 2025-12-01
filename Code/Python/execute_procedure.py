import fdb
import datetime

# Configurações de conexão
con = fdb.connect(
    dsn='localhost:C:/firebird/data/meubanco.fdb',
    user='SYSDBA',
    password='masterkey',
    charset='UTF8'
)

cur = con.cursor()

# Data/hora de início
inicio = datetime.datetime.now()

# Executa a procedure (exemplo com parâmetros)
# Substitua 'NOME_DA_PROCEDURE' e os parâmetros conforme sua procedure
cur.callproc('NOME_DA_PROCEDURE', [123, 'ABC'])

# Se a procedure retorna registros (selectable procedure)
linhas = cur.fetchall()
qtd_inseridas = len(linhas)

# Caso a procedure apenas insira dados e não retorne linhas:
# você pode usar qtd_inseridas = cur.rowcount

# Confirma transação
con.commit()

# Data/hora de fim
fim = datetime.datetime.now()

# Geração do log
with open("processo_log.txt", "a", encoding="utf-8") as log:
    log.write(f"Início: {inicio.strftime('%Y-%m-%d %H:%M:%S')}\n")
    log.write(f"Fim: {fim.strftime('%Y-%m-%d %H:%M:%S')}\n")
    log.write(f"Qtd linhas inseridas: {qtd_inseridas}\n")
    log.write("-" * 40 + "\n")

cur.close()