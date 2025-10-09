#1
#Recebendo dados do usuário
email = input("Digite seu E-mail: ") #Recebendo o E-mail
senha = input("Digite sua Senha: ") #Recebendo a Senha
senha_cifrada = ""

#2
#Exibindo os dados
print("E-mail:", email) #Exibindo o E-mail
print("Senha:", senha) #Exibindo a Senha

#Cifrando a senha
for char in senha: #Para char na senha
    senha_cifrada += "*" #Adicionar "*" na senha_cifrada


print("Senha Cifrada:", senha_cifrada) #Exibindo a senha cifrada

#3
import hashlib #Importando a biblioteca para gerar hash

#Gerando o hash da senha
hash = hashlib.sha256(senha.encode()).hexdigest() #Gerando o hash da senha utilizando SHA256
print("Hash: ", hash) #Exibindo o hash da senha

#4
#Criando Token com 12 Caracteres em Ascii_Letters
import string #Importando a biblioteca string
import random #Importando a biblioteca random

token = ''.join(random.choices(string.ascii_letters, k=12)) #Gerando o token com 12 caracteres em Ascii_Letters

#5
print("Token Gerado:", token) #Exibindo o token