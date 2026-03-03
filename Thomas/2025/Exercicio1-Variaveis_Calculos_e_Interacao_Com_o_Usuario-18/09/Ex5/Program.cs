class Program
{
    static void Main(string[] args)
    {
        double horas, minutos;

        Console.Write("Escreva uma quantidade de Horas: ");
        horas = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        minutos = horas * 60;

        Console.WriteLine("A Quantidade de Minutos é: " + minutos); //Questao 5
        

    }
}