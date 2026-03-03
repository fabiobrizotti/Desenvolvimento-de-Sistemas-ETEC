tamanho_senha = 6
cont = 0
from colorama import init, Fore, Back, Style
init()
print(Fore.RED + f"(ela deve ter no minimo {tamanho_senha} caracteres, Uma Maiuscula, Uma Minuscula e Um simbolo especial)")
print(Fore.WHITE)
senha = input("Informe sua Senha: ")

for caractere in senha:
    cont += 1
    
if cont < tamanho_senha:
    print(f"Sua senha teve ter no minimo {tamanho_senha} caracteres")
else:
    print("Senha Registrada")