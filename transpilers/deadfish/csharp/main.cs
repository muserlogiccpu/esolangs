using System;
class dfcs{
    static void Main(string[] args)
    {
        if (args.Length < 1)
        {
            Console.WriteLine("usage: dfcs <code>");
            return;
        }
        string code = args[0];
        Console.WriteLine("using System;\nclass Program{\nstatic void Main(){\nint acc = 0;");
        foreach (char c in code)
        {
            switch (c)
            {
                case 'i':
                    Console.WriteLine("acc++;");
                    break;
                case 'd':
                    Console.WriteLine("acc--;");
                    break;
                case 's':
                    Console.WriteLine("acc = acc * acc;");
                    break;
                case 'o':
                    Console.WriteLine("Console.Write(acc);");
                    break;
            }
            Console.WriteLine("if (acc == -1 || acc == 256) acc = 0;");
        }
        Console.WriteLine("}}");
    }
}
