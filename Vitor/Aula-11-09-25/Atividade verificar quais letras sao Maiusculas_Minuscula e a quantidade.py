senha = input("Informe sua Senha: ")
cont_min = 0
cont_masc = 0
total_maisc = 0

for letra_min in senha:
    if letra_min.islower():
        cont_min +=1
        print(f"Letras minusculas: {letra_min}")
    

for letra_masc in senha:
    if letra_masc.isupper():
        cont_masc +=1
        print(f"Letras Maiusculas: {letra_masc}")

    
print(f"Quantidade de Maiusculas: {cont_masc}")
print(f"Quantidade de Minusculas: {cont_min}")
