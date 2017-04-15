void mouseClicked(){
  if(opened) {
    if(mouseX > width - 103 && mouseX < width && mouseY > 0  && mouseY < 33) { //switching from selling to buying
      stockDisplayed = false;
      warning = "";
      if(selling) {
        selling = false;
        state = "Buying";
        sellingThis = -1;
        wait = 0;
      } else{
        selling = true;
        stockName = "";
        symCost = 0;
        state = "Selling";
        buyOptions = false;
        clicked = true;
        wait = 0;
      }
    }
    if(mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 33) {
      saveStrings("save.ini", writeOut(inventory));
    }
    if(state.equals("Buying")) {
      if(stockDisplayed && clicked) { //click option rect(270, 324, 61, 38);
        if(mouseX > 270 && mouseX < 331 && mouseY > 324 && mouseY < 362) {
          buyOptions = true;
          clicked = false;
        }
      }
      if(buyOptions) {
        if(mouseX > 273 && mouseX < 329 && mouseY > 369 && mouseY < 388) { //cancel clicked
          buyOptions = false;
          clicked = true;
          shares = 0;
          warning = "";
        } 
      }
    } else{
       for(int i = 0; i < buttons.length; i++) { //466, 171 + 60 * i, 85, 33
          if(mouseX > 466 && mouseX < 551 && mouseY > buttons[i] && mouseY < buttons[i] + 33) {
            sellingThis = i;
            break;
          }
       }
    }
  } else if(!newIsChosen){
    if(mouseX > 236 && mouseX < 345 && mouseY > 124 && mouseY < 184) {
      newIsChosen = true;
    }
    if(mouseX > 236 && mouseX < 345 && mouseY > 200 && mouseY < 259) { //when load is clicked
      opened = true;
      loadStocks();
    }
  } else{
    if(mouseX > 202 && mouseX < 400 && mouseY > 177 && mouseY < 236) { //normal
      opened = true;
    }
    if(mouseX > 114 && mouseX < 483 && mouseY > 338 && mouseY < 398) { //rags
      money = 1;
      opened = true;
    }
    if(mouseX > 197 && mouseX < 399 && mouseY > 509 && mouseY < 561) { //custom
      custom = true;
    }
    if(mouseX > 226 && mouseX < 377 && mouseY > 42 && mouseY < 102) { //rapid
      rapid = true;
      opened = true;
    }
  }
}