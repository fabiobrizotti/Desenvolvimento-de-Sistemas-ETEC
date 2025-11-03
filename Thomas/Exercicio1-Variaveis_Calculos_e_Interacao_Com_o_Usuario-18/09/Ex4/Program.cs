class Program
{
    static void Main(string[] args)
    {
        double produto_valor, desconto, valor_final;

        Console.Write("Escreva o Valor do Produto: ");
        produto_valor = Convert.ToDouble(Console.ReadLine()!);
        Console.Write("Escreva o Valor do Desconto (%): ");
        desconto = Convert.ToDouble(Console.ReadLine()!);

        Console.Clear();

        valor_final = produto_valor - (produto_valor * desconto / 100);

        Console.WriteLine("O Valor Final do Produto é: " + valor_final); //Questao 4
        

    }
}