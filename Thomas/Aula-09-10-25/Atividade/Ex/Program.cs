public class Program
{
    public static void Main(string[] args)
    {
        Console.Write("Digite um Numero: ");
        int num = Convert.ToInt32(Console.ReadLine()!);

        if (num == 0)
        {
            Console.WriteLine("O numero eh zero");
        }
        else if (num < 0)
        {
            Console.WriteLine("O numero eh negativo");
        }
        else
        {
            Console.WriteLine("O numero eh positivo");
        }

        
        if (num % 2 == 0)
        {
            Console.WriteLine("O numero eh par");
        }
        else
        {
            Console.WriteLine("O numero eh impar");
        }
    }
}

