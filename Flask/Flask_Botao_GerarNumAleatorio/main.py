from flask import Flask, request, render_template

app = Flask(__name__)
app.config['SECRET_KEY'] = 'TaSecretado'


geraNumero = 0        
@app.route('/', methods=["GET", "POST"])
def button():
    from random import randint
    geraNumero = randint(1, 100)
    if request.method == "POST":
        return render_template("index.html", ButtonPressed = geraNumero)
    return render_template("index.html", ButtonPressed = geraNumero)


if __name__ == '__main__':
    app.debug = True
    app.run()