
from flask import Flask
import pandas as pd

app = Flask(__name__)

@app.route('/')
def home():
    df = pd.DataFrame({'data': [1, 2, 3]})
    return df.to_json()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
