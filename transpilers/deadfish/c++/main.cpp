#include <iostream>
#include <string>
int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cout << "not enough args, usage: " << argv[0] << " <code>\n";
        return 1;
    }
    if (argc > 2) {
        std::cout << "too manu args, usage: " << argv[0] << " <code>\n";
        return 1;
    }
    std::cout << "#include <iostream>\nint main() {\n  int acc = 0;\n";
    std::string code = argv[1];
    for (size_t i = 0; i < code.size(); ++i) {
        switch (code[i]) {
            case 'i':
                std::cout << "  acc++;\n";
                break;
            case 'd':
                std::cout << "  acc--;\n";
                break;
            case 's':
                std::cout << "  acc = acc * acc;\n";
                break;
            case 'o':
                std::cout << "  std::cout << acc;\n";
                break;
        }
        std::cout << "  if (acc == -1 || acc == 256) acc = 0;\n";
    }
    std::cout << "  return 0;\n}\n";
    return 0;
}
