import RPi.GPIO as GPIO

LED_VERDE = 23
LED_ROJO = 22

#GPIO.setmode(GPIO.BOARD)
GPIO.setup(LED_VERDE, GPIO.OUT)
GPIO.setup(LED_ROJO, GPIO.OUT)
 
def verdeOn():
    GPIO.output(LED_VERDE, True)

def verdeOff():
    GPIO.output(LED_VERDE, False)
     
def rojoOn():
    GPIO.output(LED_ROJO, True)

def rojoOff():
    GPIO.output(LED_ROJO, False)