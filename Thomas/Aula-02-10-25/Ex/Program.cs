/*class Program
{
    static void Main(string[] args)
    {
        // Exibe uma mensagem pedindo que o usuário digite um número inteiro
        Console.WriteLine("Digite um Numero Inteiro: ");
        // Lê o número inteiro digitado e converte para o tipo int
        int num = Convert.ToInt32(Console.ReadLine()!);

        // Exibe uma mensagem pedindo que o usuário digite um texto
        Console.WriteLine("Digite um texto: ");
        // Lê o texto digitado e armazena na variável do tipo string
        string texto = Console.ReadLine()!;

        // Exibe uma mensagem pedindo que o usuário digite um número decimal
        Console.WriteLine("Coloque um número decimal: ");
        // Lê o número decimal digitado e converte para o tipo double
        double numdecimal = Convert.ToDouble(Console.ReadLine()!);

        // Limpa o console (remove as mensagens anteriores)
        Console.Clear();
        
        // Se o número inteiro for maior que 10 E o número decimal for maior que 5.0
        if (num > 10 && numdecimal > 5.0)
        {
            // Mostra mensagem informando que ambos atendem à condição, exibindo também o texto digitado
            Console.WriteLine($"O número inteiro {num} é maior que 10 e o número decimal {numdecimal} é maior que 5. O texto digitado foi: {texto}");
        }
        // Caso contrário, se o número inteiro for menor ou igual a 10
        else if (num <= 10)
        {
            // Mostra mensagem informando que o número inteiro não atendeu à condição, exibindo o texto digitado
            Console.WriteLine($"O número inteiro {num} é menor ou igual a 10. Texto digitado: {texto}");
        }
        // Se não for nenhum dos casos acima, significa que o número decimal é menor ou igual a 5.0
        else
        {
            // Mostra mensagem informando que o número decimal não atendeu à condição, exibindo o texto digitado
            Console.WriteLine($"O número decimal {numdecimal} é menor ou igual a 5. Texto digitado: {texto}");
        }
    }
}
*/


/*
class Program{
    static void Main(string[] args)
    {
        Console.Write("Qual Sua Idade:"); //Pergunta a idade ao usuario
        int idade = Convert.ToInt32(Console.ReadLine()!); //Armazena a Idade do Usuario

    Console.Clear(); //Apaga todo o Historico de Mensagens anteriores

    if (idade >= 18 && idade < 100) //Se a Idade for Igual ou Maior que 18, ele Interpreta como Maior de Idade, Se Não, Menor de Idade
        Console.WriteLine("Você é Maior de Idade");
    else
        Console.WriteLine("Você é Menor de Idade");
    }
}
*/