#include <stdio.h>
int main(int argc, char *argv[){
  int i;
  if (argc < 2) {
    printf("not enough args, usage: %s <code>",argv[0]);
    return 1;
  }
  if (argc > 2) {
    printf("too much args, usage: %s <code>",argv[0]);
    return 1;
  }
  int acc=0
  for (i = 0; argv[1][i] != '\0'; i++) {
    switch (argv[1][i]) {
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
        printf("%d",acc);
        break;
    }  
    if (acc == -1 || acc == 256) acc = 0;
  }
  return 0;
}
