class Program
{

    static void Main(string[] args)
    {
        double area;

        Console.Write("Escreva o Valor da Base: ");
        double baseNum = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Escreva o Valor da Altura: ");
        double alturaNum = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        area = baseNum * alturaNum;

        Console.WriteLine("A área do retângulo é: " + area); //Questao 1 

        /* double celsius, fahrenheit;

        Console.Write("Escreva a Temperatura em Celsius: ");
        celsius = Convert.ToDouble(Console.ReadLine()!);
        Console.Clear();
        fahrenheit = (celsius * 9 / 5) + 32;
        Console.WriteLine("A Temperatura em Fahrenheit é: " + fahrenheit); //Questao 2 */

        /* double nota1, nota2, nota3, media;

        Console.Write("Escreva a Primeira Nota: ");
        nota1 = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Escreva a Segunda Nota: ");
        nota2 = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Escreva a Terceira Nota: ");
        nota3 = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        media = (nota1 + nota2 + nota3) / 3;
        Console.WriteLine("A Média Aritmética é: " + media); //Questao 3 */

        /* double produto_valor, desconto, valor_final;

        Console.Write("Escreva o Valor do Produto: ");
        produto_valor = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Escreva o Valor do Desconto (%): ");
        desconto = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        valor_final = produto_valor - (produto_valor * desconto / 100);

        Console.WriteLine("O Valor Final do Produto é: " + valor_final); //Questao 4 */

        /* double horas, minutos;

        Console.Write("Escreva uma quantidade de Horas: ");
        horas = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        minutos = horas * 60;

        Console.WriteLine("A Quantidade de Minutos é: " + minutos); //Questao 5 */

    


    }
}