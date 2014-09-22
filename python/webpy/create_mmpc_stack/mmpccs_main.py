
import web,os
import subprocess
import commands
import sys  
reload(sys)  
sys.setdefaultencoding('utf8')  

render = web.template.render('templates/')

urls = (
  '/', 'index'
)

class index:
    	def GET(self):
        	return render.index()

    	def POST(self):
		input_data = web.input()

		so_build_date = input_data.build_date
		crash_log = input_data.crash_log

		crash_log_file="crash.log"
		f = open(crash_log_file, "w")
		f.write(crash_log)

		so_build_date = input_data.build_date
		symbol_path=( "/var/www/xtrunk/symbol/" + so_build_date + "/")
		crash_stack = os.popen("cat '%s' | ndk-stack -sym %s | head -n 30" % (crash_log_file, symbol_path) ).read()
		
		if crash_stack == "":
			crash_stack="No Crash Found!"

		session_so_path=(symbol_path + "libsessionvc.so")
		so_version = os.popen("strings %s | grep mmpc_version " % (session_so_path)).read()

            	return "\nServer %s \n\n %s" % (so_version, crash_stack)


if __name__ == "__main__": 
	app = web.application(urls, globals())
	app.run()
