//+------------------------------------------------------------------+
//|                                              mql4compat.mqh v2.2 |
//|                           https://github.com/eromawyn/mql4compat |
//|                                     Copyright (c) 2021, Eromawyn |
//| Original author :                                                |
//|             Copyright (c) 2013, Arunas Pranckevicius(T-1000), UK |
//+------------------------------------------------------------------+

// Updated MQL4 compatibility library. Originaly from http://www.mql5.com/en/articles/81
// The initmql4.mqh  there is incomplete
//---- Incompatible function groups have extention *MQL4. You need to modify your code for compatibility and add MQL4 to fuctions what give errors.
// For example, Object functions have new paramneter: the window handler as first parameter in MQL5.


//--- declaration of constants
#define OP_BUY 0           //Buy 
#define OP_SELL 1          //Sell
#define OP_BUYLIMIT 2      //BUY LIMIT pending order 
#define OP_SELLLIMIT 3     //SELL LIMIT pending order  
#define OP_BUYSTOP 4       //BUY STOP pending order  
#define OP_SELLSTOP 5      //SELL STOP pending order  
//---
#define OBJPROP_TIME1 300
#define OBJPROP_PRICE1 301
#define OBJPROP_TIME2 302
#define OBJPROP_PRICE2 303
#define OBJPROP_TIME3 304
#define OBJPROP_PRICE3 305
//---
#define OBJPROP_RAY 310
#define OBJPROP_FIBOLEVELS 200
//---
 
#define OBJPROP_FIRSTLEVEL1 211 
#define OBJPROP_FIRSTLEVEL2 212
#define OBJPROP_FIRSTLEVEL3 213
#define OBJPROP_FIRSTLEVEL4 214
#define OBJPROP_FIRSTLEVEL5 215
#define OBJPROP_FIRSTLEVEL6 216
#define OBJPROP_FIRSTLEVEL7 217
#define OBJPROP_FIRSTLEVEL8 218
#define OBJPROP_FIRSTLEVEL9 219
#define OBJPROP_FIRSTLEVEL10 220
#define OBJPROP_FIRSTLEVEL11 221
#define OBJPROP_FIRSTLEVEL12 222
#define OBJPROP_FIRSTLEVEL13 223
#define OBJPROP_FIRSTLEVEL14 224
#define OBJPROP_FIRSTLEVEL15 225
#define OBJPROP_FIRSTLEVEL16 226
#define OBJPROP_FIRSTLEVEL17 227
#define OBJPROP_FIRSTLEVEL18 228
#define OBJPROP_FIRSTLEVEL19 229
#define OBJPROP_FIRSTLEVEL20 230
#define OBJPROP_FIRSTLEVEL21 231
#define OBJPROP_FIRSTLEVEL22 232
#define OBJPROP_FIRSTLEVEL23 233
#define OBJPROP_FIRSTLEVEL24 234
#define OBJPROP_FIRSTLEVEL25 235
#define OBJPROP_FIRSTLEVEL26 236
#define OBJPROP_FIRSTLEVEL27 237
#define OBJPROP_FIRSTLEVEL28 238
#define OBJPROP_FIRSTLEVEL29 239
#define OBJPROP_FIRSTLEVEL30 240
#define OBJPROP_FIRSTLEVEL31 241
//---
#define MODE_OPEN 0
#define MODE_CLOSE 3
#define MODE_VOLUME 4 
#define MODE_REAL_VOLUME 5
#define MODE_TRADES 0
#define MODE_HISTORY 1
#define SELECT_BY_POS 0
#define SELECT_BY_TICKET 1
//---
#define DOUBLE_VALUE 0
#define FLOAT_VALUE 1
#define LONG_VALUE INT_VALUE
//---
#define CHART_BAR 0
#define CHART_CANDLE 1
//---
#define MODE_ASCEND 0
#define MODE_DESCEND 1
//---
#define MODE_LOW 1
#define MODE_HIGH 2
#define MODE_TIME 5
#define MODE_BID 9
#define MODE_ASK 10
#define MODE_POINT 11
#define MODE_DIGITS 12
#define MODE_SPREAD 13
#define MODE_STOPLEVEL 14
#define MODE_LOTSIZE 15
#define MODE_TICKVALUE 16
#define MODE_TICKSIZE 17
#define MODE_SWAPLONG 18
#define MODE_SWAPSHORT 19
#define MODE_STARTING 20
#define MODE_EXPIRATION 21
#define MODE_TRADEALLOWED 22
#define MODE_MINLOT 23
#define MODE_LOTSTEP 24
#define MODE_MAXLOT 25
#define MODE_SWAPTYPE 26
#define MODE_PROFITCALCMODE 27
#define MODE_MARGINCALCMODE 28
#define MODE_MARGININIT 29
#define MODE_MARGINMAINTENANCE 30
#define MODE_MARGINHEDGED 31
#define MODE_MARGINREQUIRED 32
#define MODE_FREEZELEVEL 33
//---
#define EMPTY -1

// Convert timeframe from MQL4 to MQ:5
ENUM_TIMEFRAMES TFMigrate(int tf)
  {
   switch(tf)
     {
      case 0: return(PERIOD_CURRENT);
      case 1: return(PERIOD_M1);
      case 5: return(PERIOD_M5);
      case 15: return(PERIOD_M15);
      case 30: return(PERIOD_M30);
      case 60: return(PERIOD_H1);
      case 240: return(PERIOD_H4);
      case 1440: return(PERIOD_D1);
      case 10080: return(PERIOD_W1);
      case 43200: return(PERIOD_MN1);
      
      case 2: return(PERIOD_M2);
      case 3: return(PERIOD_M3);
      case 4: return(PERIOD_M4);      
      case 6: return(PERIOD_M6);
      case 10: return(PERIOD_M10);
      case 12: return(PERIOD_M12);
      case 16385: return(PERIOD_H1);
      case 16386: return(PERIOD_H2);
      case 16387: return(PERIOD_H3);
      case 16388: return(PERIOD_H4);
      case 16390: return(PERIOD_H6);
      case 16392: return(PERIOD_H8);
      case 16396: return(PERIOD_H12);
      case 16408: return(PERIOD_D1);
      case 32769: return(PERIOD_W1);
      case 49153: return(PERIOD_MN1);      
      default: return(PERIOD_CURRENT);
     }
  }

/* Ask and Bid variables */

// Predefined Variables
#define Bid (::SymbolInfoDouble(_Symbol, ::SYMBOL_BID))
#define Ask (::SymbolInfoDouble(_Symbol, ::SYMBOL_ASK))

/* Bars variable */
double Bars = Bars(_Symbol,_Period);

int Digits=_Digits;
bool True = true;
bool False = false;

/* Open[], High[], Low[], Close[] and Time[] variables */
#define DefineBroker(NAME,TYPE) \
class NAME##Broker \
{ \
  public: \
    TYPE operator[](int b) \
    { \
      return i##NAME(_Symbol, _Period, b); \
    } \
}; \
NAME##Broker NAME;

DefineBroker(Time, datetime);
DefineBroker(Open, double);
DefineBroker(High, double);
DefineBroker(Low, double);
DefineBroker(Close, double);
DefineBroker(Volume, long);

/* Deprecated InitMQL4Env() variable */
void InitMQL4Env()
{
   // Bars conflicts with Bars function, so it’s impossible to replace it with a 
 	Bars = Bars(_Symbol,_Period);
}


// Account Information
double AccountBalance()
{
   return AccountInfoDouble(ACCOUNT_BALANCE);
}

double AccountCredit()
{
   return AccountInfoDouble(ACCOUNT_CREDIT);
}

string AccountCompany()
{
   return AccountInfoString(ACCOUNT_COMPANY);
}

string AccountCurrency()
{
   return AccountInfoString(ACCOUNT_CURRENCY);
}

double AccountEquity()
{
   return AccountInfoDouble(ACCOUNT_EQUITY);
}

double AccountFreeMargin()
{
   return AccountInfoDouble(ACCOUNT_FREEMARGIN);
}
double AccountFreeMarginCheck(const string Symb,const int Cmd,const double dVolume)
{
   double Margin;

   return(::OrderCalcMargin((ENUM_ORDER_TYPE)Cmd, Symb, dVolume,
          ::SymbolInfoDouble(Symb,(Cmd==::ORDER_TYPE_BUY) ? ::SYMBOL_ASK : ::SYMBOL_BID),Margin) ?
          ::AccountInfoDouble(::ACCOUNT_MARGIN_FREE) - Margin : -1);
}

double AccountFreeMarginMode()
{
// Unimplemented stub
Print("Error: AccountFreeMarginMode() - Not implemented stub.");
return -1;
}

long AccountLeverage()
{
return AccountInfoInteger(ACCOUNT_LEVERAGE);
}

double AccountMargin()
{
return AccountInfoDouble(ACCOUNT_MARGIN);
}

string AccountName()
{
return AccountInfoString(ACCOUNT_NAME);
}

long AccountNumber()
{
return AccountInfoInteger(ACCOUNT_LOGIN);
}

double AccountProfit()
{
return AccountInfoDouble(ACCOUNT_PROFIT);
}

string AccountServer()
{
return AccountInfoString(ACCOUNT_SERVER);
}

double AccountStopoutLevel()
{
return AccountInfoDouble(ACCOUNT_MARGIN_SO_SO);
}

long AccountStopoutMode()
{
return AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE);
}


// Array Functions
int ArrayCopyRates(double &dest_array[], string _symbol=NULL, int _timeframe=0)
{
// Unimplemented stub
Print("Error: ArrayCopyRates() - Not implemented stub.");
return -1;
}

int ArrayCopySeries(double &array[], int series_index, string symbol=NULL, int _tf=0)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(_tf);
   int count=Bars(symbol,timeframe);
   switch(series_index)
     {
      case MODE_OPEN:
         return(CopyOpen(symbol,timeframe,0,count,array));
      case MODE_LOW:
         return(CopyLow(symbol,timeframe,0,count,array));
      case MODE_HIGH:
         return(CopyHigh(symbol,timeframe,0,count,array));
      case MODE_CLOSE:
         return(CopyClose(symbol,timeframe,0,count,array));

      default: return(0);
     }
   return(0);
}


int ArrayDimension(double &array[])
{
// Unimplemented stub
Print("Error: ArrayDimension() - Not implemented stub.");
return -1;
}


int ArrayInitializeMQL4(double &array[],
                        double value)
{
   ArrayInitialize(array,value);
   return(ArraySize(array));
}
  
int ArrayMaximumMQL4(double &array[], int count=WHOLE_ARRAY, int start=0)
{
   return(ArrayMaximum(array,start,count));
}

int ArrayMinimumMQL4(double &array[], int count=WHOLE_ARRAY, int start=0)
{
   return(ArrayMinimum(array,start,count));
}

int ArraySortMQL4(double &array[], int count=WHOLE_ARRAY, int start=0, int sort_dir=MODE_ASCEND)
{
   switch(sort_dir)
     {
      case MODE_ASCEND:
         ArraySetAsSeries(array,true);
      case MODE_DESCEND:
         ArraySetAsSeries(array,false);

      default: ArraySetAsSeries(array,true);
     }
   ArraySort(array);
   return(0);
}

// Checkup
bool IsConnected()
{
   return (bool) TerminalInfoInteger(TERMINAL_CONNECTED);
}

bool IsDemo()
{
   if(AccountInfoInteger(ACCOUNT_TRADE_MODE)==ACCOUNT_TRADE_MODE_DEMO)
      return(true);
   else
      return(false);
}

bool IsDllsAllowed()
{
   return (bool) TerminalInfoInteger(TERMINAL_DLLS_ALLOWED);
}

bool IsExpertEnabled()
{
   return (bool) AccountInfoInteger(ACCOUNT_TRADE_EXPERT);
}

bool IsLibrariesAllowed()
{
   return (bool) MQL5InfoInteger(MQL5_DLLS_ALLOWED);
}

bool IsOptimization()
{
   return (bool) MQL5InfoInteger(MQL5_DLLS_ALLOWED);
}

bool IsTesting()
{
   return (bool) MQL5InfoInteger(MQL5_TESTING);
}

bool IsTradeAllowed()
{
   return (bool) MQL5InfoInteger(MQL5_TRADE_ALLOWED);
}

bool IsTradeContextBusy()
{
// Unimplemented stub
Print("Error: IsTradeContextBusy() - Not implemented stub.");
return false;
}

bool IsVisualMode()
{
   return (bool) MQL5InfoInteger(MQL5_VISUAL_MODE);
}

//Client Terminal
string TerminalCompany()
{
   return TerminalInfoString(TERMINAL_COMPANY);
}

string TerminalName()
{
   return TerminalInfoString(TERMINAL_NAME);
}

string TerminalPath()
{
   return TerminalInfoString(TERMINAL_PATH);
}

//Common Functions
double MarketInfo(string symbol, int type)
// With hacks to match integer type into double.
  {
   switch(type)
     {
      case MODE_LOW:
         return(SymbolInfoDouble(symbol,SYMBOL_LASTLOW));
      case MODE_HIGH:
         return(SymbolInfoDouble(symbol,SYMBOL_LASTHIGH));
      case MODE_TIME:
         return((double)  SymbolInfoInteger(symbol,SYMBOL_TIME));
      case MODE_BID:
         return (SymbolInfoDouble(symbol, SYMBOL_BID));
      case MODE_ASK:
         return(SymbolInfoDouble(symbol, SYMBOL_ASK));
      case MODE_POINT:
         return(SymbolInfoDouble(symbol,SYMBOL_POINT));
      case MODE_DIGITS:
         return((double) SymbolInfoInteger(symbol,SYMBOL_DIGITS));
      case MODE_SPREAD:
         return((double) SymbolInfoInteger(symbol,SYMBOL_SPREAD));
      case MODE_STOPLEVEL:
         return((double) SymbolInfoInteger(symbol,SYMBOL_TRADE_STOPS_LEVEL));
      case MODE_LOTSIZE:
         return(SymbolInfoDouble(symbol,SYMBOL_TRADE_CONTRACT_SIZE));
      case MODE_TICKVALUE:
         return(SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_VALUE));
      case MODE_TICKSIZE:
         return(SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_SIZE));
      case MODE_SWAPLONG:
         return(SymbolInfoDouble(symbol,SYMBOL_SWAP_LONG));
      case MODE_SWAPSHORT:
         return(SymbolInfoDouble(symbol,SYMBOL_SWAP_SHORT));
      case MODE_STARTING:
         return(0);
      case MODE_EXPIRATION:
         return(0);
      case MODE_TRADEALLOWED:
         return(0);
      case MODE_MINLOT:
         return(SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN));
      case MODE_LOTSTEP:
         return(SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP));
      case MODE_MAXLOT:
         return(SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX));
      case MODE_SWAPTYPE:
         return((double) SymbolInfoInteger(symbol,SYMBOL_SWAP_MODE));
      case MODE_PROFITCALCMODE:
         return((double) SymbolInfoInteger(symbol,SYMBOL_TRADE_CALC_MODE));
      case MODE_MARGINCALCMODE:
         return(0);
      case MODE_MARGININIT:
         return(0);
      case MODE_MARGINMAINTENANCE:
         return(0);
      case MODE_MARGINHEDGED:
         return(0);
      case MODE_MARGINREQUIRED:
         return(0);
      case MODE_FREEZELEVEL:
         return((double) SymbolInfoInteger(symbol,SYMBOL_TRADE_FREEZE_LEVEL));

      default: return(0);
     }
   return(0);
}

// Conversion Functions
#define CharToStr CharToString
#define DoubleToStr DoubleToString
#define StrToDouble StringToDouble
#define StrToInteger (int)StringToInteger
#define StrToTime StringToTime
#define TimeToStr TimeToString 
#define StringGetChar StringGetCharacter
#define StringSetChar StringSetCharacter

// From http://docs.mql4.com/strings/StringConcatenate
string StringConcatenateMQL4(string _str1,string _str2,string _str3="",string _str4="",string _str5="",string _str6="",string _str7="",string _str8="",
        string _str9="",string _str10="",string _str11="",string _str12="",string _str13="",string _str14="",string _str15="",string _str16="",
        string _str17="",string _str18="",string _str19="",string _str20="",string _str21="",string _str22="",string _str23="",string _str24="",
        string _str25="",string _str26="",string _str27="",string _str28="",string _str29="",string _str30="",string _str31="",string _str32="",
        string _str33="",string _str34="",string _str35="",string _str36="",string _str37="",string _str38="",string _str39="",string _str40="",
        string _str41="",string _str42="",string _str43="",string _str44="",string _str45="",string _str46="",string _str47="",string _str48="",
        string _str49="",string _str50="",string _str51="",string _str52="",string _str53="",string _str54="",string _str55="",string _str56="",
        string _str57="",string _str58="",string _str59="",string _str60="",string _str61="",string _str62="",string _str63="")
{
string __s;

StringConcatenate(_str62,_str63,"");
StringConcatenate(__s,_str1,_str2,_str3,_str4,_str5,_str6,_str7,_str8,_str9,_str10,_str11,_str12,_str13,_str14,_str15,_str16,
                            _str17,_str18,_str19,_str20,_str21,_str22,_str23,_str24,_str25,_str26,_str27,_str28,_str29,_str30,_str31,
                            _str32,_str33,_str34,_str35,_str36,_str37,_str38,_str39,_str40,_str41,_str42,_str43,_str44,_str45,_str46,
                            _str47,_str48,_str49,_str50,_str51,_str52,_str53,_str54,_str55,_str56,_str57,_str58,_str59,_str60,_str61,
                            _str62);

return __s;
}
//Custom Indicators
void IndicatorBuffers(int count)
{
Print("Error: IndicatorBuffers() - Not implemented stub.");
// Unimplemented stub}
}

int IndicatorCountedMQL4(int _prev_calculated=0)
{
   if(_prev_calculated>0) return(_prev_calculated-1);
   if(_prev_calculated==0) return(0);
   return(0);
}
#define IndicatorCounted IndicatorCountedMQL4(prev_calculated)

void IndicatorDigits(int digits)
{
 IndicatorSetInteger(INDICATOR_DIGITS,digits);
}

void IndicatorShortName(string name)
{
 IndicatorSetString(INDICATOR_SHORTNAME,name);
}

void SetIndexArrow(int index, int code)
{
 PlotIndexSetInteger(index,PLOT_ARROW,code);
}

bool SetIndexBufferMQL4(int index, double &array[])
{
 return SetIndexBuffer(index,array,INDICATOR_DATA);
}

void SetIndexDrawBegin(int index, int begin)
{
 PlotIndexSetInteger(index,PLOT_DRAW_BEGIN,begin);
}

void SetIndexEmptyValue(int index, double value)
{
 PlotIndexSetDouble(index,PLOT_EMPTY_VALUE,value);
}

void SetIndexLabel(int index,  string text)
{
 PlotIndexSetString(index,PLOT_LABEL,text);
}

void SetIndexShift(int index, int shift)
{
 PlotIndexSetInteger(index,PLOT_SHIFT,shift);
}

void SetIndexStyle(int index,  int type, int style=EMPTY, int width=EMPTY, color clr=CLR_NONE)
{
   if(width>-1)
      PlotIndexSetInteger(index,PLOT_LINE_WIDTH,width);
   if(clr!=CLR_NONE)
      PlotIndexSetInteger(index,PLOT_LINE_COLOR,clr);
   switch(type)
     {
      case 0:
         PlotIndexSetInteger(index,PLOT_DRAW_TYPE,DRAW_LINE);
      case 1:
         PlotIndexSetInteger(index,PLOT_DRAW_TYPE,DRAW_SECTION);
      case 2:
         PlotIndexSetInteger(index,PLOT_DRAW_TYPE,DRAW_HISTOGRAM);
      case 3:
         PlotIndexSetInteger(index,PLOT_DRAW_TYPE,DRAW_ARROW);
      case 4:
         PlotIndexSetInteger(index,PLOT_DRAW_TYPE,DRAW_ZIGZAG);
      case 12:
         PlotIndexSetInteger(index,PLOT_DRAW_TYPE,DRAW_NONE);

      default:
         PlotIndexSetInteger(index,PLOT_DRAW_TYPE,DRAW_LINE);
     }
   switch(style)
     {
      case 0:
         PlotIndexSetInteger(index,PLOT_LINE_STYLE,STYLE_SOLID);
      case 1:
         PlotIndexSetInteger(index,PLOT_LINE_STYLE,STYLE_DASH);
      case 2:
         PlotIndexSetInteger(index,PLOT_LINE_STYLE,STYLE_DOT);
      case 3:
         PlotIndexSetInteger(index,PLOT_LINE_STYLE,STYLE_DASHDOT);
      case 4:
         PlotIndexSetInteger(index,PLOT_LINE_STYLE,STYLE_DASHDOTDOT);

      default: return;
     }
}

void SetLevelStyle(int draw_style, int line_width, color clr=CLR_NONE)
{
   IndicatorSetInteger(INDICATOR_LEVELWIDTH,line_width);
   if(clr!=CLR_NONE)
      IndicatorSetInteger(INDICATOR_LEVELCOLOR,clr);
   switch(draw_style)
     {
      case 0:
         IndicatorSetInteger(INDICATOR_LEVELSTYLE,STYLE_SOLID);
      case 1:
         IndicatorSetInteger(INDICATOR_LEVELSTYLE,STYLE_DASH);
      case 2:
         IndicatorSetInteger(INDICATOR_LEVELSTYLE,STYLE_DOT);
      case 3:
         IndicatorSetInteger(INDICATOR_LEVELSTYLE,STYLE_DASHDOT);
      case 4:
         IndicatorSetInteger(INDICATOR_LEVELSTYLE,STYLE_DASHDOTDOT);

      default: return;
     }
}

void SetLevelValue(int __level, double __value)
{
 IndicatorSetDouble(INDICATOR_LEVELVALUE,__level,__value);
}

//Date and Time Functions
int Day()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.day);
}

int DayOfWeek()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.day_of_week);
}

int DayOfYear()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.day_of_year);
}

int Hour()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.hour);
}

int Minute()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.min);
}

int Month()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.mon);
}

int Seconds()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.sec);
}

int TimeDay(datetime date)
{
   MqlDateTime tm;
   TimeToStruct(date,tm);
   return(tm.day);
}

int TimeDayOfWeek(datetime date)
{
   MqlDateTime tm;
   TimeToStruct(date,tm);
   return(tm.day_of_week);
}

int TimeDayOfYear(datetime date)
{
   MqlDateTime tm;
   TimeToStruct(date,tm);
   return(tm.day_of_year);
}

int TimeHour(datetime time)
{
   MqlDateTime tm;
   TimeToStruct(time,tm);
   return(tm.hour);
}

int TimeMinute(datetime time)
{
   MqlDateTime tm;
   TimeToStruct(time,tm);
   return(tm.min);
}

int TimeMonth(datetime time)
{
   MqlDateTime tm;
   TimeToStruct(time,tm);
   return(tm.mon);
}

int TimeSeconds(datetime time)
{
   MqlDateTime tm;
   TimeToStruct(time,tm);
   return(tm.sec);
}

int TimeYear(datetime time)
{
   MqlDateTime tm;
   TimeToStruct(time,tm);
   return(tm.year);
}

int Year()
{
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.year);
}
// Obsolete MQL4 function
#define CurTime() TimeCurrent()
#define HistoryTotal() OrdersHistoryTotal()
#define LocalTime() TimeLocal()

//File Functions
int FileOpenHistory(string filename, int mode, int delimiter=';')
{
// Unimplemented stub
Print("Error: FileOpenHistory() - Not implemented stub.");
return -1;
}

double FileReadDoubleMQL4(int handle, int size=DOUBLE_VALUE)
{
   return(FileReadDouble(handle));
}

bool FileSeekMQL4(long handle,
                  int offset,
                  ENUM_FILE_POSITION origin)
{
   FileSeek((int) (handle),offset,origin);
   return(true);
}

//Object Functions
bool ObjectCreateMQL4(string name, ENUM_OBJECT type, int window, datetime time1, double price1, datetime time2=0, double price2=0, datetime time3=0, double price3=0)
{
   return(ObjectCreate(0,name,type,window,
          time1,price1,time2,price2,time3,price3));
}

bool ObjectDeleteMQL4(string name)
{
   return(ObjectDelete(0,name));
}

string ObjectDescriptionMQL4(string name)
{
   return(ObjectGetString(0,name,OBJPROP_TEXT));
}
int ObjectFindMQL4(string name)
{
   return(ObjectFind(0,name));
}

double ObjectGet(string name, int prop_id)
{
// Added hacks to match int2double conversion
   switch(prop_id)
     {
      case OBJPROP_TIME1:
         return((double) ObjectGetInteger(0,name,OBJPROP_TIME));
      case OBJPROP_PRICE1:
         return(ObjectGetDouble(0,name,OBJPROP_PRICE));
      case OBJPROP_TIME2:
         return((double) ObjectGetInteger(0,name,OBJPROP_TIME,1));
      case OBJPROP_PRICE2:
         return(ObjectGetDouble(0,name,OBJPROP_PRICE,1));
      case OBJPROP_TIME3:
         return((double) ObjectGetInteger(0,name,OBJPROP_TIME,2));
      case OBJPROP_PRICE3:
         return(ObjectGetDouble(0,name,OBJPROP_PRICE,2));
      case OBJPROP_COLOR:
         return((double) ObjectGetInteger(0,name,OBJPROP_COLOR));
      case OBJPROP_STYLE:
         return((double) ObjectGetInteger(0,name,OBJPROP_STYLE));
      case OBJPROP_WIDTH:
         return((double) ObjectGetInteger(0,name,OBJPROP_WIDTH));
      case OBJPROP_BACK:
         return((double) ObjectGetInteger(0,name,OBJPROP_WIDTH));
      case OBJPROP_RAY:
         return((double) ObjectGetInteger(0,name,OBJPROP_RAY_RIGHT));
      case OBJPROP_ELLIPSE:
         return((double) ObjectGetInteger(0,name,OBJPROP_ELLIPSE));
      case OBJPROP_SCALE:
         return(ObjectGetDouble(0,name,OBJPROP_SCALE));
      case OBJPROP_ANGLE:
         return(ObjectGetDouble(0,name,OBJPROP_ANGLE));
      case OBJPROP_ARROWCODE:
         return((double) ObjectGetInteger(0,name,OBJPROP_ARROWCODE));
      case OBJPROP_TIMEFRAMES:
         return((double) ObjectGetInteger(0,name,OBJPROP_TIMEFRAMES));
      case OBJPROP_DEVIATION:
         return(ObjectGetDouble(0,name,OBJPROP_DEVIATION));
      case OBJPROP_FONTSIZE:
         return((double) ObjectGetInteger(0,name,OBJPROP_FONTSIZE));
      case OBJPROP_CORNER:
         return((double) ObjectGetInteger(0,name,OBJPROP_CORNER));
      case OBJPROP_XDISTANCE:
         return((double) ObjectGetInteger(0,name,OBJPROP_XDISTANCE));
      case OBJPROP_YDISTANCE:
         return((double) ObjectGetInteger(0,name,OBJPROP_YDISTANCE));
      case OBJPROP_FIBOLEVELS:
         return((double) ObjectGetInteger(0,name,OBJPROP_LEVELS));
      case OBJPROP_LEVELCOLOR:
         return((double) ObjectGetInteger(0,name,OBJPROP_LEVELCOLOR));
      case OBJPROP_LEVELSTYLE:
         return((double) ObjectGetInteger(0,name,OBJPROP_LEVELSTYLE));
      case OBJPROP_LEVELWIDTH:
         return((double) ObjectGetInteger(0,name,OBJPROP_LEVELWIDTH));
      default: return 0;
     }
}

string ObjectGetFiboDescription(string name, int index)
{
   return(ObjectGetString(0,name,OBJPROP_LEVELTEXT,index));
}

int ObjectGetShiftByValue(string name, double value)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(PERIOD_CURRENT);
   datetime Arr[];
   MqlRates mql4[];
   if(ObjectGetTimeByValue(0,name,value)<0) return(-1);
   CopyRates(NULL,timeframe,0,1,mql4);
   if(CopyTime(NULL,timeframe,mql4[0].time,
      ObjectGetTimeByValue(0,name,value),Arr)>0)
      return(ArraySize(Arr)-1);
   else return(-1);
}
double ObjectGetValueByShift(string name, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(PERIOD_CURRENT);
   MqlRates mql4[];
   CopyRates(NULL,timeframe,shift,1,mql4);
   return(ObjectGetValueByTime(0,name,mql4[0].time,0));
}

bool ObjectMoveMQL4(string name, int point, datetime time1, double price1)
{
   return(ObjectMove(0,name,point,time1,price1));
}

string ObjectNameMQL4(int index)
{
   return(ObjectName(0,index));
}

int ObjectsDeleteAllMQL4(int window=-1, int type=EMPTY)
{
   return(ObjectsDeleteAll(0,window,type));
}

bool ObjectSet(string name, int prop_id, double value)
{
   switch(prop_id)
     {
      case OBJPROP_TIME1:
         ObjectSetInteger(0,name,OBJPROP_TIME,(int)value);return(true);
      case OBJPROP_PRICE1:
         ObjectSetDouble(0,name,OBJPROP_PRICE,value);return(true);
      case OBJPROP_TIME2:
         ObjectSetInteger(0,name,OBJPROP_TIME,1,(int)value);return(true);
      case OBJPROP_PRICE2:
         ObjectSetDouble(0,name,OBJPROP_PRICE,1,value);return(true);
      case OBJPROP_TIME3:
         ObjectSetInteger(0,name,OBJPROP_TIME,2,(int)value);return(true);
      case OBJPROP_PRICE3:
         ObjectSetDouble(0,name,OBJPROP_PRICE,2,value);return(true);
      case OBJPROP_COLOR:
         ObjectSetInteger(0,name,OBJPROP_COLOR,(int)value);return(true);
      case OBJPROP_STYLE:
         ObjectSetInteger(0,name,OBJPROP_STYLE,(int)value);return(true);
      case OBJPROP_WIDTH:
         ObjectSetInteger(0,name,OBJPROP_WIDTH,(int)value);return(true);
      case OBJPROP_BACK:
         ObjectSetInteger(0,name,OBJPROP_BACK,(int)value);return(true);
      case OBJPROP_RAY:
         ObjectSetInteger(0,name,OBJPROP_RAY_RIGHT,(int)value);return(true);
      case OBJPROP_ELLIPSE:
         ObjectSetInteger(0,name,OBJPROP_ELLIPSE,(int)value);return(true);
      case OBJPROP_SCALE:
         ObjectSetDouble(0,name,OBJPROP_SCALE,value);return(true);
      case OBJPROP_ANGLE:
         ObjectSetDouble(0,name,OBJPROP_ANGLE,value);return(true);
      case OBJPROP_ARROWCODE:
         ObjectSetInteger(0,name,OBJPROP_ARROWCODE,(int)value);return(true);
      case OBJPROP_TIMEFRAMES:
         ObjectSetInteger(0,name,OBJPROP_TIMEFRAMES,(int)value);return(true);
      case OBJPROP_DEVIATION:
         ObjectSetDouble(0,name,OBJPROP_DEVIATION,value);return(true);
      case OBJPROP_FONTSIZE:
         ObjectSetInteger(0,name,OBJPROP_FONTSIZE,(int)value);return(true);
      case OBJPROP_CORNER:
         ObjectSetInteger(0,name,OBJPROP_CORNER,(int)value);return(true);
      case OBJPROP_XDISTANCE:
         ObjectSetInteger(0,name,OBJPROP_XDISTANCE,(int)value);return(true);
      case OBJPROP_YDISTANCE:
         ObjectSetInteger(0,name,OBJPROP_YDISTANCE,(int)value);return(true);
      case OBJPROP_FIBOLEVELS:
         ObjectSetInteger(0,name,OBJPROP_LEVELS,(int)value);return(true);
      case OBJPROP_LEVELCOLOR:
         ObjectSetInteger(0,name,OBJPROP_LEVELCOLOR,(int)value);return(true);
      case OBJPROP_LEVELSTYLE:
         ObjectSetInteger(0,name,OBJPROP_LEVELSTYLE,(int)value);return(true);
      case OBJPROP_LEVELWIDTH:
         ObjectSetInteger(0,name,OBJPROP_LEVELWIDTH,(int)value);return(true);

      default: return(false);
     }
   return(false);
}

bool ObjectSetFiboDescription(string name,  int index, string text)
{
   return(ObjectSetString(0,name,OBJPROP_LEVELTEXT,index,text));
}

bool ObjectSetText(string name, string text, int font_size, string font_name=NULL, color text_color=CLR_NONE)
{
   int tmpObjType=(int)ObjectGetInteger(0,name,OBJPROP_TYPE);
   if(tmpObjType!=OBJ_LABEL && tmpObjType!=OBJ_TEXT) return(false);
   if(StringLen(text)>0 && font_size>0)
     {
      if(ObjectSetString(0,name,OBJPROP_TEXT,text)==true
         && ObjectSetInteger(0,name,OBJPROP_FONTSIZE,font_size)==true)
        {
         if((StringLen(font_name)>0)
            && ObjectSetString(0,name,OBJPROP_FONT,font_name)==false)
            return(false);
         if(text_color!=CLR_NONE
            && ObjectSetInteger(0,name,OBJPROP_COLOR,text_color)==false)
            return(false);
         return(true);
        }
      return(false);
     }
   return(false);
}

int ObjectsTotalMQL4(int type=EMPTY, int window=-1)
{
   return(ObjectsTotal(0,window,type));
}

int ObjectType(string name)
{
   return((int)ObjectGetInteger(0,name,OBJPROP_TYPE));
}

//String Functions
int StringGetCharMQL4(string text, int pos)
{
 return((int) StringGetCharacter(text,pos));
}

string StringSetChar(string text,int pos,int value)
{
   string _txt = text;
   StringSetCharacter(_txt, pos, (ushort) value);
   return (_txt);
}

string StringSetCharMQL4(string text, int pos, int value)
{
   string _txt = text;
   StringSetCharacter(_txt, pos, (ushort) value);
   return (_txt);
}

//Technical Indicators
double CopyBufferMQL4(int handle,int index,int shift)
{
   double buf[];
   switch(index)
     {
      case 0: if(CopyBuffer(handle,0,shift,1,buf)>0)
         return(buf[0]); break;
      case 1: if(CopyBuffer(handle,1,shift,1,buf)>0)
         return(buf[0]); break;
      case 2: if(CopyBuffer(handle,2,shift,1,buf)>0)
         return(buf[0]); break;
      case 3: if(CopyBuffer(handle,3,shift,1,buf)>0)
         return(buf[0]); break;
      case 4: if(CopyBuffer(handle,4,shift,1,buf)>0)
         return(buf[0]); break;
      default: break;
     }
   return(EMPTY_VALUE);
}

ENUM_MA_METHOD MethodMigrate(int method)
  {
   switch(method)
     {
      case 0: return(MODE_SMA);
      case 1: return(MODE_EMA);
      case 2: return(MODE_SMMA);
      case 3: return(MODE_LWMA);
      default: return(MODE_SMA);
     }
  }
ENUM_APPLIED_PRICE PriceMigrate(int price)
  {
   switch(price)
     {
      case 1: return(PRICE_CLOSE);
      case 2: return(PRICE_OPEN);
      case 3: return(PRICE_HIGH);
      case 4: return(PRICE_LOW);
      case 5: return(PRICE_MEDIAN);
      case 6: return(PRICE_TYPICAL);
      case 7: return(PRICE_WEIGHTED);
      default: return(PRICE_CLOSE);
     }
  }
ENUM_STO_PRICE StoFieldMigrate(int field)
  {
   switch(field)
     {
      case 0: return(STO_LOWHIGH);
      case 1: return(STO_CLOSECLOSE);
      default: return(STO_LOWHIGH);
     }
  }
//+------------------------------------------------------------------+
enum ALLIGATOR_MODE  { MODE_GATORJAW=1,   MODE_GATORTEETH, MODE_GATORLIPS };
enum UP_LOW_MODE     { MODE_BASE,         MODE_UPPER,      MODE_LOWER };
enum ICHIMOKU_MODE   { MODE_TENKANSEN=1,  MODE_KIJUNSEN, MODE_SENKOUSPANA, MODE_SENKOUSPANB, MODE_CHINKOUSPAN };
// Hacked due duplicate definition error
//enum ADX_MODE        { MODE_MAIN,         MODE_PLUSDI, MODE_MINUSDI };
//enum MAIN_SIGNAL_MODE { MODE_MAIN,         MODE_SIGNAL };
enum BASE_IND_MODE { _MODE_MAIN, MODE_PLUSDI, MODE_MINUSDI,  MODE_SIGNAL };
#define ADX_MODE BASE_IND_MODE
#define MAIN_SIGNAL_MODE BASE_IND_MODE


double iACMQL4(string symbol, int tf, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iAC(symbol,timeframe);
   if(handle<0)
     {
      Print("The iAC object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}
  
double iADMQL4(string symbol, int tf, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=(int)iAD(symbol,timeframe,VOLUME_TICK);
   if(handle<0)
     {
      Print("The iAD object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iAlligatorMQL4(string symbol, int tf, int jaw_period, int jaw_shift, int teeth_period, int teeth_shift, int lips_period, int lips_shift, int method, int price, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iAlligator(symbol,timeframe,jaw_period,jaw_shift,
                         teeth_period,teeth_shift,
                         lips_period,lips_shift,
                         ma_method,applied_price);
   if(handle<0)
     {
      Print("The iAlligator object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode-1,shift));
}

double iADXMQL4(string symbol, int tf, int period, int price, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iADX(symbol,timeframe,period);
   if(handle<0)
     {
      Print("The iADX object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode,shift));
}

double iATRMQL4(string symbol, int tf, int period, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iATR(symbol,timeframe,period);
   if(handle<0)
     {
      Print("The iATR object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iAOMQL4(string symbol, int tf, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iAO(symbol,timeframe);
   if(handle<0)
     {
      Print("The iAO object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iBearsPowerMQL4(string symbol, int tf, int period, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iBearsPower(symbol,timeframe,period);
   if(handle<0)
     {
      Print("The iBearsPower object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iBandsMQL4(string symbol, int tf, int period, double deviation, int bands_shift, int method, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   int handle=iBands(symbol,timeframe,period,
                     bands_shift,deviation,ma_method);
   if(handle<0)
     {
      Print("The iBands object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode,shift));
}

double iBandsOnArray(double &array[], int total, int period, int deviation, int bands_shift, int mode, int shift)
{
// Unimplemented stub
Print("Error: iBandsOnArray() - Not implemented stub.");
return -1;
}

double iBullsPowerMQL4(string symbol, int tf, int period, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iBullsPower(symbol,timeframe,period);
   if(handle<0)
     {
      Print("The iBullsPower object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iCCIMQL4(string symbol, int tf, int period, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iCCI(symbol,timeframe,period,price);
   if(handle<0)
     {
      Print("The iCCI object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iCCIOnArray(double &array[], int total, int period, int shift)
{
// Unimplemented stub
Print("Error: iCCIOnArray() - Not implemented stub.");
return -1;
}

double iDeMarkerMQL4(string symbol, int tf, int period, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iDeMarker(symbol,timeframe,period);
   if(handle<0)
     {
      Print("The iDeMarker object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double EnvelopesMQL4(string symbol, int tf, int ma_period, int method, int ma_shift, int price, double deviation, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iEnvelopes(symbol,timeframe,
                         ma_period,ma_shift,ma_method,
                         applied_price,deviation);
   if(handle<0)
     {
      Print("The iEnvelopes object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode-1,shift));
}

double iEnvelopesOnArray(double &array[], int total, int ma_period, int ma_method, int ma_shift, double deviation, int mode, int shift)
{
// Unimplemented stub
Print("Error: iEnvelopesOnArray() - Not implemented stub.");
return -1;
}

double iForceMQL4(string symbol, int tf, int period, int method, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   int handle=iForce(symbol,timeframe,period,ma_method,VOLUME_TICK);
   if(handle<0)
     {
      Print("The iForce object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iFractalsMQL4(string symbol, int tf, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iFractals(symbol,timeframe);
   if(handle<0)
     {
      Print("The iFractals object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode-1,shift));
}

double iGatorMQL4(string symbol, int tf, int jaw_period, int jaw_shift, int teeth_period, int teeth_shift, int lips_period, int lips_shift, int method, int price, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iGator(symbol,timeframe,jaw_period,jaw_shift,
                     teeth_period,teeth_shift,
                     lips_period,lips_shift,
                     ma_method,applied_price);
   if(handle<0)
     {
      Print("The iGator object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode-1,shift));
}

double iIchimokuMQL4(string symbol, int tf, int tenkan_sen, int kijun_sen, int senkou_span_b, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iIchimoku(symbol,timeframe,
                        tenkan_sen,kijun_sen,senkou_span_b);
   if(handle<0)
     {
      Print("The iIchimoku object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode-1,shift));
}

double iBWMFIMQL4(string symbol, int tf, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=(int)iBWMFI(symbol,timeframe,VOLUME_TICK);
   if(handle<0)
     {
      Print("The iBWMFI object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iMomentumMQL4(string symbol,
                     int tf,
                     int period,
                     int price,
                     int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iMomentum(symbol,timeframe,period,applied_price);
   if(handle<0)
     {
      Print("The iMomentum object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iMomentumOnArray(double &array[], int total, int period, int shift)
{
// Unimplemented stub
Print("Error: iMomentumOnArray() - Not implemented stub.");
return -1;
}

double iMFIMQL4(string symbol, int tf, int period, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=(int)iMFI(symbol,timeframe,period,VOLUME_TICK);
   if(handle<0)
     {
      Print("The iMFI object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iMAMQL4(string symbol, int tf, int period, int ma_shift, int method, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iMA(symbol,timeframe,period,ma_shift,
                  ma_method,applied_price);
   if(handle<0)
     {
      Print("The iMA object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iMAOnArray(double &array[], int total, int period, int ma_shift, int ma_method, int shift)
{
   double buf[],arr[];
   if(total==0) total=ArraySize(array);
   if(total>0 && total<=period) return(0);
   if(shift>total-period-ma_shift) return(0);
   switch(ma_method)
     {
      case MODE_SMA :
        {
         total=ArrayCopy(arr,array,0,shift+ma_shift,period);
         if(ArrayResize(buf,total)<0) return(0);
         double sum=0;
         int    i,pos=total-1;
         for(i=1;i<period;i++,pos--)
            sum+=arr[pos];
         while(pos>=0)
           {
            sum+=arr[pos];
            buf[pos]=sum/period;
            sum-=arr[pos+period-1];
            pos--;
           }
         return(buf[0]);
        }
      case MODE_EMA :
        {
         if(ArrayResize(buf,total)<0) return(0);
         double pr=2.0/(period+1);
         int    pos=total-2;
         while(pos>=0)
           {
            if(pos==total-2) buf[pos+1]=array[pos+1];
            buf[pos]=array[pos]*pr+buf[pos+1]*(1-pr);
            pos--;
           }
         return(buf[shift+ma_shift]);
        }
      case MODE_SMMA :
        {
         if(ArrayResize(buf,total)<0) return(0);
         double sum=0;
         int    i,k,pos;
         pos=total-period;
         while(pos>=0)
           {
            if(pos==total-period)
              {
               for(i=0,k=pos;i<period;i++,k++)
                 {
                  sum+=array[k];
                  buf[k]=0;
                 }
              }
            else sum=buf[pos+1]*(period-1)+array[pos];
            buf[pos]=sum/period;
            pos--;
           }
         return(buf[shift+ma_shift]);
        }
      case MODE_LWMA :
        {
         if(ArrayResize(buf,total)<0) return(0);
         double sum=0.0,lsum=0.0;
         double price;
         int    i,weight=0,pos=total-1;
         for(i=1;i<=period;i++,pos--)
           {
            price=array[pos];
            sum+=price*i;
            lsum+=price;
            weight+=i;
           }
         pos++;
         i=pos+period;
         while(pos>=0)
           {
            buf[pos]=sum/weight;
            if(pos==0) break;
            pos--;
            i--;
            price=array[pos];
            sum=sum-lsum+price*period;
            lsum-=array[i];
            lsum+=price;
           }
         return(buf[shift+ma_shift]);
        }
      default: return(0);
     }
   return(0);
}

double iOsMAMQL4(string symbol, int tf, int fast_ema_period, int slow_ema_period, int signal_period, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iOsMA(symbol,timeframe,
                    fast_ema_period,slow_ema_period,
                    signal_period,applied_price);
   if(handle<0)
     {
      Print("The iOsMA object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iMACDMQL4(string symbol, int tf, int fast_ema_period, int slow_ema_period, int signal_period, int price, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iMACD(symbol,timeframe,
                    fast_ema_period,slow_ema_period,
                    signal_period,applied_price);
   if(handle<0)
     {
      Print("The iMACD object is not created: Error ",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode,shift));
}

double iOBVMQL4(string symbol, int tf, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iOBV(symbol,timeframe,VOLUME_TICK);
   if(handle<0)
     {
      Print("The iOBV object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iSARMQL4(string symbol,
                int tf,
                double step,
                double maximum,
                int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iSAR(symbol,timeframe,step,maximum);
   if(handle<0)
     {
      Print("The iSAR object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iRSIMQL4(string symbol, int tf, int period, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iRSI(symbol,timeframe,period,applied_price);
   if(handle<0)
     {
      Print("The iRSI object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iRSIOnArray(double &array[], int total, int period, int shift)
{
// Unimplemented stub
Print("Error: iRSIOnArray() - Not implemented stub.");
return -1;
}

double iRVIMQL4(string symbol, int tf, int period, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iRVI(symbol,timeframe,period);
   if(handle<0)
     {
      Print("The iRVI object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode,shift));
}

double iStdDevMQL4(string symbol, int tf, int ma_period, int ma_shift, int method, int price, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   ENUM_APPLIED_PRICE applied_price=PriceMigrate(price);
   int handle=iStdDev(symbol,timeframe,ma_period,ma_shift,
                      ma_method,applied_price);
   if(handle<0)
     {
      Print("The iStdDev object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

double iStdDevOnArray(double &array[], int total, int ma_period, int ma_shift, int ma_method, int shift)
{
// Unimplemented stub
Print("Error: iStdDevOnArray() - Not implemented stub.");
return -1;
}


double iStochasticMQL4(string symbol, int tf, int Kperiod, int Dperiod, int slowing, int method, int field, int mode, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   ENUM_MA_METHOD ma_method=MethodMigrate(method);
   ENUM_STO_PRICE price_field=StoFieldMigrate(field);
   int handle=iStochastic(symbol,timeframe,Kperiod,Dperiod,
                          slowing,ma_method,price_field);
   if(handle<0)
     {
      Print("The iStochastic object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,mode,shift));
}

double iWPRMQL4(string symbol, int tf, int period, int shift)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   int handle=iWPR(symbol,timeframe,period);
   if(handle<0)
     {
      Print("The iWPR object is not created: Error",GetLastError());
      return(-1);
     }
   else
      return(CopyBufferMQL4(handle,0,shift));
}

//Timeseries Access - This code now exists with MQL5 too - TODO, remove this entirely.
/* 
int iBars(string symbol, int tf)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   return(Bars(symbol,timeframe));
}

int iBarShift(string symbol, int tf, datetime time, bool exact=false)
{
   if(time<0) return(-1);
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   datetime Arr[],time1;
   ArraySetAsSeries(Arr,true);
   CopyTime(symbol,timeframe,0,1,Arr);
   time1=Arr[0];
   if(CopyTime(symbol,timeframe,time,time1,Arr)>0)
     {
      if(ArraySize(Arr)>2) return(ArraySize(Arr)-1);
      if(time<time1) return(1);
      else return(0);
     }
   else return(-1);
  }
  
double iOpen(string symbol, int tf, int _index)
{   
   if(_index < 0) return(-1);
   double Arr[];
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   if(CopyOpen(symbol,timeframe, 0,Bars(symbol,timeframe), Arr)>0) 
        return(Arr[_index]);
   else return(-1);
}
             
double iClose(string symbol, int tf, int _index)
{
   if(_index < 0) return(-1);
   double Arr[];
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   if(CopyClose(symbol,timeframe, 0,_index, Arr)>0) 
        return(Arr[_index]);
   else return(-1);
}

double iHigh(string _symbol,int _timeframe, int _index)
{
   double _High[], _high=0;
   ArraySetAsSeries(_High,true);
   int _copied=CopyHigh(_symbol,TFMigrate(_timeframe),0,iBars(_symbol,_timeframe),_High);
   if(_copied>0) _high=_High[_index];
   return(_high);
}

double iLow(string _symbol,int _timeframe,int _index)
{
   double _Low[],_low=0;
   ArraySetAsSeries(_Low,true);
   int _copied=CopyLow(_symbol,TFMigrate(_timeframe),0,iBars(_symbol,_timeframe),_Low);
   if(_copied>0) _low=_Low[_index];
   return(_low);
}

datetime iTime(string _symbol,int _timeframe,int _index)
{
   datetime _Time[],_time=0;
   ArraySetAsSeries(_Time,true);
   int _copied=CopyTime(_symbol,TFMigrate(_timeframe),0,iBars(_symbol,_timeframe),_Time);
   if(_copied>0) _time=_Time[0];
   return(_time);
}

long iVolume(string _symbol,int _timeframe,int _index)
{
   long _Volume[],_volume=0;
   ArraySetAsSeries(_Volume,true);
   int _copied=CopyTickVolume(_symbol,TFMigrate(_timeframe),0,iBars(_symbol,_timeframe),_Volume);
   if(_copied>0) _volume=_Volume[_index];
   return(_volume);
}

int iHighest(string _symbol,int _tf,int _type,int _count=WHOLE_ARRAY,int _start=0)
{
   if(_start<0) return(-1);
   ENUM_TIMEFRAMES _timeframe=TFMigrate(_tf);
   if(_count<=0) _count=Bars(_symbol,_timeframe);
   if(_type<=MODE_OPEN)
     {
      double _Open[];
      ArraySetAsSeries(_Open,true);
      CopyOpen(_symbol,_timeframe,_start,_count,_Open);
      return(ArrayMaximum(_Open,0,_count)+_start);
     }
   if(_type==MODE_LOW)
     {
      double _Low[];
      ArraySetAsSeries(_Low,true);
      CopyLow(_symbol,_timeframe,_start,_count,_Low);
      return(ArrayMaximum(_Low,0,_count)+_start);
     }
   if(_type==MODE_HIGH)
     {
      double _High[];
      ArraySetAsSeries(_High,true);
      CopyHigh(_symbol,_timeframe,_start,_count,_High);
      return(ArrayMaximum(_High,0,_count)+_start);
     }
   if(_type==MODE_CLOSE)
     {
      double _Close[];
      ArraySetAsSeries(_Close,true);
      CopyClose(_symbol,_timeframe,_start,_count,_Close);
      return(ArrayMaximum(_Close,0,_count)+_start);
     }
   if(_type==MODE_VOLUME)
     {
      long _Volume[];
      ArraySetAsSeries(_Volume,true);
      CopyTickVolume(_symbol,_timeframe,_start,_count,_Volume);
      return(ArrayMaximum(_Volume,0,_count)+_start);
     }
   if(_type>=MODE_TIME)
     {
      datetime _Time[];
      ArraySetAsSeries(_Time,true);
      CopyTime(_symbol,_timeframe,_start,_count,_Time);
      return(ArrayMaximum(_Time,0,_count)+_start);
      //---
     }
   return(0);
}

int iLowest(string _symbol,int _tf,int _type,int _count=WHOLE_ARRAY,int _start=0)
{
   if(_start<0) return(-1);
   ENUM_TIMEFRAMES _timeframe=TFMigrate(_tf);
   if(_count<=0) _count=Bars(_symbol,_timeframe);
   if(_type<=MODE_OPEN)
     {
      double _Open[];
      ArraySetAsSeries(_Open,true);
      CopyOpen(_symbol,_timeframe,_start,_count,_Open);
      return(ArrayMinimum(_Open,0,_count)+_start);
     }
   if(_type==MODE_LOW)
     {
      double _Low[];
      ArraySetAsSeries(_Low,true);
      CopyLow(_symbol,_timeframe,_start,_count,_Low);
      return(ArrayMinimum(_Low,0,_count)+_start);
     }
   if(_type==MODE_HIGH)
     {
      double _High[];
      ArraySetAsSeries(_High,true);
      CopyHigh(_symbol,_timeframe,_start,_count,_High);
      return(ArrayMinimum(_High,0,_count)+_start);
     }
   if(_type==MODE_CLOSE)
     {
      double _Close[];
      ArraySetAsSeries(_Close,true);
      CopyClose(_symbol,_timeframe,_start,_count,_Close);
      return(ArrayMinimum(_Close,0,_count)+_start);
     }
   if(_type==MODE_VOLUME)
     {
      long _Volume[];
      ArraySetAsSeries(_Volume,true);
      CopyTickVolume(_symbol,_timeframe,_start,_count,_Volume);
      return(ArrayMinimum(_Volume,0,_count)+_start);
     }
   if(_type>=MODE_TIME)
     {
      datetime _Time[];
      ArraySetAsSeries(_Time,true);
      CopyTime(_symbol,_timeframe,_start,_count,_Time);
      return(ArrayMinimum(_Time,0,_count)+_start);
      //---
     }
   return(0);
}
*/


//Chart Operations
void HideTestIndicators(bool hide)
{
// Unimplemented stub
Print("Error: HideTestIndicators() - Not implemented stub.");
}

bool RefreshRates()
{
// Unimplemented stub
Print("Error: RefreshRates() - Not implemented stub.");
return false;
}

int WindowBarsPerChart()
{
return (int) ChartGetInteger(0,CHART_VISIBLE_BARS,0);
}

string WindowExpertName()
{
return MQL5InfoString(MQL5_PROGRAM_NAME);
}

int WindowFind(string name)
{
   int window=-1;
   if((ENUM_PROGRAM_TYPE)MQL5InfoInteger(MQL5_PROGRAM_TYPE)==PROGRAM_INDICATOR)
     {
      window=ChartWindowFind();
     }
   else
     {
      window=ChartWindowFind(0,name);
      if(window==-1) Print(__FUNCTION__+"(): Error = ",GetLastError());
     }
   return(window);
}

int WindowFirstVisibleBar()
{
return (int) ChartGetInteger(0,CHART_FIRST_VISIBLE_BAR,0);
}

int WindowHandle(string symbol, int tf)
{
   ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
   long currChart,prevChart=ChartFirst();
   int i=0,limit=100;
   while(i<limit)
     {
      currChart=ChartNext(prevChart);
      if(currChart<0) break;
      if(ChartSymbol(currChart)==symbol
         && ChartPeriod(currChart)==timeframe)
         return((int)currChart);
      prevChart=currChart;
      i++;
     }
   return(0);
}

bool WindowIsVisible(int index)
{
return (bool) ChartGetInteger(0,CHART_WINDOW_IS_VISIBLE,index);
}

int WindowOnDropped()
{
return ChartWindowOnDropped();
}

double WindowPriceMax(int index=0)
{
return ChartGetDouble(0,CHART_PRICE_MAX,index);
}

double WindowPriceMin(int index=0)
{
return ChartGetDouble(0,CHART_PRICE_MIN,index);
}

double WindowPriceOnDropped()
{
return ChartPriceOnDropped();
}

void WindowRedraw()
{
ChartRedraw(0);
}

bool WindowScreenShot(string filename, int size_x, int size_y, int start_bar=-1, int chart_scale=-1, int chart_mode=-1)
{
   if(chart_scale>0 && chart_scale<=5)
      ChartSetInteger(0,CHART_SCALE,chart_scale);
   switch(chart_mode)
     {
      case 0: ChartSetInteger(0,CHART_MODE,CHART_BARS);
      case 1: ChartSetInteger(0,CHART_MODE,CHART_CANDLES);
      case 2: ChartSetInteger(0,CHART_MODE,CHART_LINE);
     }
   if(start_bar<0)
      return(ChartScreenShot(0,filename,size_x,size_y,ALIGN_RIGHT));
   else
      return(ChartScreenShot(0,filename,size_x,size_y,ALIGN_LEFT));
}

datetime WindowTimeOnDropped()
{
return ChartTimeOnDropped();
}

int WindowsTotal()
{
return (int) ChartGetInteger(0,CHART_WINDOWS_TOTAL);
}

int WindowXOnDropped()
{
return ChartXOnDropped();
}

int WindowYOnDropped()
{
return ChartYOnDropped();
}

