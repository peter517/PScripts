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
       'target_name': 'mymath',
       'type': 'static_library',
       'sources': 
       [
           'math.cc',
       ],
       'include_dirs': 
       [
           'include',
       ], 
    },
    ],
 }

