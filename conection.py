import requests 

URL_GET = "http://192.168.44.34:5000/packages"
URL_POST = "http://192.168.44.34:5000/package"

def getPackages():
    PARAMS = {'code':code}
    r = requests.get(url = URL_GET, params = PARAMS)
    data = r.json()
    print data

def deliverPackage(code):
    PARAMS = {'code':code}
    r = requests.put(url = URL_POST, params = PARAMS)
    data = r.json()
    return data