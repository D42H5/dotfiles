#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <assert.h>

#define RED "\33[0:31m" // Color Start
#define RESET_COLOR "\33[0m" // To flush out prev settings

void segfaultHandler(int sig) {
	fprintf(stderr, RED"ERROR:"RESET_COLOR" Segfault occurred\n");
	exit(-1);
}

int main() {
	signal(SIGSEGV, &segfaultHandler);
	return 0;
}

