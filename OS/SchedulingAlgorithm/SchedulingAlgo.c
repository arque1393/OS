#include <stdio.h>
#include "ProcessManagement.c"
Process q[10];
int N = 5;

double fcfswt, fcfsta, sjfwt, sjfta;


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
void round_robin(Process p[], int n, int *wt, int *ta)
{
    int tq = TQ(2),i,j,g=0;
    int n_round = p[find_max_BT(p, n)].BT;
    n_round=(n_round%tq)?n_round/tq+1:n_round/tq;
    for(i=0;i<n_round;i++)
    {
        
        for(j=0;j<n;j++)
        {
            if(p[j].RT<tq)
            {
                g+=p[j].RT;
                p[j].RT=0;
                p[j].TT=g;
                p[j].WT=p[j].TT-p[j].BT;
            }
            else
            {
                p[j].RT -= tq;
                g+=tq;
                
            }
        }

    }
     


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
    read_process(q,N, "ProcessInfo.txt");
    FCFS(q, N, &fcfswt, &fcfsta);
    printf("\n%lf %lf \n\n", fcfswt, fcfsta);
    SJF(q, N, &sjfwt, &sjfta);
    printProcess(q, N);
    printf("\n%lf %lf \n\n", sjfwt, sjfta);
}