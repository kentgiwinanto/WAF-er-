from flask import Flask, request, session, redirect, url_for, abort, render_template, flash, jsonify
from flaskext.mysql import MySQL
from functools import wraps
import os

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

#Check is session exists
def is_logged_in(f):
	@wraps(f)
	def wrap(*args, **kwargs):
		if 'logged_in' in session:
			return f(*args, **kwargs)
		else:
			return render_template('login.html',errorMessage="You must login first!")
	return wrap

@_app.route('/')
@is_logged_in
def home():
	return render_template('index.html')

@_app.route('/server')
@is_logged_in
def server():
	return render_template('server.html')

@_app.route('/login',methods=['POST'])
def login():
	_Username_Login_Form = request.form['username']
	_Password_Login_Form = request.form['password']
	# try:
	error = None
	conn = mysql.connect()
	cursor = conn.cursor()
	args = [_Username_Login_Form,_Password_Login_Form]
	cursor.callproc('WAF_Read_Login',args)
	conn.commit()
	Result = cursor.fetchall()
	if len(Result) != 0:
		session['logged_in'] = True
		session["userProfileID"] = Result[0][1]
		session["userProfileName"] = Result[0][0]
		session["UserJobPosID"] = Result[0][2]
		session["UserJobPosName"] = Result[0][3]
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
