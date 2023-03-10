from flask import Flask
from flask import request

import easyocr

app = Flask(__name__)

@app.post('/upload-picture4')
def upload_picture4():

    name = request.form.get("name", "")

    reader = easyocr.Reader(['ko'], gpu=False)
    result = reader.readtext('c:/control/' + name, detail = 0)
    # result = reader.readtext('c:/control/test1.jpg', detail = 0)

    print(result[0])

    return result[0]