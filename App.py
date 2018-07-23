from flask import Flask
from flask import Flask, flash, redirect, render_template, request, session, abort
import os

app = Flask(__name__)

@app.route('/')
def home():
	return render_template('index.html')

@app.route('/server')
def server():
	return render_template('server.html')

@app.route('/login')
def login():
	return render_template('login.html')

if __name__ == "__main__":
	app.secret_key = os.urandom(12)
	app.run(debug=True)
