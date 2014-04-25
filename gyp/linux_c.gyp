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
        'target_name': 'linux_c_test',
        'type': 'executable',
        'dependencies': [
            'modules/random/random_so.gyp:random',
            'modules/math/math_lib.gyp:mymath'
        ],
        'variables': 
        { 
           'GYP_VAR': 'gyp', 
        },
        'defines': 
        [
            'GYP_DEFINE',
        ],
        'sources': 
        [
            'main.cc',
            'modules/pthread/pthread_once_test.cc',
        ],
        'include_dirs': 
        [
            '.',
            '..',
            'modules',
            'modules/random/out/Debug/obj.target',
        ],
        'libraries':
        [
        ],
	    'conditions': 
	    [
            ['OS=="linux"',
            {
	            'ldflags': 
                [
                   '-pthread',
                ],
                'cflags': 
                [
                        '-Werror',
                        '-Wall',
                ],
                'cflags_cc': 
                [
                        '-Werror',
                        '-Wall',
                ]
             },
             ],
             ['GYP_VAR == "gyp"', 
                {
                    'defines': 
                    [
                        'GYP_VAR',
                    ],
                }
             ],
         ],        
       },
     ],
  }
