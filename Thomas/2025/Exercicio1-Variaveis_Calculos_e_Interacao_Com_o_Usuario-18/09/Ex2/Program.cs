class Program
{
    static void Main(string[] args)
    {
        double celsius, fahrenheit;

        Console.Write("Escreva a Temperatura em Celsius: ");
        celsius = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        fahrenheit = (celsius * 9 / 5) + 32;
        
        Console.WriteLine("A Temperatura em Fahrenheit é: " + fahrenheit); //Questao 2
        

    }
}