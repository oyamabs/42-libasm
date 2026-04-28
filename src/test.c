#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int ft_strlen(char *s);
char *ft_strcpy(char *, char *);
int ft_strcmp(char *, char *);
int ft_write(int, char *, int);
int ft_read(int, char *, int);
char *ft_strdup(char *);

int main(void)
{
	char *buff1 = "Hello world";
	char *buff2 = ft_strdup(buff1);
	if (!buff2)
		return 1;
	printf("buff2: %s\n", buff2);
	free(buff2);
	//int fd = open("src/ft_read.S", O_RDONLY);
	//char buffer[10000] = {0};
	//ft_read(fd, buffer, 10000);
	//printf("content of file descriptor: %s\n", buffer);
}
