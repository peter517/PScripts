
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dlfcn.h>

#include "include/loadso_utils.h"


CLibUtils::CLibUtils():
    mpHandle( NULL ),
    mbLoaded(false)
{
        mLibName[0] = 0;
}
    
CLibUtils::~CLibUtils()
{
    if(mbLoaded == true){
        Unload();
    }
}

int32_t CLibUtils::Load(const char* name)
{
    if(name == NULL){
        return IVAIL_PARAM;
    }
    mpHandle = dlopen(name, RTLD_LAZY);
    if(mpHandle == NULL ){
        return OPEN_ERROR;
    }
    
    memcpy(mLibName, name, sizeof(mLibName));
    mbLoaded = true;
    return OK;
}

int32_t CLibUtils::Unload()
{
    if(mbLoaded == false){
        return STATE_ERROR;
    }
    int ret = dlclose(mpHandle);
    if (ret){
        return CLOSE_ERROR;
    }
    mbLoaded = false;
    return true;
}

void* CLibUtils::QueryInterface(const char* funcname)
{
    void* pfunc = NULL;
    if(mbLoaded == true && mpHandle != NULL){
        pfunc = dlsym(mpHandle, funcname);
        if (pfunc == NULL ){
        }
    }
    return pfunc;
}



