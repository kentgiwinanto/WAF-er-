from flask import Flask, request, session, redirect, url_for, abort, render_template, flash, jsonify,make_response
from flaskext.mysql import MySQL
from functools import wraps
from ua_parser import user_agent_parser
import os, json, requests, datetime

__app = Flask(__name__)
__app.config['JSON_SORT_KEYS'] = False
__app.config.update(dict(
	SECRET_KEY = 'h[#T@t$bKvya*h[#T@t$bKvya*h[#T@t$bKvya*ctr(^ctr(^ctr(^',
))

#MySQL Configuration
mysql = MySQL()
__Database_Username = 'root'
__Database_Password = ''
__Database_Database = 'WAFer'
__Database_Host = '127.0.0.1'
__app.config['MYSQL_DATABASE_USER'] = __Database_Username
__app.config['MYSQL_DATABASE_PASSWORD'] = __Database_Password
__app.config['MYSQL_DATABASE_DB'] = __Database_Database
__app.config['MYSQL_DATABASE_HOST'] = __Database_Host

mysql.init_app(__app)

###Variables
# __ReverseProxy_Address = "http://103.106.81.87:8080/"
# __ReverseProxy_Address = "http://10.10.10.2:80/"
__headers_requests = {
    'User-Agent': 'WAFer Crawler/1.0'
}




### Decorators section
def is_logged_in(f): #Check if session already exist or not
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

# def SendRequestPingServer(__JSONDump):
# 	r = requests.post(
# 			__ReverseProxy_Address+"pingServer.php",
# 			headers = __headers_requests,
# 			data = {
# 				'ListIPJSON':__JSONDump
# 			}
# 		)
# 	return r.text

def GetLogsFromServer(): # Get Logs from Server and then convert all list into dict
	global __SecLogs_WAF_ReverseProxy
	global __AccessLogs_Nginx_ReverseProxy
	__SecLogs_WAF_ReverseProxy = json.loads(requests.get("http://103.106.81.87:58724/GetLogs.php").text)
	__AccessLogs_Nginx_ReverseProxy = json.loads(requests.get("http://103.106.81.87:58724/GetAccessLogs.php").text)
	
	for key,value in enumerate(__SecLogs_WAF_ReverseProxy):
		__SecLogs_WAF_ReverseProxy[key] = json.loads(value)

	for key,value in enumerate(__AccessLogs_Nginx_ReverseProxy):
		__AccessLogs_Nginx_ReverseProxy[key] = json.loads(value)

### routes and business process logic
@__app.route('/')
@is_logged_in
def home():
	GetLogsFromServer()
	__conn = mysql.connect()
	__cursor = __conn.cursor()
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
	# __FinalResult_ServerList = json.loads(SendRequestPingServer(json.dumps(__ServerList)))

	print(__AccessLogs_Nginx_ReverseProxy[0]['time_local'].split('/'))

	return render_template('index.html',SecurityLog=__SecLogs_WAF_ReverseProxy,AccessLogs=__AccessLogs_Nginx_ReverseProxy,ServerListResult=__ServerList)

@__app.route('/manageuser',methods=['GET','POST'])
@is_logged_in
def manageuser():
	if request.method == 'POST':
		if request.form['action'] == 'AddUser':
			__FirstName_AddUser_Form = request.form['FirstNametxt']
			__LastName_AddUser_Form = request.form['LastNametxt']
			__Password_AddUser_Form = request.form['Passwordtxt']
			__ConfPass_AddUser_Form = request.form['ConfPasstxt']
			if __Password_AddUser_Form == __ConfPass_AddUser_Form:
				__args = [__FirstName_AddUser_Form,__LastName_AddUser_Form,'UserJobPosID_1d1f20a9-3966',__Password_AddUser_Form,session['userProfileID']]
				__conn = mysql.connect()
				__cursor = __conn.cursor()
				__cursor.callproc('WAF_Insert_Register',__args)
				__conn.commit()
				__Result = __cursor.fetchall()
				return jsonify({"Status":"1","Message":"User have been added Successfully!"})
			else:
				return jsonify({"Status":"0","Message":"Password does not match!"})

		elif request.form['action'] == 'GetUser':
			__conn = mysql.connect()
			__cursor = __conn.cursor()
			__cursor.callproc('WAF_Read_GetAllUser')
			__conn.commit()
			__Result = __cursor.fetchall()
			return jsonify({"Status":"1","Message":__Result})

		elif request.form['action'] == 'GetUserDetail':
			__UserProfileID_GetUserDetail_Form = request.form['UserProfileID']
			__conn = mysql.connect()
			__cursor = __conn.cursor()
			__args = [__UserProfileID_GetUserDetail_Form]
			__cursor.callproc('WAF_Read_GetUserDetail',__args)
			__conn.commit()
			__Result = __cursor.fetchall()
			return jsonify({"Status":"1","Message":__Result})

		elif request.form['action'] == 'EditUser':
			__UserProfileID_EditUser_Form = request.form['UserProfileID']
			__FirstName_EditUser_Form = request.form['FirstName']
			__LastName_EditUser_Form = request.form['LastName']
			__Password_EditUser_Form = request.form['Password']
			__ConfPassword_EditUser_Form = request.form['ConfPassword']
			if __Password_EditUser_Form == __ConfPassword_EditUser_Form:
				__conn = mysql.connect()
				__cursor = __conn.cursor()
				__args = [__FirstName_EditUser_Form,__LastName_EditUser_Form,__Password_EditUser_Form,__UserProfileID_EditUser_Form,session['userProfileID']]
				__cursor.callproc('WAF_Update_EditProfileAdminPage',__args)
				__conn.commit()
				__Result = __cursor.fetchall()
				return jsonify({"Status":"1","Message":"User have been edited Successfully!"})
			else:
				return jsonify({"Status":"0","Message":"Password does not match!"})

		elif request.form['action'] == 'DeleteUser':
			__UserProfileID_DeleteUser_Form = request.form['UserProfileID']
			__args = [session['userProfileID'],__UserProfileID_DeleteUser_Form]
			__conn = mysql.connect()
			__cursor = __conn.cursor()
			__cursor.callproc('WAF_Update_DeleteUser',__args)
			__conn.commit()
			__Result = __cursor.fetchall()
			return jsonify({"Status":"1","Message":"User has been deleted Successfully!"})
	else:
		return render_template('manageuser.html')

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
		__conn = mysql.connect()
		__cursor = __conn.cursor()
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
	__conn = mysql.connect()
	__cursor = __conn.cursor()
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

	return jsonify({'SecurityLogs':json.dumps(__SecLogs_Detail_Return),'AccessLogs':json.dumps(__AccessLogs_Detail_Return)})

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
	__conn = mysql.connect()
	__cursor = __conn.cursor()
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
		error = "Invalid Username or Password!Backend"
		return render_template('login.html',errorMessage=error)

@__app.route('/logout')
def logout():
	session.pop("logged_in")
	session.pop("userProfileID")
	session.pop("userProfileName")
	session.pop("UserJobPosID")
	session.pop("UserJobPosName")
	return redirect(url_for('home'))

@__app.route('/rpdf')
def report():
	
	return render_template('rpdf.html')


### Chart Section
@__app.route('/getWeeklyAccessActivity')
def GetWeeklyAccessActivity():
	chart = {}
	for x in __AccessLogs_Nginx_ReverseProxy:
		if len(chart) == 7:
			break
		else:
			if str(x['time_local'].split('/')[0]+x['time_local'].split('/')[1]) in chart:
				chart[str(x['time_local'].split('/')[0]+x['time_local'].split('/')[1])]+=1
			else:
				chart[str(x['time_local'].split('/')[0]+x['time_local'].split('/')[1])] = 1
	return jsonify(chart)

@__app.route('/getMonthlyAttackSummary')
def getMonthlyAttackSummary():
	chart = {}
	for x in __SecLogs_WAF_ReverseProxy:
		if x['transaction']['time_stamp'].split(' ')[1] in chart:
			chart[x['transaction']['time_stamp'].split(' ')[1]] += 1
		else:
			chart[x['transaction']['time_stamp'].split(' ')[1]] = 1
	return jsonify(chart)

@__app.route('/getDailyAccessMethod')
def getDailyAccessMethod():
	chart = {}
	for x in __AccessLogs_Nginx_ReverseProxy:
		if x['time_local'].split('/')[0]+x['time_local'].split('/')[1] == datetime.datetime.today().strftime('%d%b'):
			if x['request'].split(' ')[0] in chart:
				chart[x['request'].split(' ')[0]] += 1
			else:
				chart[x['request'].split(' ')[0]] = 1

	return jsonify(chart)

@__app.route('/getDailyErrorStatusCode')
def getDailyErrorStatusCode():
	chart = {}
	for x in __AccessLogs_Nginx_ReverseProxy:
		if x['time_local'].split('/')[0]+x['time_local'].split('/')[1] == datetime.datetime.today().strftime('%d%b'):
			if x['status'] in chart:
				chart[x['status']] += 1
			else:
				chart[x['status']] = 1
	chart.pop('200',None)
	return jsonify(chart)

@__app.route('/getUserAgentAccessMonthly')
def getUserAgentAccessMonthly():
	chart = {}
	for x in __AccessLogs_Nginx_ReverseProxy:
		if x['time_local'].split('/')[1] == datetime.datetime.today().strftime('%b'):
			if user_agent_parser.ParseUserAgent(x['http_user_agent'])['family'] in chart:
				chart[user_agent_parser.ParseUserAgent(x['http_user_agent'])['family']] += 1
			else:
				chart[user_agent_parser.ParseUserAgent(x['http_user_agent'])['family']] = 1
	return jsonify(chart)

if __name__ == "__main__":
	__app.secret_key = os.urandom(12)
	__app.run(host='0.0.0.0',debug=True)
