class BuyMenu implements Menu {
  void render() {
    funds = "Funds: $" + money; //sets money to money user has
    fill(235);
    rect(0, 0, 100, 33); //save button
    rect(width - 103, 0, 100, 33); //screen switch button
    fill(0);
    textSize(30);
    if(rapid) {
      text("Type in anything!", 0, 445);
    } else{
      text("Suggested Stocks:", 0, 445);
      text("GOOG", 0, 475);
      text("FB", 0, 510); //+33
      text("GOOGL", 0, 540);
      text("GEVO", 0, 573);
      textSize(25);
      text("For More: https://www.google.com/finance", 0, 606);
    }
    textSize(52);
    text(name, width / 2 - textWidth(name) / 2, 50); //title
    textSize(30);
    text(state, width - 102, -2, 919, 238); //buying or selling state
    text(funds, width / 2 - textWidth(funds) / 2, 110); //displays money
    text("Save", 15, 26);
    fill(255);
    rect(145, 158, 314, 55); //textbox for symbol
    fill(0);
    textSize(52);
    text(sym, 147, 153, 560, 155); //prints out what user has typed
    textSize(30);
    text(stockName, width / 2 - textWidth(stockName) / 2, 272); //Shows name of stock
    text(warning, 111, 398, 466, 200);
    if(symCost != 0) {
      text("$" + symCost, width / 2 - textWidth("$" + symCost) / 2, 300); //displays stock value
    }
    if(stockDisplayed && clicked) { //displays buy option once a valid stock is searched; need to make cancel button
      fill(235);
      rect(270, 324, 61, 38);
      fill(0);
      text("Buy", width / 2 - textWidth("Buy") / 2, 353);
    }
    if(buyOptions) { //once buy is clicked
      fill(255);
      rect(255, 325, 96, 26); //box for how many to buy
      rect(273, 369, 56, 19); //box for cancel button
      fill(0);
      text(shares, 256, 349); //displays how many to buy
      textSize(15);
      text("Cancel", width / 2 - textWidth("Cancel") / 2, 384); //cancel button
    }
  }
}