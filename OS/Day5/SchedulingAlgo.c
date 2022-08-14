#include <stdio.h>
typedef struct
{
    int ID, AT, PR, BT, RT, TT, WT;

} Process;
Process q[10];
int N = 5;

double fcfswt, fcfsta, sjfwt, sjfta;
void InputProcess(Process p[], int n)
{
    p[0].BT = 7;
    p[1].BT = 10;
    p[2].BT = 20;
    p[3].BT = 13;
    p[4].BT = 2;
    p[5].BT = 17;
    p[0].ID = 1;
    p[1].ID = 2;
    p[2].ID = 3;
    p[3].ID = 4;
    p[4].ID = 5;
    p[5].ID = 6;
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

void sort(Process p[], int n)
{
    int i, j;
    Process key;
    for (i = 1; i < n; i++)
    {
        key = p[i];
        j = i - 1;
        while (key.BT < p[j].BT && j >= 0)
            p[j-- + 1] = p[j];
        p[j + 1] = key;
    }
}

void FCFS(Process p[], int n, double *wt, double *ta)
{
    double g = 0;
    int i;
    *wt = 0;
    *ta = 0;
    for (i = 0; i < n; i++)
    {
        g += p[i].BT;
        p[i].TT = g;
        p[i].WT = p[i].TT - p[i].BT;

        *wt += p[i].WT;
        *ta += p[i].TT;
    }
    *ta = *ta / n;
    *wt = *wt / n;
}

void SJF(Process p[], int n, double *wt, double *ta)
{
    int i, j;
    Process key;
    for (i = 1; i < n; i++)
    {
        key = p[i];
        j = i - 1;
        while (key.BT < p[j].BT && j >= 0)
            p[j-- + 1] = p[j];
        p[j + 1] = key;
    }

    FCFS(q, n, wt, ta);
}
int main()
{
    InputProcess(q, N);
    FCFS(q, N, &fcfswt, &fcfsta);
    printf("\n%lf %lf \n\n", fcfswt, fcfsta);
    SJF(q, N, &sjfwt, &sjfta);
    printProcess(q, N);
    printf("\n%lf %lf \n\n", sjfwt, sjfta);
}