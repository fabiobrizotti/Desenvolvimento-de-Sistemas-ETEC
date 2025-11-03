using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Bem-vindo ao Analisador de Sinais Numéricos!");
        Console.Write("Digite um Numero: ");
        int num = Convert.ToInt32(Console.ReadLine()!);

        if (num > 0)
        {
            Console.WriteLine("O Numero eh Positivo!");
        }
        else if (num == 0)
        {
            Console.WriteLine("O Numero eh Zero!");
        }
        else
        {
            Console.WriteLine("O Numero eh Negativo!");
        }
    }
}