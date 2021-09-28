from flask import Flask
app = Flask(__name__)

@app.route('/say_hello')
def say_hello():
    return 'hello world'
