senha = input("Informe sua Senha: ")
cont_min = 0
cont_masc = 0

for letra in senha:
    if letra.islower():
        cont_min +=1
    

for letra in senha:
    if letra.isupper():
        cont_masc +=1
    
    
if cont_min > 0:
    print(f"Tem letras Minisculas")
else:
    print(f"Você precisa colocar no minimo uma letra Minuscula")

if cont_masc > 0:
    print(f"Tem letras Maiusculas")
else:
    print(f"Você precisa colocar no minimo uma letra Maiuscula")