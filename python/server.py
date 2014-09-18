
import web,os
import subprocess

render = web.template.render('templates/')

urls = (
  '/', 'index'
)

class index:
    	def __init__(self):
    		self.registerForm = web.form.Form(
            	web.form.Textarea('crash_log', web.form.notnull,rows = 40, cols=100,  description='put crash log to this area'),
            	web.form.Button('create stack'),
        )

    	def GET(self):
        	form = self.registerForm()
        	return render.form(content=form)

    	def POST(self):
        	form = self.registerForm()
        	if(not form.validates()):
            		return render.form(form)
        	else:
			crash_log = form.d.crash_log
			symbol_path="/var/www/xtrunk/symbol"
			crash_stack = os.popen("echo '%s' | ndk-stack -sym %s | head -n 30" % (crash_log, symbol_path) ).read()

			session_so_path=("/var/www/xtrunk/symbol/" + "libsessionvc.so")
			so_version = os.popen("strings %s | grep mmpc_version " % (session_so_path)).read()

            		return "\nServer %s \n\n %s" % (so_version, crash_stack)

if __name__ == "__main__": 
	app = web.application(urls, globals())
	app.run()
