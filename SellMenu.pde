class SellMenu implements Menu {
  void render() {
    funds = "Funds: $" + money; //sets money to money user has
    fill(235);
    rect(0, 0, 100, 33); //save button
    rect(width - 103, 0, 100, 33); //screen switch button
    fill(0);
    textSize(52);
    text(name, width / 2 - textWidth(name) / 2, 50); //title
    textSize(30);
    text(state, width - 102, -2, 919, 238); //buying or selling state
    text(funds, 0, 110); //displays money
    text("Save", 15, 26);
    if(inventory.size() > 0) {
      String[] names = inventory.keyArray();
      String[] num = inventory.valueArray();
      if(wait == 0) {
        for(int i = 0; i < inventory.size(); i++) {
          if(rapid) { //roundVal
            double temp = Double.parseDouble(vals.get(names[i]));
            temp += ((temp * random(30)) / 100.0 - (temp * random(20)) / 100.0);
            BigDecimal value = new BigDecimal(temp);
            println(value);
            prices[i] = temp;
          } else{
            String[] worth = loadStrings("http://www.google.com/finance/info?q=" + names[i]);
            worth[6] = worth[6].replace("\"", "");
            prices[i] = Double.parseDouble((worth[6].split(":")[1]));
          }
        }
        wait = 100;
      } else{
        wait--;
      }
      for(int i = 0; i < inventory.size(); i++) {
        text("Name", 50, 150);
        text("Shares", 175, 150);
        text("Value", 300, 150);
        text(names[i], 50, 200 + 60 * i); //name
        text(num[i], 175, 200 + 60 * i); //cost
        text("$" + prices[i], 300, 200 + 60 * i);
        if(sellingThis == i) {
          fill(255);
          rect(466, 171 + 60 * i, 100, 33);
          fill(0);
          text(sold, 470, 195 + 60 * i);
        } else{
          fill(255);
          rect(466, 171 + 60 * i, 85, 33); //466, 171 + 60 * i, 85, 33
          buttons[i] = 171 + 60 * i; //button logic
          fill(0);
          text("Sell", 481, 197 + 60 * i);
        }
      }
    }
   for(int i = 0; i < prices.length; i++) {
      total += prices[i];
    }
    total += money;
    textSize(27);
    text("Total: $" + total, 267, 109);
    total = 0;
  }
}