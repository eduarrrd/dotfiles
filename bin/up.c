#include <stdio.h>
#include <stdlib.h>

int main(void) {
  double proc_uptime = -1;

  FILE *f = fopen("/proc/uptime", "r");
  fscanf(f, "%lf ", &proc_uptime);
  fclose(f);

  int uptime = proc_uptime;

  int days = uptime / (60 * 60 * 24);
  int hours = (uptime / (60 * 60)) % 24;
  int min = (uptime / 60) % 60;

  printf("%dd:%dh:%dm\n", days, hours, min);

  return EXIT_SUCCESS;
}
