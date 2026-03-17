using System;
class Program
{
    static void Main(string[] args)
    {
        //Definindo as variaveis && e atribuindo valores a alguma delas
        string emailSys = "teste@email.com", emailUser, codUserStr, novaSenha;
        int codSys = 123456, codUser;

        //Pedindo email atribuido ao usuario
        Console.Write("Digite seu e-mail: ");
        emailUser = Console.ReadLine()!;

        //Condicional para verificar se o email do usuario coincide com o do sistema
        //se for igual ao emailSys ele pede verificacao, senao ele corta o programa
        if (emailUser == emailSys)
        {
            Console.WriteLine("Coloque o Codigo enviado via E-mail");
            //Crio uma variavel do codigo para tipo String, e uso o int.Parse para converter em numero inteiro "123456" para 123456
            codUserStr = Console.ReadLine();
            int.Parse(codUserStr);
            codUser = int.Parse(codUserStr);
            if (codUser == codSys)
            {
                Console.Write("Aceito");
                Console.Clear();
                //pede a nova senha ao usuario
                Console.Write("Digite sua nova Senha: ");
                //armazena essa nova senha
                novaSenha = Console.ReadLine();
                //mostra programa sucedido e a senha escolhida pelo usuario
                Console.WriteLine("Senha alterada com sucesso! sua nova senha eh: " + novaSenha);
            }
            else
            {
                Console.WriteLine("Codigo errado, Tente novamente!");
            }
        }
        else
        {
            Console.WriteLine("Tente Novamente");
        }
        
    }
}