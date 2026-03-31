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
    int acc = 0;
    for (size_t i = 0; i < code.size(); ++i) {
        switch (code[i]) {
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
                std::cout << acc;
                break;
        }
        if (acc == -1 || acc == 256) acc = 0;
    }
    return 0;
}
