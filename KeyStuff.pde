private int count = 0; //counts digits

void keyPressed() {
  if(custom) {
    if(key > 47 && key < 58) {
      if(count < 6) {
        startingAmount = Character.getNumericValue(key) + startingAmount * 10;
        count++;
      }
    } else if (key == BACKSPACE) {
      if(count > 1 && Integer.toString(startingAmount) != "") {
        shares = firstDigitRemoved(startingAmount);
        count--;
      } else{
        startingAmount = 0; 
      }
    } else if (key == ENTER) {
      money = startingAmount;
      opened = true;
    }
  }
  if(!selling && opened) { //if not selling (aka buying)
    if(!buyOptions) { //searching up stock
      if (key == BACKSPACE) { //allows user to delete input
        if (sym.length() > 0) {
          sym = sym.substring(0, sym.length() - 1);
          charCount--;
        }
      } else if (key == ENTER) {
        if (sym.length() > 0) { //empty string check
          charCount = 0;
          fetch();
          sym = "";
        }
      } else if (key > 64 && key < 91) { //cap letters
        if (charCount < 5) {
          sym += key;
          charCount++;
        }
      } else if (key > 96 && key < 123) { //low letters to cap
        if (charCount < 5) {
          sym += Character.toUpperCase(key);
          charCount++;
        }
      }
    } else{ //buy stock
       if(key > 47 && key < 58) {
         if(count < 5) {
           shares = Character.getNumericValue(key) + shares * 10;
           count++;
         }
       } else if (key == BACKSPACE) { //to be implemented
         if(count > 1 && Integer.toString(shares) != "") {
           shares = firstDigitRemoved(shares);
           count--;
         } else{
           shares = 0; 
         }
       } else if (key == ENTER) {
         if(shares != 0) { //checks if nothing is entered
           if(inventory.size() > 9) {
              warning = "You may only own 10 stocks at a time";
           }
           else if(money - shares * symCost > 0) { //if can buy
             //rapidVal[valCount] = symCost;
             if(inventory.size() == 0) {
               inventory.set(stockName, Integer.toString(shares));
               valCount++;
             } else{ //checks if stock already exists in the string dict
               boolean newStock = true; //tracks if it already exists
               String[] arr = inventory.keyArray();
               for(int i = 0; i < arr.length; i++) {
                 if(arr[i].equals(stockName)) {
                   inventory.set(stockName, Integer.toString(Integer.parseInt(inventory.get(stockName)) + shares)); //if the stockname exists already, add
                   newStock = false;
                   break;
                 }
                 if(newStock) {
                   inventory.set(stockName, Integer.toString(shares));
                   newStock = true;
                   valCount++;
                 }
               }
             }
             money -= shares * symCost; //transaction
             warning = ""; //in case there has been a warning
             shares = 0; //0 desired shares
             buyOptions = false; //menu dissappears
             clicked = true; //"Buy" button is back
             count = 0; //so count is reset
           } else{
             warning = "You do not have enough funds to make this transaction";
             shares = 0;
             count = 0;
           }
        }
      }
    }
  } else if(sellingThis > -1) { //buying mode
    if(key > 47 && key < 58) {
      if(count < 5) {
        sold = Character.getNumericValue(key) + sold * 10;
        count++;
      }
    } else if (key == BACKSPACE) {
      if(count > 1 && Integer.toString(sold) != "") {
        sold = firstDigitRemoved(sold);
        count--;
      } else{
        sold = 0;
      }
    } else if (key == ENTER) {
      String[] names = inventory.keyArray();
      String[] num = inventory.valueArray();
        if(sold <= int(num[sellingThis]) && sold != 0) { //if number sold is greater than owned, reject
          if(rapid) {
            money += prices[sellingThis] * sold;
          } else{
            String[] temp = loadStrings("http://www.google.com/finance/info?q=" + names[sellingThis]);
            temp[6] = temp[6].replace("\"", "");
            money += sold * Double.parseDouble((temp[6].split(":")[1]));
          }
          if(int(num[sellingThis]) - sold < 1) { //if this is the last owned stock
            inventory.remove(names[sellingThis]);
          } else{
            inventory.set(names[sellingThis], Integer.toString(Integer.parseInt(inventory.get(names[sellingThis])) - sold)); //new amount player owns
          }
        }
      sold = 0;
      count = 0;
      }
   }
}