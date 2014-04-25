
#ifndef CLibUtils_H__
#define CLibUtils_H__

enum Loadso_ERROR
{
    OK,
    ERROR,
    OPEN_ERROR,
    CLOSE_ERROR,
    STATE_ERROR,
    IVAIL_PARAM,
};


class CLibUtils
{
public:
    CLibUtils();
    virtual ~CLibUtils();
    
    int32_t Load(const char* name);
    int32_t Unload();
    void* QueryInterface(const char* interface);

private:
    void* mpHandle;
    char mLibName[256];
    bool mbLoaded;
    
    CLibUtils(const CLibUtils&);
    CLibUtils& operator=(const CLibUtils&);
};



#endif

