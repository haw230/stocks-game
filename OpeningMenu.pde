class OpenMenu implements Menu {
  void render() {
    if(newIsChosen) {
      fill(255);
      rect(202, 177, 198, 59); //normal
      rect(114, 338, 369, 60); //rags
      rect(197, 509, 202, 52); //custom
      rect(226, 42, 151, 60); //rapid
      fill(0);
      text("Normal", width / 2 - textWidth("Normal") / 2, 224);
      text("Rags to Riches", width / 2 - textWidth("Rags to Riches") / 2, 387);
      text("Rapid", width / 2 - textWidth("Rapid") / 2, 87);
      if(!custom) {
        text("Custom", width / 2 - textWidth("Custom") / 2, 552);
      } else{
        text(startingAmount, 200, 552); //custome button
      }
    } else if(!newIsChosen){
      fill(255);
      rect(236, 200, 129, 59); //load button
      rect(236, 124, 129, 60); //new button
      fill(0);
      textSize(52);
      text("New", width / 2 - textWidth("New") / 2, 170);
      text("Load", width / 2 - textWidth("Load") / 2, 251);
    }
  }
}