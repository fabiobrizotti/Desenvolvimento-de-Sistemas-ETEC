public class Program
{
    public static void Main(string[] args) {

        // declarando variaveis
        double nota1, nota2, nota3, media;

        // entrada de dados
        Console.WriteLine("Digite a primeira nota: ");
        nota1 = Convert.ToDouble(Console.ReadLine()!);
        Console.WriteLine("Digite a segunda nota: ");
        nota2 = Convert.ToDouble(Console.ReadLine()!);
        Console.WriteLine("Digite a terceira nota: ");
        nota3 = Convert.ToDouble(Console.ReadLine()!);

        // processamento
        media = (nota1 + nota2 + nota3) / 3;


        Console.Clear();

        // saida de dados
        Console.WriteLine("A media das notas eh: " + media);


        //if
        if (media == 10)
         {
            Console.WriteLine("Parabens!");
        }
        else if (media <= 5)
        {
            Console.WriteLine("Reprovado!");
        }
        else
        {
            Console.WriteLine("Aprovado!");
        }

    }
}