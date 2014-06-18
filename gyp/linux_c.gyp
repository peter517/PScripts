 {
    'target_defaults':
    {
        'default_configuration': 'Debug',
        'configurations': 
        {
            'Debug': 
            {
                'defines': ['LINUX_C_DEBUG'],            
            },
            'Release': 
            {
                'defines': ['LINUX_C_RELEASE' ],
            },
        },
    },
    
    'targets': 
    [
      {
        'target_name': 'linux_c_test',
        'type': 'executable',
        'dependencies': [
            'modules/random/random_so.gyp:random',
            'modules/math/math_lib.gyp:mymath',
        ],
        'variables': 
        { 
           'GYP_VAR': 'gyp', 
        },
        'defines': 
        [
            'GYP_DEFINE',
            'GYP_DEFINE_A_VALUE=123',
        ],
        'sources': 
        [
            'main.cc',
            'loadso_utils.cc',
            'modules/pthread/pthread_once_test.cc',
        ],
        'include_dirs': 
        [
            '.',
            '..',
            'modules',
        ],
        'libraries':
        [
            '-ldl',
            'prebuild/libprebuildmymath.a',
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
             ['DEFAULT_VAR == "gyp"', 
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
