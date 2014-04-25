{
    'target_defaults':
    {
        'default_configuration': 'Debug',
        'configurations': 
        {
            'Debug': 
            {
                'defines': [ 'DEBUG'],
            },
            'Release': 
            {
                'defines': [ 'NDEBUG' ],
        
            }
        },
    },
    'targets':
    [
    {
       'target_name': 'random',
       'type': 'shared_library',
       'sources': 
       [
           'random.cc',
       ],
       'include_dirs': 
       [
           'include',
       ],    
    },
    ],
 }

