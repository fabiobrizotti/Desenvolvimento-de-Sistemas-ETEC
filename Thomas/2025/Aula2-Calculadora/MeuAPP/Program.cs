class Program
{
    static void Main(string[] args)
    {
        double num1, num2, num3, num4, soma, multiplicacao, divisao, subtracao;

        Console.Write("Digite o valor de Número 1: ");
        num1 = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Digite o valor de Número 2: ");
        num2 = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Digite o valor de Número 3: ");
        num3 = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Digite o valor de Número 4: ");
        num4 = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();
        
        Console.Write("Escolha Uma Operação\n 1)Soma\n 2)Multiplicação\n 3)Divisão\n 4)Subtração\n: ");
        int operacao = Convert.ToInt32(Console.ReadLine()!);

        
        if (operacao == 1)
        {
            soma = num1 + num2 + num3 + num4;
            Console.WriteLine("O valor Somado é: " + soma);
        }
        else if (operacao == 2)
        {
            multiplicacao = num1 * num2 * num3 * num4;
            Console.WriteLine("O valor Multiplicado é: " + multiplicacao);
        }
        else if (operacao == 3)
        {
            divisao = num1 / num2 / num3 / num4;
            Console.WriteLine("O valor Dividido é: " + divisao);
        }
        else if (operacao == 4)
        {
            subtracao = num1 - num2 - num3 - num4;
            Console.WriteLine("O valor Subtraido é: " + subtracao);
        }
        else
        {
            Console.WriteLine("Operação Inválida");
            return;
        }

    }
}