import cv2
import json
import requests
from base64 import b64encode


webcam = cv2.VideoCapture(0)
check, frame = webcam.read()
cv2.imwrite(filename='saved_img.png', img=frame)
webcam.release()
cv2.destroyAllWindows()

endpoint = 'http://164.90.146.236:8000/api/v1.0/images/'

data = {
    'name': "saved-img",
    'image': open('saved_img.png', 'rb'),
}

r = requests.post(url=endpoint, files=data)

print(r.text)

