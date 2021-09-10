# mql4compat

## About

This library allows to run most scripts and indicators from MetaTrader 4 on MetaTrader 5. Most of the functions are covered already and only trading logic is not added so for experts. You may find it convenient to check the MT4Orders library to convert EA too : https://www.mql5.com/en/code/16006 

You will need to manually edit the script and do some modification replacing indicators with the \*MQL4 equivalent function from this library. 

InitMQL4Env is only needed if you use Bars global variable with mql4compat version >= 2.2 ! 

Then the « converted » EA / Script will not work in MQL4 anylonger ! No problem, I (Eromawyn) have added a (very rough alpha version) library to keep the modified version compatible with both MQL4 and MQL5. And to make an EA compatible with both MT4 and MT5, I use the MQL_Easy framework : https://github.com/Denn1Ro/MQL_Easy

## History

First version was published on MQL5.com in may 2010 : http://www.mql5.com/en/articles/81

Arunas Pranckevicius (T-1000) published kept maintaining this file between 2013 and 2016 : https://www.mql5.com/en/code/1787

This very popular library was unmaintained for years. It didn’t compile with MT5 build 2981 (June 2021). I’m pretty sure this library is on the hard disk of many MQL4 / MQL5 coders. Here I try to keep a maintained version of the original library. 

Please don’t hesitate to send patches / merge request on github :  https://github.com/eromawyn/mql4compat

## Instruction for usage

This library has covered most of functions except EA trading mechanisms. Also for the functions what give errors on MT5 there are alternative functions with same name just with MQL4 ending. Most of them are for conflicting functions what already have same names in MQL5. The original article led only to skeleton library so this version of library is mostly filled with MQL4 functions.  Please see library source code with search pattern "MQL4" for specific functions names.

**TODO:** EA trading mechanics for Orders sending and control. Some functions have generic stubs and will give according error messages in log. The return code for those are always **-1**. Meanwhile, you may find it convenient to check the MT4Orders library : https://www.mql5.com/en/code/16006 

### Installation

Put mql4compat.mqh in your Include directory (it resides on your Windows user roaming profile).

In your MQL4 EA/indicator/library/script please add right after #property definitions:

```
#include <mql4compat.mqh>
```



Change MQL4 functions:

```
int init() to int OnInit()
int deinit() to void OnDeinit(const int reason);
int start() in script to void OnStart();
int start() in  indicator to:
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
```

The last line with return() function then should be as following:

```
   return(rates_total);
```

 Change conflicting functions between MQL4 and MQL5 due their changed parmeters by adding MQL4 to their names:

```
   int ArrayInitializeMQL4(double &array[], double value)
   int ArrayMaximumMQL4(double &array[], int count=WHOLE_ARRAY, int start=0)
   int ArrayMinimumMQL4(double &array[], int count=WHOLE_ARRAY, int start=0)
   int ArraySortMQL4(double &array[], int count=WHOLE_ARRAY, int start=0, int sort_dir=MODE_ASCEND)
   double CopyBufferMQL4(int handle,int index,int shift)
   double EnvelopesMQL4(string symbol, int tf, int ma_period, int method, int ma_shift, int price, double deviation, int mode, int shift)
   double FileReadDoubleMQL4(int handle, int size=DOUBLE_VALUE)
   bool FileSeekMQL4(long handle, int offset, ENUM_FILE_POSITION origin)
   int IndicatorCountedMQL4(int _prev_calculated=0)
   bool ObjectCreateMQL4(string name, ENUM_OBJECT type, int window, datetime time1, double price1, datetime time2=0, double price2=0, datetime time3=0, double price3=0)
   bool ObjectDeleteMQL4(string name)
   string ObjectDescriptionMQL4(string name)
   int ObjectFindMQL4(string name)
   bool ObjectMoveMQL4(string name, int point, datetime time1, double price1)
   string ObjectNameMQL4(int index)
   int ObjectsDeleteAllMQL4(int window=EMPTY, int type=EMPTY)
   int ObjectsTotalMQL4(int type=EMPTY, int window=-1)
   bool SetIndexBufferMQL4(int index, double &array[])
   string StringConcatenateMQL4(string _str1,string _str2, ... string _str64="")
   int StringGetCharMQL4(string text, int pos)
   string StringSetCharMQL4(string text, int pos, int value)
   double iACMQL4(string symbol, int tf, int shift)
   double iADMQL4(string symbol, int tf, int shift)
   double iADXMQL4(string symbol, int tf, int period, int price, int mode, int shift)
   double iAOMQL4(string symbol, int tf, int shift)
   double iATRMQL4(string symbol, int tf, int period, int shift)
   double iAlligatorMQL4(string symbol, int tf, int jaw_period, int jaw_shift, int teeth_period, int teeth_shift, int lips_period, int lips_shift, int method, int price, int mode, int shift)
   double iBWMFIMQL4(string symbol, int tf, int shift)
   double iBandsMQL4(string symbol, int tf, int period, double deviation, int bands_shift, int method, int mode, int shift)
   double iBearsPowerMQL4(string symbol, int tf, int period, int price, int shift)
   double iBullsPowerMQL4(string symbol, int tf, int period, int price, int shift)
   double iCCIMQL4(string symbol, int tf, int period, int price, int shift)
   double iDeMarkerMQL4(string symbol, int tf, int period, int shift)
   double iForceMQL4(string symbol, int tf, int period, int method, int price, int shift)
   double iFractalsMQL4(string symbol, int tf, int mode, int shift)
   double iGatorMQL4(string symbol, int tf, int jaw_period, int jaw_shift, int teeth_period, int teeth_shift, int lips_period, int lips_shift, int method, int price, int mode, int shift)
   double iIchimokuMQL4(string symbol, int tf, int tenkan_sen, int kijun_sen, int senkou_span_b, int mode, int shift)
   double iMACDMQL4(string symbol, int tf, int fast_ema_period, int slow_ema_period, int signal_period, int price, int mode, int shift)
   double iMAMQL4(string symbol, int tf, int period, int ma_shift, int method, int price, int shift)
   double iMFIMQL4(string symbol, int tf, int period, int shift)
   double iMomentumMQL4(string symbol, int tf, int period, int price, int shift)
   double iOBVMQL4(string symbol, int tf, int price, int shift)
   double iOsMAMQL4(string symbol, int tf, int fast_ema_period, int slow_ema_period, int signal_period, int price, int shift)
   double iRSIMQL4(string symbol, int tf, int period, int price, int shift)
   double iRVIMQL4(string symbol, int tf, int period, int mode, int shift)
   double iSARMQL4(string symbol, int tf, double step, double maximum, int shift)
   double iStdDevMQL4(string symbol, int tf, int ma_period, int ma_shift, int method, int price, int shift)
   double iStochasticMQL4(string symbol, int tf, int Kperiod, int Dperiod, int slowing, int method, int field, int mode, int shift)
   double iWPRMQL4(string symbol, int tf, int period, int shift)
```

In indicators the manual tweaks are needed for OnInit() function and #property headers. Also IndicatorCounted() function needs to be changed to variable for same name by removing clauses or changing to MQL5 prev_calculated variable:

```
#define IndicatorCounted IndicatorCountedMQL4(prev_calculated)
```

In custom indicators please see how **#property** headers are in MQL5 and then swap input parameters definitions type **extern** to **input**. Also in MQL5 they are now **constants** and any attempt to change values will lead to errors. The fix is by adding temporary variables then copy input parameters values to them instead.

### InitMQL4Env()
On first line of your base code please add MQL4 reserved variables initialization function (as of version 2.2, only needed if you use MQL4 global variable Bars) :

```MQL5
// -- Init MQL4 compatible environment
   InitMQL4Env();
```

Using define for Bars would also affect the Bars function. If you know of any trick which would allow to redefine it while keeping the Bars() function available, keep free to send a patch.

## Changelog

Changelog only kept since version 2.0 ...

### Version 2.0
- First published version on github by Eromawyn
- Compilation fixes for MQL5 build 2981
- Adds a library to make a ported script / EA run back in MT4

### Version 2.1
- InitMQL4Env() function deprecated. And faster since this compatibility function was notoriously slow.

### Version 2.2
- InitMQL4Env() unfortunately still needed, but only if you use Bars global variable. 

### Version 2.3
- Implemented AccountFreeMarginCheck()
- added support for some obsolete MQL4 function : CurTime(), HistoryTotal(), LocalTime()

### Credits

##### Github by Eromawyn (2021)

 https://github.com/eromawyn/mql4compat 

I created this repository after noticing that the original mql4compat wasn’t maintained anylonger, and I couldn’t contact the original author (no response on my MQL5 message, and nobody joined the IRC channel mentionned in the header during a whole month) although this file is very very popular amongst people who need to convert MQL4 code to MQL5. 

##### Original version (2013-2016) by Arunas Pranckevicius (T-1000) 

Published on MQL5.com : https://www.mql5.com/en/code/1787

