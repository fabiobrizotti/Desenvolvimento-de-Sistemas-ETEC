"""
# Exemplo de Hash usando = hash()
text = (input("Digite um texto para gerar um hash: "))
# Gerando o hash do texto
valorHash = hash(text)
# Mostrando o valor do hash
print(f"O hash do texto '{text}' é: {valorHash}")
"""

"""
    # Exemplos de saída usando hash() no nome "Fabio"
    -3061353574513427986 = Fabio
    -3124702359818629456 = Fabio
"""

"""
# Exemplo de Hash usando = SHA-256
import hashlib

# Texto para gerar o hash
text = input("Digite um texto para gerar um hash: ")
# Transformando o texto em bytes
hashText = hashlib.sha256(text.encode())
# Obtendo o valor hexadecimal do hash
hashHex = hashText.hexdigest()
print(f"O hash SHA-256 do texto '{text}' é: {hashHex}") 

"""

"""
    # Exemplos de saída usando SHA-256 no nome "Fabio"
    bef599fdc77300324c38dc150d9caf8859087aae59e6837973f0a531b51a139b = Fabio
    bef599fdc77300324c38dc150d9caf8859087aae59e6837973f0a531b51a139b = Fabio
"""

"""
# Exemplo de Hash usando = SHA-1
import hashlib

# Texto para gerar o hash
text = input("Digite um texto para gerar um hash: ")
# Transformando o texto em bytes
hashText = hashlib.sha1(text.encode())
# Obtendo o valor hexadecimal do hash
hashHex = hashText.hexdigest()
print(f"O hash SHA-1 do texto '{text}' é: {hashHex}")
"""

"""
    # Exemplos de saída usando SHA-1 no nome "Fabio"
    7eb9fd7394da5a459ae9b41d9a021171cc0519d7 = Fabio
    7eb9fd7394da5a459ae9b41d9a021171cc0519d7 = Fabio
"""

"""
# Exemplo de Hash usando = SHA-512
import hashlib

# Texto para gerar o hash
text = input("Digite um texto para gerar um hash: ")
# Transformando o texto em bytes
hashText = hashlib.sha512(text.encode())
# Obtendo o valor hexadecimal do hash
hashHex = hashText.hexdigest()
print(f"O hash SHA-512 do texto '{text}' é: {hashHex}")
"""

"""
    # Exemplos de saída usando SHA-512 no nome "Fabio"
    7bf138ca77c13114f9466c2b66b967dacba02d3b9523ff16c4ee5aca98f8824c990494bd7b09908358d99b9b09f09082b0c769df714165b11482991538c4dc2d = Fabio
    7bf138ca77c13114f9466c2b66b967dacba02d3b9523ff16c4ee5aca98f8824c990494bd7b09908358d99b9b09f09082b0c769df714165b11482991538c4dc2d = Fabio
"""

"""
# Exemplo de Hash usando = MD5
import hashlib

# Texto para gerar o hash
text = input("Digite um texto para gerar um hash: ")
# Transformando o texto em bytes
hashText = hashlib.md5(text.encode())
# Obtendo o valor hexadecimal do hash
hashHex = hashText.hexdigest()
print(f"O hash MD5 do texto '{text}' é: {hashHex}")
"""

"""
    # Exemplos de saída usando MD5 no nome "Fabio"
    cfb4d5711d6bb261eb05108684d876aa = Fabio
    cfb4d5711d6bb261eb05108684d876aa = Fabio
"""

"""
# Exemplo de Hash utilizando varios algoritmos
import hashlib

# Função para gerar hashes com diferentes algoritmos
text = input("Digite um texto para gerar hashes com diferentes algoritmos: ")
hashpadrao = hash(text)
hashsha1 = hashlib.sha1(text.encode()).hexdigest()
hashsha256 = hashlib.sha256(text.encode()).hexdigest()
hashsha512 = hashlib.sha512(text.encode()).hexdigest()
hashmd5 = hashlib.md5(text.encode()).hexdigest()

print(f"O hash padrão do texto '{text}' é: {hashpadrao}")
print(f"O hash SHA-1 do texto '{text}' é: {hashsha1}")
print(f"O hash SHA-256 do texto '{text}' é: {hashsha256}")
print(f"O hash SHA-512 do texto '{text}' é: {hashsha512}")
print(f"O hash MD5 do texto '{text}' é: {hashmd5}")
"""

"""
    # Exemplo de saída utilizando varios algoritmos no nome "Fabio"
    O hash padrão do texto 'Fabio' é: 3506530733134948035
    O hash SHA-1 do texto 'Fabio' é: 7eb9fd7394da5a459ae9b41d9a021171cc0519d7
    O hash SHA-256 do texto 'Fabio' é: bef599fdc77300324c38dc150d9caf8859087aae59e6837973f0a531b51a139b
    O hash SHA-512 do texto 'Fabio' é: 7bf138ca77c13114f9466c2b66b967dacba02d3b9523ff16c4ee5aca98f8824c990494bd7b09908358d99b9b09f09082b0c769df714165b11482991538c4dc2d
    O hash MD5 do texto 'Fabio' é: cfb4d5711d6bb261eb05108684d876aa
"""

"""
    Pesquisa(Anotar de Pelomenos 3 Fontes Diferentes)
    1.Qual e o algoritmo de hash mais seguro atualmente?
    2.Sistema Hexadecimal - Aplicacoes
    3.Importancia do Sistema Binario

    Respostas:
    1.O algoritmo de hash mais seguro atualmente é o SHA-256
    (Fontes:
    https://codesigningstore.com/what-is-the-most-secure-hashing-algorithm#:~:text=Considera%C3%A7%C3%B5es%20finais%20sobre%20qual%20%C3%A9,seguran%C3%A7a%20cibern%C3%A9tica%20para%20destru%C3%AD%2Dla.
    https://blog.pagefreezer.com/sha-256-benefits-evidence-authentication#:~:text=TL;DR:%20Por%20que%20SHA,conformidade%20legal%20e%20per%C3%ADcia%20digital.&text=Seguran%C3%A7a%20de%20dados%20incompar%C3%A1vel:%20a,dados%20e%20seguran%C3%A7a%20cibern%C3%A9tica%20superiores.
    https://www.securew2.com/blog/what-is-sha-encryption-sha-256-vs-sha-1#:~:text=O%20SHA%2D256%20%C3%A9%20mais,160%20bits%20do%20SHA%2D1.
    )

    2. 
        Representação de cores
        Endereçamento de memória
        Depuração e programação
        Protocolos de comunicação e endereçamento de rede
    (Fontes:
    https://growthcode.com.br/sistemas-de-numeracao/entendendo-o-sistema-hexadecimal-uma-explicacao-completa/#:~:text=Representa%C3%A7%C3%A3o%20de%20cores:,os%20dois%20%C3%BAltimos%20representam%20azul.
    https://pt.wikipedia.org/wiki/Sistema_de_numera%C3%A7%C3%A3o_hexadecimal#:~:text=Ele%20%C3%A9%20muito%20utilizado%20para,programa%C3%A7%C3%A3o%2C%20impress%C3%A3o%20e%20displays.
    https://www.techtarget.com/whatis/definition/hexadecimal#:~:text=O%20passado%20e%20o%20futuro%20da%20numera%C3%A7%C3%A3o%20hexadecimal&text=O%20hexadecimal%20%C3%A9%20usado%20nas,%E2%80%8Bem%20p%C3%A1ginas%20da%20web.
    )

    3.
    Ele é de extrema importancia, pois é a base de todo o sistema computacional.
    Armazenamento de dados, processamento de informacoes, comunicacao entre dispositivos.
    (Fontes:
    https://builtin.com/software-engineering-perspectives/binary#:~:text=Por%20que%20o%20bin%C3%A1rio%20%C3%A9,realizarem%20c%C3%A1lculos%20ou%20armazenarem%20informa%C3%A7%C3%B5es.
    https://www.lenovo.com/br/pt/glossary/what-is-binary/#:~:text=Por%20que%20o%20bin%C3%A1rio%20%C3%A9%20importante?%20O,digitais%2C%20permitindo%20que%20eles%20interajam%20entre%20si.
    https://hub.asimov.academy/blog/codigo-binario/#:~:text=O%20c%C3%B3digo%20bin%C3%A1rio%20%C3%A9%20a,tecnologia%20como%20conhecemos%20n%C3%A3o%20existiria.
    )

"""