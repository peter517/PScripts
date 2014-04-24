

#include <semaphore.h>
#include <sys/types.h>
#include <dirent.h>
#include <pthread.h>
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>

#include "pthread/include/pthread.h"

int main(int argc, char *argv[])
{
    #ifdef GYP_DEFINE
        printf("GYP_DEFINE\n");
    #endif
    
    #ifdef IS_DEBUG
        printf("IS_DEBUG\n");
    #endif

    pthread_t thrd1, thrd2;

    pthread_create(&thrd1, NULL, task1, NULL);
    pthread_create(&thrd2, NULL, task2, NULL);

    sleep(3);
    printf("Main thread exit...\n");

    return 0;
}
