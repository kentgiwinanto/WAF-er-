from flask import Flask, request, session, redirect, url_for, abort, render_template, flash, jsonify,make_response
from flaskext.mysql import MySQL
from functools import wraps
import os, json, requests

__app = Flask(__name__)
mysql = MySQL()

__app.config.update(dict(
	SECRET_KEY = 'h[#T@t$bKvya*h[#T@t$bKvya*h[#T@t$bKvya*ctr(^ctr(^ctr(^',
))

#MySQL Configuration
__Database_Username = 'root'
__Database_Password = 'toor'
__Database_Database = 'WAFer'
__Database_Host = '127.0.0.1'

__app.config['MYSQL_DATABASE_USER'] = __Database_Username
__app.config['MYSQL_DATABASE_PASSWORD'] = __Database_Password
__app.config['MYSQL_DATABASE_DB'] = __Database_Database
__app.config['MYSQL_DATABASE_HOST'] = __Database_Host
mysql.init_app(__app)

###Variables
__ReverseProxy_Address = "http://192.168.56.103:9112/"
__headers_requests = {
    'User-Agent': 'WAFer Crawler/1.0'
}

__conn = mysql.connect()
__cursor = __conn.cursor()


### Decorators section
# Check is session exists
def is_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'logged_in' in session:
			return f(*args, **kwargs)
		else:
			return render_template('login.html',errorMessage="You must login first!")
	return wrap

### functions section
def SendRequestAddServer(__ServerName,__IPAddress,__PortAddress,__Hostname,__ModSecurityVal):
	r = requests.post(
			__ReverseProxy_Address+"addServer.php",
			headers = __headers_requests,
			data = {
				'ServerName':__ServerName,
				'IP':__IPAddress,
				'Port':__PortAddress,
				'Domain':__Hostname,
				'ModSecurity':__ModSecurityVal
			}
		)
	return r.text

def SendRequestPingServer(__JSONDump):
	r = requests.post(
			__ReverseProxy_Address+"pingServer.php",
			headers = __headers_requests,
			data = {
				'ListIPJSON':__JSONDump
			}
		)
	return r.text

def GetLogsFromServer():
	# Get Logs from Server and then convert all list into dict
	global __SecLogs_WAF_ReverseProxy
	global __AccessLogs_Nginx_ReverseProxy
	__SecLogs_WAF_ReverseProxy = json.loads(
									requests.get(
										__ReverseProxy_Address+"GetLogs.php",
										headers = __headers_requests
									).text
								)
	__AccessLogs_Nginx_ReverseProxy = json.loads(
										requests.get(
											__ReverseProxy_Address+"GetAccessLogs.php",
											headers = __headers_requests
										).text
									)
	
	for key,value in enumerate(__SecLogs_WAF_ReverseProxy):
		__SecLogs_WAF_ReverseProxy[key] = json.loads(value)

	for key,value in enumerate(__AccessLogs_Nginx_ReverseProxy):
		__AccessLogs_Nginx_ReverseProxy[key] = json.loads(value)

### routes and business process logic
@__app.route('/')
@is_logged_in
def home():
	GetLogsFromServer()

	#Get Server List
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

	global __FinalResult_ServerList
	__FinalResult_ServerList = json.loads(SendRequestPingServer(json.dumps(__ServerList)))

	return render_template('index.html',SecurityLog=__SecLogs_WAF_ReverseProxy,AccessLogs=__AccessLogs_Nginx_ReverseProxy,ServerListResult=__FinalResult_ServerList)

@__app.route('/addServer',methods=['GET','POST'])
@is_logged_in
def addServer():
	if request.method == 'POST':
		__ServerName_addServer_Form = request.form['servername']
		__IPAddress_addServer_Form = request.form['IPAddress']
		__PortOpen_addServer_Form = request.form['PortsOpen']
		__Hostname_addServer_Form = request.form['DomainORhostname']
		try:
			__ModSec_addServer_Form = request.form.getlist("ModSecurityVal")[0]
		except Exception as e:
			__ModSec_addServer_Form = '0'
		__args = [session['userProfileID'],__ServerName_addServer_Form,__IPAddress_addServer_Form,__PortOpen_addServer_Form,__Hostname_addServer_Form,__ModSec_addServer_Form]
		__cursor.callproc('WAF_Insert_ServerList',__args)
		__conn.commit()
		__Result = __cursor.fetchall()
		print(__Result)
		if __Result[0][0] == '0':
			return render_template('addserver.html',errorMessage=__Result[0][1])
		else:
			__ResultPOSTServer = json.loads(SendRequestAddServer(__ServerName_addServer_Form,__IPAddress_addServer_Form,__PortOpen_addServer_Form,__Hostname_addServer_Form,__ModSec_addServer_Form))
			if __ResultPOSTServer["Status"] == "0":
				return render_template('addserver.html',errorMessage=__ResultPOSTServer["Message"])
			else:
				flash("Server have been added Successfully!")
				return redirect(url_for('home'))
	else:
		return render_template('addserver.html')

@__app.route('/detail',methods=['POST'])
def detailServer():
	__ServerID_Detail_Page = request.form['ServerID']
	__SecLogs_Detail_Return = []
	__AccessLogs_Detail_Return = []
	__ServerDetail_Detail_Return = None
	GetLogsFromServer()

	__args = [__ServerID_Detail_Page]
	__cursor.callproc('WAF_Read_GetServerDetail',__args)
	__conn.commit()
	__Result = __cursor.fetchall()
	print(__Result)
	for x in __SecLogs_WAF_ReverseProxy:
		if __Result[0][4] == x['transaction']['request']['headers']['Host']:
			__SecLogs_Detail_Return.append(x)
		
	for x in __AccessLogs_Nginx_ReverseProxy:
		if __Result[0][2] == x['server_pass']:
			__AccessLogs_Detail_Return.append(x)

	# print(json.dumps(__SecLogs_Detail_Return))
	return jsonify({'SecurityLogs':json.dumps(__SecLogs_Detail_Return),'AccessLogs':json.dumps(__AccessLogs_Detail_Return)})
	# return render_template('detail.html',SecurityLogs=__SecLogs_Detail_Return,AccessLogs=__AccessLogs_Detail_Return)

@__app.route('/DetailLog',methods=['POST'])
def detailLog():
	GetLogsFromServer()
	__SecLogs_Detail_Return = []

	for x in __SecLogs_WAF_ReverseProxy:
		if request.form['SecLogID'] == x['transaction']['id']:
			__SecLogs_Detail_Return.append(x)

	return json.dumps(__SecLogs_Detail_Return)
	
@__app.route('/login',methods=['POST'])
def login():
	_Username_Login_Form = request.form['username']
	_Password_Login_Form = request.form['password']
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

@__app.route('/logout')
def logout():
	session.pop("logged_in")
	session.pop("userProfileID")
	session.pop("userProfileName")
	session.pop("UserJobPosID")
	session.pop("UserJobPosName")
	return redirect(url_for('home'))

if __name__ == "__main__":
	__app.secret_key = os.urandom(12)
	__app.run(debug=True)
