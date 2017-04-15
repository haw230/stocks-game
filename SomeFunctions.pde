public int firstDigitRemoved(int x) {
  String temp = Integer.toString(x);
  int y = Integer.parseInt(temp.substring(0,temp.length() - 1));
  return y;
}

void fetch() { //grabs stock info
  if(rapid) {
    boolean temp = true; //sees if is new stock
    for(int i = 0; i < vals.size(); i++) {
      String[] names = vals.keyArray();
      if(names[i].equals(sym)) {
        symCost = Double.parseDouble(vals.get(sym));
        temp = false;
        break;
      }
    }
    if(temp) {
      symCost = roundVal(random(200) / random(100) * random(38) + random(40) - random(11));
      vals.set(sym, "" + symCost);
    }
    stockDisplayed = true;
    stockName = sym;
  } else{
    String[] response = loadStrings("http://www.google.com/finance/info?q=" + sym);
    if(response != null) {
      response[6] = response[6].replace("\"", "");
      symCost = Double.parseDouble((response[6].split(":")[1]));
      stockDisplayed = true;
      stockName = sym;
    } else{
      stockName = "This stock does not exist";
      stockDisplayed = false; //get rid of buy button
      symCost = 0; //get rid of older price
    }
  }
}

void setMenu(int x) {
  if(x == 1) {
    currentMenu = buy;
  } else if(x == 2){
    currentMenu = sell; 
  } else{
    currentMenu = open; 
  }
}

String[] writeOut(StringDict x) { //stringdict to ini file format
  String[] keys = x.keyArray();
  String[] val = x.valueArray();
  String[] outLines = new String[x.size() + 2];
  for(int i = 0, j = x.size(); i < j; i++) {
     outLines[i] = keys[i] + ":" + val[i];
  }
  outLines[x.size()] = "" + money;
  if(rapid) {
    outLines[x.size() + 1] = "rapid";
    String[] prices2 = new String[10];
    for(int i = 0; i < prices.length; i++) {
      prices2[i] = "" + prices[i];
    }
    saveStrings("rapid.ini", prices2);
  } else{
    outLines[x.size() + 1] = "normal";
  }
  return outLines;
}

void loadStocks() {
  String[] temp = loadStrings("save.ini");
  String[] arr;
  if(temp.length - 2 != 0) {
    for(int i = 0; i < temp.length - 2; i++) {
      arr = split(temp[i], ':');
      inventory.set(arr[0], arr[1]);
    }
    money = Double.parseDouble(temp[temp.length - 2]);
  }
  if(temp[temp.length - 1].equals("rapid")) {;
    rapid = true;
    String[] prices2 = loadStrings("rapid.ini");
    for(int i = 0; i < prices2.length; i++) {
      prices[i] = float(prices2[i]);
    }
    for(int i = 0; i < temp.length - 2; i++) {
      vals.set(split(temp[i], ':')[0], prices2[i]);
    }
  } else{
    rapid = false;
  }
}

double roundVal(double x) {
  return Double.parseDouble(df.format(x));
}