--##comment in the beginning
--color cyan
--title Mmpc Sdk Build Readme
--color white


--beginoutput
--color green
--heading Contents
--color white 
1.How to build
2.Tips
--endoutput

--beginoutput
--color yellow
--heading How to build
--color white 
--boldon
Linux:
--boldoff
1.Run ctl.sh to init env: . ctl.sh
2.Execute up to get svn code: up
3.Execute rg to generate compile scripts: rg
4.Enter xtrunk dir and run make_mmpc_sdk.sh to build all module: . make_mmpc_sdk.sh

--boldon
Windows:
--boldoff
1.Run get_mmp.bat to get svn code: get_mmp.bat
2.Run gen_mmpsln.bat to generate the vs project file: gen_mmpsln.bat
--endoutput

--beginoutput
--color yellow
--heading Tips
--color white
1.The home dir is xtrunk
2.The out dir is the build output of all moudule, pack dir is the build output for app
--endoutput
--## comment somewhere else
