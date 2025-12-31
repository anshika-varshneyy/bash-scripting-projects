from flask import Flask, render_template
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    return render_template(
        "index.html",
        app_name="Flask UI App",
        time=datetime.now().strftime("%d %b %Y, %I:%M %p")
    )

@app.route("/health")
def health():
    return {"status": "UP"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

