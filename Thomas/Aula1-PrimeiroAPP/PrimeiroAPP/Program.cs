using System;

class Program
{
    

    static void Main(string[] args)
    {
        Console.WriteLine("Ola, Mundo!");//escreve e pula de lina
        Console.Write("Tchau, Mundo!");//escreve sem pular de linha


        Console.ReadLine();//le o que foi digitado e pula de linha
        Console.Read();//le o que foi digitado e fica na mesma linha


        //variavel

        //int=inteiro(numero inteiro) somente 1,2,3,4,5,6,7,8,9,10...
        //string=texto
        //double=numero com ponto, decimal ex: 3.14

        string nome;
        int num;
        double num2;
        bool VerdadeiroFalso = true; //criando variavel de tipo booleano (Verdadeiro ou Falso)

        //atribuindo valor
        nome = "Bengozi";
        num = 10;
        num2 = 15.5;

        //mostrando valores das variaveis
        Console.WriteLine(nome);
        Console.WriteLine(num);
        Console.WriteLine(num2);
        Console.WriteLine("VerdadeiroFalso");

        //concatenando variaveis
        Console.WriteLine("O nome é: " + nome);
        Console.WriteLine("O numero1 é: " + num);
        Console.WriteLine("O numero2 é: " + num2);
        Console.WriteLine("O valor booleano é: " + VerdadeiroFalso);

        Console.ReadLine();//para o console nao fechar
    }
}  