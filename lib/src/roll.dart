part of dm_tool;

Random r = new Random();
int roll([int max = 100]) {
  int min = 1;
  if (max == min) {
    return 1;
  }
  else {
    return min + r.nextInt(max - min);
  }
}