
#include <iostream>
#include <cstdlib>
#include <ctime>
#define random(a,b) (rand()%(b-a+1)+a)

using namespace std;

int main()
{

    FILE* fp;
    fp = fopen("data1.txt","w");
    for(int i = 0;i<32767;i++)
        fprintf(fp,"%.4x\n",i);
    fclose(fp);
}
