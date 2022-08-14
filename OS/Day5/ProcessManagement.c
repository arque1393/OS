#include <stdio.h>
#include <stdlib.h>
#define MAX_AT 10
#define MAX_BT 20
#define MAX_PR 5

typedef struct
{
    int ID, AT, PR, BT, RT, TT, WT;
} Process;
short write_process_as_binary(Process *p, size_t n, char *path);
void random_process_generator(Process *p, size_t n);
short write_process(Process *p, size_t n, char *path);
short read_process(Process *p, size_t n, char *path);
void printProcess(Process p[], int N);

short write_process_as_binary(Process *p, size_t n, char *path)
{
    FILE *fptr = fopen(path, "ab");

    if (fptr == NULL)
        return 0;
    fwrite(p, sizeof(Process), n, fptr);
    fclose(fptr);
    return 1;
}

void random_process_generator(Process *p, size_t n)
{
    int i = 0;
    for (i = 0; i < n; i++)
    {
        p[i].ID = i;
        p[i].AT = rand() % MAX_AT;
        p[i].BT = rand() % MAX_BT;
        p[i].PR = rand() % MAX_PR;
        p[i].RT = p[i].BT;
        p[i].TT = 0;
        p[i].WT = 0;
    }
}

short write_process(Process *p, size_t n, char *path)
{
    FILE *fptr = fopen(path, "a");
    int i = 0;
    if (fptr == NULL)
        return 0;
    for (i = 0; i < n; i++)
        fprintf(fptr, "%d \t %d \t %d \t %d\n",
                p[i].ID, p[i].AT, p[i].PR, p[i].BT);
    fclose(fptr);
    return 1;
}
short read_process(Process *p, size_t n, char *path)
{
    FILE *fptr = fopen(path, "r");
    int i = 0;
    while (getc(fptr) != '\n')
        ;
    if (fptr == NULL)
        return 0;

    for (i = 0; i < n; i++)
    {
        fscanf(fptr, "%d \t %d \t %d \t %d\n",
               &p[i].ID, &p[i].AT, &p[i].PR, &p[i].BT);
        p[i].RT = p[i].BT;
        p[i].TT = 0;
        p[i].WT = 0;
    }
    fclose(fptr);
    return 1;
}

void printProcess(Process p[], int N)
{
    int i = 0;
    printf("PID \t AT \t PR \t BT \t RT \t TA \t WT\n");
    for (i = 0; i < N; i++)
    {
        printf("P%d \t %d \t %d \t %d \t %d \t %d \t %d \n",
               p[i].ID, p[i].AT, p[i].PR, p[i].BT, p[i].RT, p[i].TT, p[i].WT);
    }
}

int main()
{
    Process P[13];
    int N = 13;
    // random_process_generator(P, N);
    char filename[] = "/run/media/aritrarc/96532fef-218c-4ef7-826c-09b7d7c85016/home/aritrarc/OS/ProcessInfo.txt";
    // write_process(P, N, filename); // return 1 If Writing become successfull
    read_process(P, N, filename);
    printProcess(P, N);
}