class Program
{
    static void Main(string[] args)
    {
        double nota1, nota2, nota3, media;

        Console.Write("Escreva a Primeira Nota: ");
        nota1 = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Escreva a Segunda Nota: ");
        nota2 = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Escreva a Terceira Nota: ");
        nota3 = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        media = (nota1 + nota2 + nota3) / 3;
        Console.WriteLine("A Média Aritmética é: " + media); //Questao 3
        

    }
}