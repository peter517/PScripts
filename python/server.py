
import web,os
import subprocess

render = web.template.render('templates/')

urls = (
  '/', 'index'
)

class index:
    	def __init__(self):
    		self.registerForm = web.form.Form(
            # We're adding some fields and a submit button
            # Each field has a validator, which verifies its correctness
            # In this case we check if the field is not null
            # Other attributes are available: description, id, HTML class name, etc
            # See http://webpy.org/form for reference
            	web.form.Textarea('crash_log', web.form.notnull,rows = 40, cols=120,  description='put crash log to this area'),
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
			symbol_path=/var/www/xtrunk/symbol
			crash_stack = os.popen("echo '%s' | ndk-stack -sym %s | head -n 30" % (symbol_path, crash_log) ).read()
#			crash_stack = os.popen("cat tmp.log | ndk-stack -sym . | tee stack.log" ).read()
            		return "%s" % (crash_stack)

if __name__ == "__main__": 
	app = web.application(urls, globals())
	app.run()
