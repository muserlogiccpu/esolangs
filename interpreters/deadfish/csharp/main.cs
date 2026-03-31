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
        int acc = 0;
        foreach (char c in code)
        {
            switch (c)
            {
                case 'i':
                    acc++;
                    break;
                case 'd':
                    acc--;
                    break;
                case 's':
                    acc=acc*acc;
                    break;
                case 'o':
                    Console.Write(acc);
                    break;
            }
            if (acc == -1 || acc == 256) acc = 0;
        }
    }
}
