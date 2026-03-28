from flask import Flask, render_template, request
import googlecloudprofiler


app = Flask(__name__)

@app.route("/")
def main():
    model = {
        # "title": "Hello, GCP!", 
        # "title": "Hello, App Engine!", 
        "title": "Hello, Kubernetes Engine!", 
        # "title": "Hello, Cloud Run!", 
        "text": "Welcome to this demo running on Google Cloud's Kubernetes Engine."
    }
    return render_template('index.html', model=model)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True, threaded=True)
