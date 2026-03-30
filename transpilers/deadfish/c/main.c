#include <stdio.h>
int main(int argc, char *argv[]) {
  int i;
  if (argc < 2) {
    printf("not enough args, usage: %s <code>",argv[0]);
    return 1;
  }
  if (argc > 2) {
    printf("too much args, usage: %s <code>",argv[0]);
    return 1;
  }
  printf("#include <stdio.h>\nint main(){\n  int acc=0;\n");
  for (i = 0; argv[1][i] != '\0'; i++) {
    switch (argv[1][i]) {
      case 'i':
        printf("  acc++;\n");
        break;
      case 'd':
        printf("  acc--;\n");
        break;
      case 's':
        printf("  acc=acc*acc;\n");
        break;
      case 'o':
        printf("  printf(\"%%d\",acc);\n");
        break;
    }  
    printf("  if (acc == -1 || acc == 256) acc = 0;\n");
  }
  printf("  return 0;\n}\n");
  return 0;
}
