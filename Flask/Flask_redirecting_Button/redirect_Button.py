#Tutorial: https://kanchanardj.medium.com/redirecting-to-another-page-with-button-click-in-python-flask-c112a2a2304c

from flask import Flask, request,render_template

app = Flask(__name__)

@app.route('/')
def index():    
    return render_template('index.html')
    
@app.route('/pag_teste')
def vmd_timestamp():
    return render_template('page_teste.html')

if __name__ == '__main__':
    app.debug = True
    app.run()