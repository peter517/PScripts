 {
    'targets': 
    [
      {
        'target_name': 'linux_c_test',
        'type': 'executable',
        'dependencies': [
        ],
        'variables': 
        { 
           'IS_DEBUG': 'true', 
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
        ],
        'libraries':
        [
            'modules/math/out/Default/obj.target/libmymath.a'
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
             },
             ],
             ['IS_DEBUG == "true"', 
                {
                    'defines': 
                    [
                        'IS_DEBUG',
                    ],
                }
             ]
         ],        
       },
     ],
  }
