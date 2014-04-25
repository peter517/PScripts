

#include <semaphore.h>
#include <sys/types.h>
#include <dirent.h>
#include <pthread.h>
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <dlfcn.h> 

#include "pthread/include/pthread.h"
#include "math/include/math.h"
#include "random/include/random.h"

#include "prebuild/include/math.h"
#include "prebuild/include/random.h"

#include "include/loadso_utils.h"

int main(int argc, char *argv[])
{
    #ifdef GYP_DEFINE
        printf("GYP_DEFINE\n");
    #endif
    
    #ifdef GYP_VAR
        printf("GYP_VAR\n");
    #endif

    #ifdef DEBUG
        printf("DEBUG\n");
    #endif

    CLibUtils* cLibUtils = new CLibUtils;
    cLibUtils->Load("prebuild/libprebuildrandom.so");
    void* pGetRandomInt = cLibUtils->QueryInterface("_Z20getPrebuildRandomIntv");
    if(pGetRandomInt == NULL){
        printf("pGetRandomInt == NULL\n");
    }
    
    pthread_t thrd1, thrd2;

    pthread_create(&thrd1, NULL, task1, NULL);
    pthread_create(&thrd2, NULL, task2, NULL);

    sleep(1);

    printf("math test=%d\n",add(1,1));
    printf("random int=%d\n",getRandomInt());

    printf("prebuild math test=%d\n",prebuildAdd(2,2));
    int(*fGetRandomInt)();
    fGetRandomInt = (int (*)())pGetRandomInt;
    printf("prebuild random int=%d\n",fGetRandomInt());

    cLibUtils->Unload();
    delete cLibUtils;

    printf("Main thread exit...\n");
    
    return 0;
}
