#import "PythonNumpyMean.dll"
double GetNumpyMean(double &value[], int arraysize, int period, int index);
#import

//パラメータ
#property indicator_separate_window
#property indicator_buffers 1
#property indicator_color1 DodgerBlue

extern int MaPeriod = 120;

double Buf0[];

//--------------------------------------------------------------------
// expert initialization function
//--------------------------------------------------------------------
int init()
{
//--------------------------------------------------------------------
// コメント表示
//--------------------------------------------------------------------
   SetIndexBuffer(0, Buf0);
   return(0);
}

//+-------------------------------------------------------------------
//| expert deinitialization function
//+-------------------------------------------------------------------
int deinit()
  {   
   return(0);
  }
//+-------------------------------------------------------------------
//| expert start function
//+-------------------------------------------------------------------
int start()
  {
   double close[];
   int size = ArrayCopySeries(close, MODE_CLOSE);
   double test[];
   if(size <= 0){
      Print("no size.");
      return(0);
   }
   ArrayResize(test, size);
   ArrayCopy(test, close);
  int limit = Bars;
   for(int i=limit-1000; i>=0; i--){
      Buf0[i] = GetNumpyMean(test, size, MaPeriod, i);
   }
   
   return(0);
}