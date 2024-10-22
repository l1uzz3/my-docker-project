from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Printing this from the docker container!"

if __name__ == "__main__":
    # This is where you specify the host and port
    app.run(port=8080)
