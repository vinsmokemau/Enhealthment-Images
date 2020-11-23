import cv2
import json
import requests


option = input("""Si desea subir una foto guardada ingrese (0)

Si desea tomar una foto con la cámara ingrese (1)


------>   """)

if '0' == option:
    image_name = input('Ingresa el nombre del archivo con todo y extensión: ')
elif '1' == option:
    webcam = cv2.VideoCapture(0)
    check, frame = webcam.read()
    cv2.imwrite(filename='saved_img.png', img=frame)
    webcam.release()
    cv2.destroyAllWindows()
    image_name = 'saved_img.png'

endpoint = 'http://164.90.146.236:8000/api/v1.0/images/'

data = {
    'name': 'saved_img',
}

files = {
    'image': open(image_name, 'rb'),
}

r = requests.post(url=endpoint, data=data, files=files)

print(r.text)

