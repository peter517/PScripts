

#include <semaphore.h>
#include <sys/types.h>
#include <dirent.h>
#include <pthread.h>
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include "pthread.h"



pthread_once_t once = PTHREAD_ONCE_INIT;

void once_run(void)
{
    sleep(2);
    printf("once_run in thread %d\n", (int)pthread_self());
}


void* task1(void* arg)
{
    int tid = pthread_self();
    printf("thread1 enter %u\n", tid);
    pthread_once(&once, once_run);
    printf("thread1 returns %u\n", tid);

    return NULL;
}

void* task2(void* arg)
{
    int tid = pthread_self();
    printf("thread2 enter %u\n", tid);
    pthread_once(&once, once_run);
    printf("thread2 returns %u\n", tid);

    return NULL;
}

