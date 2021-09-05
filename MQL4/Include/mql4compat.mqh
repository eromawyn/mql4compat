//+------------------------------------------------------------------+
//|                                                   mql4compat.mqh |
//|                           https://github.com/eromawyn/mql4compat |
//|                                       Copyright © 2021, Eromawyn |
//+------------------------------------------------------------------+

// This MQL4 library allows an EA / Script modified for MQL5 using mql4compat 
// to be run back in MT4 without any modifications.

// Status : WORK IN PROGRESS. 
// It is working for a few EA I converted. No warranty it will work for yours,
// but in case, don’t hesitate to open a bug or send patches on github :
// https://github.com/eromawyn/mql4compat

// Fake init function for MQL4 in MT4 !
void InitMQL4Env() 
{
	return;
}

int TFMigrate(int tf) {
   return (tf);
}

#define ArrayInitializeMQL4(array, value) 	  ArrayInitialize(array, value) 

#define ArrayMaximumMQL4(array, count, start) ArrayMaximum(array, count, start)
//#define ArrayMaximumMQL4(array, count)        ArrayMaximum(array, count)
//#define ArrayMaximumMQL4(array)               ArrayMaximum(array)

#define ArrayMinimumMQL4(array, count, start) ArrayMinimum(array, count, start)
//#define ArrayMinimumMQL4(array, count)            ArrayMinimum(array, count)
//#define ArrayMinimumMQL4(array)                   ArrayMinimum(array)

#define ArraySortMQL4(array, count, start, sort_dir)  ArraySort(array, count, start, sort_dir)
///#define ArraySortMQL4(array, count, start)            ArraySort(array, count, start)
//#define ArraySortMQL4(array, count)                   ArraySort(array, count)
//#define ArraySortMQL4(array)                          ArraySort(array)

#define StringConcatenateMQL4                         StringConcatenate

// This indicator doesn’t exist in MQL5 - but this function exists on T-1000 mql4compat.mqh
#define IndicatorCountedMQL4( _prev_calculated )      IndicatorCounted( _prev_calculated )  
//#define IndicatorCountedMQL4()                        IndicatorCounted()  

#define SetIndexBufferMQL4(index, array)              SetIndexBuffer(index, array)

#define FileReadDoubleMQL4(handle, size)              FileReadDouble(handle, size)
//#define FileReadDoubleMQL4(handle)                    FileReadDouble(handle)
 
#define FileSeekMQL4(handle, offset, origin)          FileSeek(handle, offset, origin)     

#define ObjectCreateMQL4   ObjectCreate

// TODO clean-up
/*
#define ObjectCreateMQL4(name, type, window, time1, price1, time2, price2, time3, price3)   ObjectCreate(name, type, window, time1, price1, time2, price2, time3, price3)
#define ObjectCreateMQL4(name, type, window, time1, price1, time2, price2, time3)           ObjectCreate(name, type, window, time1, price1, time2, price2, time3)
#define ObjectCreateMQL4(name, type, window, time1, price1, time2, price2)                  ObjectCreate(name, type, window, time1, price1, time2, price2)
#define ObjectCreateMQL4(name, type, window, time1, price1, time2)                          ObjectCreate(name, type, window, time1, price1, time2)
#define ObjectCreateMQL4(name, type, window, time1, price1)                                 ObjectCreate(name, type, window, time1, price1)
*/

#define ObjectDeleteMQL4(name)                        ObjectDelete(name) 

#define ObjectDescriptionMQL4(name)                   ObjectDescription (name)

#define ObjectFindMQL4(name)                          ObjectFind(name)

#define ObjectMoveMQL4(name, point, time1, price1)    ObjectMove(name, point, time1, price1)

#define ObjectNameMQL4(index)                         ObjectName(index)

#define ObjectsDeleteAllMQL4(window, type)           ObjectsDeleteAll(window, type)
//#define ObjectsDeleteAllMQL4(window)                 ObjectsDeleteAll(window)
//#define ObjectsDeleteAllMQL4()                       ObjectsDeleteAll()

#define ObjectsTotalMQL4(type, window)               ObjectsTotal(type, window)    
// #define ObjectsTotalMQL4(type)                       ObjectsTotal(type)    
// #define ObjectsTotalMQL4()                           ObjectsTotal()    

#define StringGetCharMQL4(text, pos)                 StringGetChar(text, pos)

#define StringSetCharMQL4(text, pos, value)          StringSetChar(text, pos, value)  

#define CopyBufferMQL4(handle, index, shift)         CopyBuffer(handle, index, shift)

#define iACMQL4(symbol, tf, shift)                   iAC( symbol, tf, shift)

#define iADMQL4(symbol, tf, shift)                   iAD( symbol, tf, shift)

#define iAlligatorMQL4  iAlligator
// TODO clean-up
//#define iAlligatorMQL4(symbol, tf, jaw_period, jaw_shift, teeth_period, teeth_shift, lips_period, lips_shift, method, price, mode, shift)    iAlligator(symbol, tf, jaw_period, jaw_shift, teeth_period, teeth_shift, lips_period, lips_shift, method, price, mode, shift)

#define iADXMQL4(symbol, tf, period, price, mode, shift)    iADX(symbol, tf, period, price, mode, shift)

#define iATRMQL4(symbol, tf, period, shift)                 iATR(symbol, tf, period, shift)   

#define iAOMQL4(symbol, tf, shift)                   iAO(symbol, tf, shift) 

#define iBearsPowerMQL4(symbol, tf, period, price, shift)    iBearsPower(symbol, tf, period, price, shift)

#define iBandsMQL4(symbol, tf, period, deviation, bands_shift, method, mode, shift)    iBands(symbol, tf, period, deviation, bands_shift, method, mode, shift)

#define iBullsPowerMQL4(symbol, tf, period, price, shift)      iBullsPower(symbol, tf, period, price, shift)   

#define iCCIMQL4(symbol, tf, period, price, shift)     iCCI(symbol, tf, period, price, shift)

#define iDeMarkerMQL4(symbol, tf, period, shift)       iDeMarker(symbol, tf, period, shift)

#define iEnvelopesMQL4  iEnvelopes
// TODO clean-up
//#define iEnvelopesMQL4(symbol, tf, ma_period, method, ma_shift, price, deviation, mode, shift)       iEnvelopes(symbol, tf, ma_period, method, ma_shift, price, deviation, mode, shift)

#define iForceMQL4(symbol, tf, period, method, price, shift)     iForceMQL4(symbol, tf, period, method, price, shift

#define iFractalsMQL4(symbol, tf, mode, shift)       iFractals(symbol, tf, mode, shift)

#define iGatorMQL4   iGator
// TODO clean-up
//#define iGatorMQL4(symbol, tf, jaw_period, jaw_shift, teeth_period, teeth_shift, lips_period, lips_shift, method, price, mode, shift)   iGator(symbol, tf, jaw_period, jaw_shift, teeth_period, teeth_shift, lips_period, lips_shift, method, price, mode, shift)

#define iIchimokuMQL4(symbol, tf, tenkan_sen, kijun_sen, senkou_span_b, mode, shift)     iIchimoku(symbol, tf, tenkan_sen, kijun_sen, senkou_span_b, mode, shift) 

#define iBWMFIMQL4(symbol, tf, shift)     iBWMFI(symbol, tf, shift)

#define iMomentumMQL4(symbol, tf, period, price, shift)		iMomentum(symbol, tf, period, price, shift)

#define iMFIMQL4(symbol, tf, period, shift)                 iMFI(symbol, tf, period, shift)

#define iMAMQL4(symbol, tf, period, ma_shift, method, price, shift) iMA(symbol, tf, period, ma_shift, method, price, shift)

#define iOsMAMQL4(symbol, tf, fast_ema_period, slow_ema_period, signal_period, price, shift)  iOsMA(symbol, tf, fast_ema_period, slow_ema_period, signal_period, price, shift) 

#define iMACDMQL4(symbol, tf, fast_ema_period, slow_ema_period, signal_period, price, mode, shift)   iMACD(symbol, tf, fast_ema_period, slow_ema_period, signal_period, price, mode, shift)

#define iOBVMQL4(symbol, tf, price, shift)		iOBV(symbol, tf, price, shift)

#define iSARMQL4(symbol, tf, step, maximum, shift)     iSAR(symbol, tf, step, maximum, shift)

#define iRSIMQL4(symbol, tf, period, price, shift)     iRSI(symbol, tf, period, price, shift)

#define iRVIMQL4(symbol, tf, period, mode, shift)      iRVI(symbol, tf, period, mode, shift)

#define iStdDevMQL4(symbol, tf, ma_period, ma_shift, method, price, shift)    iStdDev(symbol, tf, ma_period, ma_shift, method, price, shift)

#define iStochasticMQL4    iStochastic 
// TODO clean-up
// #define iStochasticMQL4(symbol, tf, Kperiod, Dperiod, slowing, method, field, mode, shift)    iStochastic(symbol, tf, Kperiod, Dperiod, slowing, method, field, mode, shift)

#define iWPRMQL4(symbol, tf, period, shift)     iWPR(symbol, tf, period, shift)

