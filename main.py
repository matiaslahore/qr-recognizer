#Libraries
import os
import sys
import time
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
from sensor import distance
import actuador
from conection import deliverPackage
sys.path.insert(0, ROOT_DIR + '/codeQrReader')
from reader import scanCode

DISTANCIA_MINIMA = 30


if __name__ == '__main__':
    try:
        while True:
            dist = distance()
	    print ("No hay caja")
            time.sleep(1)
	    if (dist < DISTANCIA_MINIMA):
	    	code = scanCode()
	    	if ( code ):
                    data = deliverPackage(code)
                    print data
                    if (data == "farmacia1OSDE"):
                        actuador.verdeOn()
                        time.sleep(10)
                        actuador.verdeOff()
                    else:
                        actuador.rojoOn()
                        time.sleep(10)
                        actuador.rojoOff()
        
 
        # Reset by pressing CTRL + C
    except KeyboardInterrupt:
        print("Measurement stopped by User")
        GPIO.cleanup()