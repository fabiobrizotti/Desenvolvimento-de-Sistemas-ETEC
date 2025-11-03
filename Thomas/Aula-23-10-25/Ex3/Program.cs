using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Programa Eleitoral");
        Console.WriteLine("Qual sua idade para verificarmos se pode votar?");
        Console.Write("Digite sua idade: ");
        int idade = Convert.ToInt32(Console.ReadLine()!);

        Console.Clear();

        if (idade < 16)
        {
            Console.WriteLine("Não pode votar.");
        }
        else if ((idade >= 16 && idade < 18) || idade >= 70)
        {
            Console.WriteLine("Voto Opcional.");
        }
        else
        {
            Console.WriteLine("Voto obrigatório.");
        }
    }
}
