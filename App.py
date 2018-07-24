from flask import Flask, request, session, redirect, url_for, abort, render_template, flash, jsonify
from flaskext.mysql import MySQL
from functools import wraps
import os, json, requests

_app = Flask(__name__)
mysql = MySQL()

_app.config.update(dict(
	SECRET_KEY = 'h[#T@t$bKvya*h[#T@t$bKvya*h[#T@t$bKvya*ctr(^ctr(^ctr(^',
))

#MySQL Configuration
_Database_Username = 'root'
_Database_Password = 'toor'
_Database_Database = 'WAFer'
_Database_Host = '127.0.0.1'

_app.config['MYSQL_DATABASE_USER'] = _Database_Username
_app.config['MYSQL_DATABASE_PASSWORD'] = _Database_Password
_app.config['MYSQL_DATABASE_DB'] = _Database_Database
_app.config['MYSQL_DATABASE_HOST'] = _Database_Host
mysql.init_app(_app)

__conn = mysql.connect()
__cursor = __conn.cursor()

#Check is session exists
def is_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'logged_in' in session:
			return f(*args, **kwargs)
		else:
			return render_template('login.html',errorMessage="You must login first!")
	return wrap

def SendRequestAddServer(__ServerName,__IPAddress,__PortAddress,__Hostname,__ModSecurityVal):
	r = requests.post("http://192.168.56.103:9112/addServer.php",data = {
			'ServerName':__ServerName,
			'IP':__IPAddress,
			'Port':__PortAddress,
			'Domain':__Hostname,
			'ModSecurity':__ModSecurityVal
		})
	return r.text

def SendRequestPingServer(__JSONDump):
	r = requests.post("http://192.168.56.103:9112/pingServer.php", data = {
			'ListIPJSON':__JSONDump
		})
	return r.text

@_app.route('/')
@is_logged_in
def home():
	return render_template('index.html')

@_app.route('/server')
@is_logged_in
def server():
	__cursor.callproc('WAF_Read_ServerList')
	__conn.commit()
	__Result = __cursor.fetchall()
	__ServerList = []

	for value in __Result:
		__ServerList.append({
			'ServerID':value[0],
			'ServerName':value[1],
			'IP':value[2],
			'Port':value[3],
			'Hostname':value[4],
			'ModSecurity':value[5]
		})

	__FinalResult = json.loads(SendRequestPingServer(json.dumps(__ServerList)))
	return render_template('server.html',ServerListResult=__FinalResult)

@_app.route('/addServer',methods=['GET','POST'])
@is_logged_in
def addServer():
	if request.method == 'POST':
		__ServerName_addServer_Form = request.form['servername']
		__IPAddress_addServer_Form = request.form['IPAddress']
		__PortOpen_addServer_Form = request.form['PortsOpen']
		__Hostname_addServer_Form = request.form['DomainORhostname']
		__ModSec_addServer_Form = str(request.form.getlist("ModSecurityVal")[0] if None else 0)
		
		__args = [session['userProfileID'],__ServerName_addServer_Form,__IPAddress_addServer_Form,__PortOpen_addServer_Form,__Hostname_addServer_Form,__ModSec_addServer_Form]
		__cursor.callproc('WAF_Insert_ServerList',__args)
		__conn.commit()
		__Result = __cursor.fetchall()
		if __Result[0][0] == '0':
			return render_template('addserver.html',errorMessage=__Result[0][1])
		else:
			__ResultPOSTServer = json.loads(SendRequestAddServer(__ServerName_addServer_Form,__IPAddress_addServer_Form,__PortOpen_addServer_Form,__Hostname_addServer_Form,__ModSec_addServer_Form))
			if __ResultPOSTServer["Status"] == "0":
				return render_template('addserver.html',errorMessage=__ResultPOSTServer["Message"])
			else:
				return redirect(url_for('server'))
	else:
		return render_template('addserver.html')

@_app.route('/login',methods=['POST'])
def login():
	_Username_Login_Form = request.form['username']
	_Password_Login_Form = request.form['password']
	# try:
	error = None
	
	__args = [_Username_Login_Form,_Password_Login_Form]
	__cursor.callproc('WAF_Read_Login',__args)
	__conn.commit()
	__Result = __cursor.fetchall()
	if len(__Result) != 0:
		session['logged_in'] = True
		session["userProfileID"] = __Result[0][1]
		session["userProfileName"] = __Result[0][0]
		session["UserJobPosID"] = __Result[0][2]
		session["UserJobPosName"] = __Result[0][3]
		return redirect(url_for('home'))
	else:
		error = "Invalid Username or Password!"
		return render_template('login.html',errorMessage=error)

@_app.route('/logout')
def logout():
	session.pop("logged_in")
	session.pop("userProfileID")
	session.pop("userProfileName")
	session.pop("UserJobPosID")
	session.pop("UserJobPosName")
	return redirect(url_for('home'))

if __name__ == "__main__":
	_app.secret_key = os.urandom(12)
	_app.run(debug=True)
