

class  StringParser{


  Map<String, String> parseString(String myString){
    // myString = 'WIFI:T:WPA;S:1234;P:4321;H:;;';
    Map<String, String> _dataMap = {};

    List<String> list = myString.split(";");

    for (var item in list) {
      List<String> itemList = item.split(":");
      if(itemList[0] == 'S'){
        _dataMap['SSID']= itemList[1];
      }
      if(itemList[0] == 'P'){
        _dataMap['PSWRD']= itemList[1];
      }
    }
    print(_dataMap);
    return _dataMap;
  }
}