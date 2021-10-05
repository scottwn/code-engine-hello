from flask import Flask
from qiskit_metal import designs
app = Flask(__name__)

@app.route('/say_hello')
def say_hello():
    return 'hello world'

@app.route('/say_hello_again')
def say_hello_again():
    return 'hello world again'

@app.route('/get_design_name')
def get_design_name():
    design = designs.DesignPlanar()
    return design.get_design_name()
