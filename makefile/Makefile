#var
mmpc_jar_name=mmp-client-1.0.0.jar
mmpc_jar_name_pack=mmp-client-${MMPC_JAR_MMPC_VERSION}.jar

libado_name=libadofw.so
libado_name_pack=libadofw${APP_NAME}.so
libado_path=${ADOPLAYER_HOME}/prebuilt

libavengine_name=libavengine.so
libavengine_name_pack=libavengine${APP_NAME}.so
libado_name_pack=libadofw${APP_NAME}.so
libavengine_path=${XTRUNK_HOME}/out/Release

libudp_transport_path=${XTRUNK_HOME}/out/Release/libudp_transport.so
libjxcore_path=${XTRUNK_HOME}/out/Release/lib/libjxcore.so

chatdemo_path=${CHATDEMO_HOME}
chatdemo_apk_name=chatdemo-debug.apk
chatdemo_apk_name_pack=chatdemo-$$(date +%Y%m%d).apk

voe_test_path=${VOETEST_HOME}
pack_path=${XTRUNK_HOME}/pack
pack_so_symbol_path=${pack_path}/symbol

#build env
APK_BUILD=ant debug
JAR_BUILD=mvn clean package

#makefile settings
strip_tool=${XTRUNK_HOME}/third_party/android_tools/ndk/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-x86_64/bin/arm-linux-androideabi-strip

#modules
all:pack_mmpc_sdk
	echo "pack mmpc sdk finished"

all_clean:
	$(RM) -rf out

pack_clean:
	$(RM) -rf ${pack_path}/*
	mkdir -p ${pack_so_symbol_path}
	@echo "pack clean finished"

allengine_clean:
	$(RM) ${pack_path}/libavengine*.so
	$(RM) ${pack_so_symbol_path}/libavengine*.so
	@echo "allengine clean finished"

allengine:allengine_clean
	ninja -C out/Release
	cp ${libavengine_path}/${libavengine_name} ${pack_so_symbol_path}/${libavengine_name_pack}
	cp ${libavengine_path}/${libavengine_name} ${pack_path}/${libavengine_name_pack}
	${strip_tool} ${pack_path}/${libavengine_name_pack}
	cp ${libado_path}/${libado_name} ${pack_so_symbol_path}/${libado_name_pack}	
	cp ${libado_path}/${libado_name} ${pack_path}/${libado_name_pack}
	${strip_tool} ${pack_path}/${libado_name_pack}
	@echo "build all engine finished"

mmpc_jar_clean:
	$(RM) ${pack_path}/mmp*.jar
	@echo "mmpc jar clean finished"

mmpc_jar:mmpc_jar_clean
	cd ${MMPC_HOME} && $(JAR_BUILD)
	cp -f ${MMPC_HOME}/target/${mmpc_jar_name} ${pack_path}/${mmpc_jar_name_pack}
	@echo "build mmpc_jar finished"

chatdemo_clean:
	$(RM) ${pack_path}/chatdemo*.apk
	@echo "chatdemo clean  finished"

chatdemo:chatdemo_clean allengine mmpc_jar
	$(RM) ${chatdemo_path}/libs/armeabi-v7a/*.so
	$(call copySdkToApp, ${chatdemo_path}/libs/armeabi-v7a,${chatdemo_path}/libs)
	cd ${chatdemo_path} && $(APK_BUILD)
	cp ${chatdemo_path}/bin/${chatdemo_apk_name} ${pack_path}/${chatdemo_apk_name_pack}
	@echo "build chatdemo finished"

voe_test_clean:
	$(RM) ${pack_path}/voetest*.apk
	@echo "voe test clean finished"

voe_test:allengine mmpc_jar
	$(RM) ${voe_test_path}/libs/armeabi-v7a/*.so
	$( call copySdkToApp, ${voe_test_path}/libs/armeabi-v7a,${voetest}/libs )
	cd ${voe_test_path} && $(APK_BUILD)
	@echo "build voetest finished"

pack_mmpc_sdk:chatdemo 
	cd ${pack_path} && tar -cvf mmpc_android_$$(date +%Y%m%d).tar *
	@echo "pack mmpc sdk finished"

#functions
define copySdkToApp

cp -f ${pack_path}/${libavengine_name_pack} ${1}
cp -f ${pack_path}/${libado_name_pack} ${1}
cp -f ${libudp_transport_path} ${1}
cp -f ${libjxcore_path} ${1}

cp -f ${MMPC_HOME}/target/${mmpc_jar_name} ${2}

endef
