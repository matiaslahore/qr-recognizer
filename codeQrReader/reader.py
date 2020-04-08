import zbarlight
import os
import sys
import PIL
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

def scanCode():
    # set Trigger to HIGH
    print 'Taking picture..'
    try:
        f = 1
        qr_count = len(os.listdir(ROOT_DIR + '/qr_codes'))
        #os.system('sudo fswebcam -d /dev/video'+sys.argv[1]+' -q qr_codes/qr_'+str(qr_count)+'.jpg')
        os.system('sudo fswebcam --no-banner -d /dev/video0'+' -q '+ ROOT_DIR + '/qr_codes/qr_'+str(qr_count)+'.jpg')
        print 'Picture taken..'
    except:
        f = 0
        print 'Picture couldn\'t be taken..'

    print

    if(f):
        print 'Scanning image..'
        f = open(ROOT_DIR + '/qr_codes/qr_'+str(qr_count)+'.jpg','rb')
        qr = PIL.Image.open(f);
        qr.load()

        codes = zbarlight.scan_codes('qrcode',qr)
        if(codes==None):
            os.remove(ROOT_DIR + '/qr_codes/qr_'+str(qr_count)+'.jpg')
            print 'No QR code found'
        else:
            f = open(ROOT_DIR + 'qr_code_messages.txt','a')
            for i in range(len(codes)):
                f.write(codes[i])
                if(i!=len(codes)-1):
                    f.write('^')
            f.write('~')
            return codes
            
if __name__ == '__main__':
    try:
        codes = scanCode()
        if(codes):
            print 'QR code(s):'
            print codes
 
        # Reset by pressing CTRL + C
    except KeyboardInterrupt:
        print("Measurement stopped by User")
        GPIO.cleanup()
