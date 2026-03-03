using System;

class Program
{
    static void Main(string[] args)
    {
        Console.Write("Digite um valor: ");
        double valor = Convert.ToDouble(Console.ReadLine()!);
        int desconto;

        if (valor >= 100)
        {
            desconto = 10;
            valor = valor * 0.90; // 10% de desconto
        }
        else
        {
            desconto = 5;
            valor = valor * 0.95; // 5% de desconto
        }

        Console.Clear();

        Console.WriteLine("Walmart");
        Console.WriteLine("Sua compra deu R$ " + valor.ToString("F2") + ", com um desconto de " + desconto + "%.");
    }
}
