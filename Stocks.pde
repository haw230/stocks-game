import java.text.DecimalFormat; //for rounding
import java.math.*;

int charCount = 0; //max 5 char in stock names
int shares = 0; //default number of shares when buying
int sold = 0; //how much being sold
int sellingThis = -1; //which stock is being sold
int startingAmount = 0;
int valCount = 0;
int wait = 0;

double money = 5000; //starting cash
double symCost = 0; //value of stocks cost
double total = 0;

String sym = ""; //symbol being searched up, for display and fetching data
String name = "Stocks Game"; //title
String state = "Buying"; //buying or selling button
String funds; //display of money
static String stockName = ""; //name of stock
static String warning = ""; //warns user if cost too much

private Boolean selling = false; //default on buying screen; boolean switches between the two
static Boolean stockDisplayed = false; //buy button pops up once a stock is searched
static Boolean buyOptions = false; // can choose number
Boolean clicked = true; //"Buy" box dissappears once clicked
Boolean opened = false; //see if the opening screen is finished
Boolean newIsChosen = false;
Boolean custom = false; //for 
Boolean rapid = false; //for rapid mode

StringDict inventory = new StringDict(); //holds all stocks, number of shares must be converted because only strings are allowed
StringDict vals = new StringDict(); //holds all values for rapid mode stocks

int[] buttons = new int[10];
//int[] wait = new int[10];
double[] prices = new double[10]; //collection of API calls or random prices
String[] prices2;

Menu currentMenu;
Menu open, buy, sell;

DecimalFormat df = new DecimalFormat("#.00");

interface Menu { //allows access to methods
  void render();
}

void setup() {
 /* for(int i = 0; i < wait.length; i++) {
    wait[i] = 0;
  }*/
  open = new OpenMenu();
  buy = new BuyMenu();
  sell = new SellMenu();
  currentMenu = buy;
  size(600, 800);
}

void draw() {
  background(255); 
  if(!opened) {
    setMenu(3);
  } else if (!selling) {
    setMenu(1); //draws out buying menu
  } else{
    setMenu(2); //draws selling menu
  }
  currentMenu.render();
}