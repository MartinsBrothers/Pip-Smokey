extern double MaximumDrawdown=100  ;    //Max Floating Drawdown %
extern double MaximumDrawdownMoney=0  ;    //Max Floating Drawdown in Money [0-disabled]
extern double MaxDailyDrawdownLimitPercentFTMO=100  ;    //Max Daily Drawdown Limit % FTMO Rules
extern double MaxDailyDrawdownLimitMoneyFTMO=0  ;    //Max Daily Drawdown Limit in Money FTMO Rules [0-disabled]
extern int   MaxDailyDrawdownResetHourFTMO=0  ;    //Max Daily Drawdown Reset Hour FTMO Rules (Broker time)
extern  eMaxDrawdownAction  MaximumDrawdownAction=0  ;    //Max Drawdown Action
extern  eDrawdownCalculation  DrawdownCalculation=1  ;    //Max Drawdown Calculation
extern bool HandleEventsOnEveryTick=false ;    //Handle Max Drawdown Events on Every Tick

enum eMaxDrawdownAction      {IgnoreNewUntilRestart = 3,//Prohibit opening new trades until restart
                   IgnoreNewSignals = 2,//Prohibit opening new trades
                   CloseStopTradingUntilRestart = 1,//Close trades & stop trading until restart
                   CloseStopTradingUntilEndOfDay = 4,//Close trades & stop trading until the end of the day
                   CloseStopTradingFor24h = 0//Close trades & stop trading for 24h
                     };
  enum eDrawdownCalculation      {ThisStrategy = 1,//This strategy
                   TheAccount = 0//The account
                     };
  enum eNewsListRefreshRate      {Every3Hours = 2,//Every 3 hours
                   Every2Hours = 1,//Every 2 hours
                   OnceAnHour = 0//Once an hour
                     };
text=StringConcatenate(": ",DoubleToStr(MaxDrawdown,2)," "+AccountCurrency()," (",DoubleToStr(RelDrawdown*100,2),"%)");
   CreateLabel("Max Drawdown",text,40);

   if(MaxDrawdown!=0) RecoveryFactor=NetProfit/MaxDrawdown;
   text=StringConcatenate(": ",DoubleToStr(RecoveryFactor,2));
   CreateLabel("Recovery Factor",text,60);

    if ( MaxDailyDrawdownLimitMoneyFTMO>Global_29_do && Global_64_do>Global_29_do && Global_64_do - AccountInfoDouble(ACCOUNT_EQUITY)>=MaxDailyDrawdownLimitMoneyFTMO )
 {
   if ( TimeCurrent() - Global_76_lo >  3600 )
   {
     Print(TradeComment + " " + "->",": Max Daily Drawdown Limit FTMO in money -> Equity at Reset Time: ",DoubleToString(Global_64_do,2)," / Current Equity: ",DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY),2)); 
     Global_76_lo = TimeCurrent() ;
   }
   if ( MaximumDrawdownAction == 0 )
   {
     Global_70_bo = true ;
     Global_71_in = 24 ;
     for (tmp_in_2 = 0 ; tmp_in_2 < ArraySize(Global_26_a_168_ko) ; tmp_in_2=tmp_in_2 + 1)
     {
       Global_26_a_168_ko[tmp_in_2].bo_4 = false;
       Global_26_a_168_ko[tmp_in_2].bo_5 = false;
     }
   }
   if ( MaximumDrawdownAction == 4 )
   {
     Global_70_bo = true ;
     Global_66_bo = true ;
     for (tmp_in_3 = 0 ; tmp_in_3 < ArraySize(Global_26_a_168_ko) ; tmp_in_3=tmp_in_3 + 1)
     {
       Global_26_a_168_ko[tmp_in_3].bo_4 = false;
       Global_26_a_168_ko[tmp_in_3].bo_5 = false;
     }
   }
   if ( MaximumDrawdownAction == 1 )
   {
     Global_70_bo = true ;
     Global_72_bo = true ;
     for (tmp_in_4 = 0 ; tmp_in_4 < ArraySize(Global_26_a_168_ko) ; tmp_in_4=tmp_in_4 + 1)
     {
       Global_26_a_168_ko[tmp_in_4].bo_4 = false;
       Global_26_a_168_ko[tmp_in_4].bo_5 = false;
     }
   }
   if ( MaximumDrawdownAction == 2 )
   {
     for (tmp_in_5 = 0 ; tmp_in_5 < ArraySize(Global_26_a_168_ko) ; tmp_in_5=tmp_in_5 + 1)
     {
       Global_26_a_168_ko[tmp_in_5].bo_4 = false;
       Global_26_a_168_ko[tmp_in_5].bo_5 = false;
     }
   }
   if ( MaximumDrawdownAction == 3 )
   {
     Global_72_bo = true ;
     for (tmp_in_6 = 0 ; tmp_in_6 < ArraySize(Global_26_a_168_ko) ; tmp_in_6=tmp_in_6 + 1)
     {
       Global_26_a_168_ko[tmp_in_6].bo_4 = false;
       Global_26_a_168_ko[tmp_in_6].bo_5 = false;
     }
   }
 }
 if ( MaxDailyDrawdownLimitPercentFTMO>Global_29_do && MaxDailyDrawdownLimitPercentFTMO<99.99 && Global_64_do>Global_29_do )
 {
   AccountInfoDouble(ACCOUNT_EQUITY); 
   if ( (1.0 - AccountInfoDouble(ACCOUNT_EQUITY) / Global_64_do) * 100.0>=MaxDailyDrawdownLimitPercentFTMO )
   {
     if ( TimeCurrent() - Global_76_lo >  3600 )
     {
       Print(TradeComment + " " + "->",": Max Daily Drawdown Limit FTMO % -> Equity at Reset Time: ",DoubleToString(Global_64_do,2)," / Current Equity: ",DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY),2)); 
       Global_76_lo = TimeCurrent() ;
     }
     if ( MaximumDrawdownAction == 0 )
     {
       Global_70_bo = true ;
       Global_71_in = 24 ;
       for (tmp_in_7 = 0 ; tmp_in_7 < ArraySize(Global_26_a_168_ko) ; tmp_in_7=tmp_in_7 + 1)
       {
         Global_26_a_168_ko[tmp_in_7].bo_4 = false;
         Global_26_a_168_ko[tmp_in_7].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 4 )
     {
       Global_70_bo = true ;
       Global_66_bo = true ;
       for (tmp_in_8 = 0 ; tmp_in_8 < ArraySize(Global_26_a_168_ko) ; tmp_in_8=tmp_in_8 + 1)
       {
         Global_26_a_168_ko[tmp_in_8].bo_4 = false;
         Global_26_a_168_ko[tmp_in_8].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 1 )
     {
       Global_70_bo = true ;
       Global_72_bo = true ;
       for (tmp_in_9 = 0 ; tmp_in_9 < ArraySize(Global_26_a_168_ko) ; tmp_in_9=tmp_in_9 + 1)
       {
         Global_26_a_168_ko[tmp_in_9].bo_4 = false;
         Global_26_a_168_ko[tmp_in_9].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 2 )
     {
       for (tmp_in_10 = 0 ; tmp_in_10 < ArraySize(Global_26_a_168_ko) ; tmp_in_10=tmp_in_10 + 1)
       {
         Global_26_a_168_ko[tmp_in_10].bo_4 = false;
         Global_26_a_168_ko[tmp_in_10].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 3 )
     {
       Global_72_bo = true ;
       for (tmp_in_11 = 0 ; tmp_in_11 < ArraySize(Global_26_a_168_ko) ; tmp_in_11=tmp_in_11 + 1)
       {
         Global_26_a_168_ko[tmp_in_11].bo_4 = false;
         Global_26_a_168_ko[tmp_in_11].bo_5 = false;
       }
     }
   }
 }
 if ( MaximumDrawdown>Global_29_do && MaximumDrawdown<99.99 )
 {
   Local_3_do = 0.0 ;
   if ( DrawdownCalculation == 1 )
   {
     tmp_st_12 = "";
     tmp_do_13 = 0.0;
     tmp_in_14 = Global_28_in + UID + int(MathPow(10.0,StringLen(IntegerToString(Global_28_in + UID,0,32)) ));
     tmp_in_15 = Global_28_in + UID + int(MathPow(10.0,StringLen(IntegerToString(Global_28_in + UID,0,32)) )) * 2;
     for (tmp_in_16 = 0 ; tmp_in_16 < OrdersTotal() ; tmp_in_16=tmp_in_16 + 1)
     {
       if ( OrderSelect(tmp_in_16,0,0) )
       {
         tmp_in_17 = OrderType();
         tmp_st_18 = OrderSymbol();
         tmp_in_19 = OrderMagicNumber() / 100;
         if ( ( ( tmp_in_17 != 0 || tmp_in_14 != tmp_in_19 ) && (tmp_in_17 != 1 || tmp_in_15 != tmp_in_19) ) )   continue;
         
         if ( ( tmp_st_12 != "" && tmp_st_12 != tmp_st_18 ) )   continue;
         tmp_do_13 = OrderProfit() + OrderSwap() + OrderCommission() + tmp_do_13;
          continue;
       }
       Print(TradeComment + " " + "------",": Failed to select an order! Error=",lizong_11(GetLastError())); 
       
     }
     Local_3_do = -(tmp_do_13);
   }
   if ( DrawdownCalculation == 0 )
   {
     Local_3_do = AccountInfoDouble(ACCOUNT_BALANCE) - AccountInfoDouble(ACCOUNT_EQUITY) ;
   }
   if ( Local_3_do>MaximumDrawdown / 100.0 * AccountInfoDouble(ACCOUNT_BALANCE) )
   {
     if ( TimeCurrent() - Global_76_lo >  3600 )
     {
       Print(TradeComment + " " + "->",": Maximum Drawdown -> Current Loss: ",DoubleToString(Local_3_do,2)," / Current Balance: ",DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2)); 
       Global_76_lo = TimeCurrent() ;
     }
     if ( MaximumDrawdownAction == 0 )
     {
       Global_70_bo = true ;
       Global_71_in = 24 ;
       for (tmp_in_20 = 0 ; tmp_in_20 < ArraySize(Global_26_a_168_ko) ; tmp_in_20=tmp_in_20 + 1)
       {
         Global_26_a_168_ko[tmp_in_20].bo_4 = false;
         Global_26_a_168_ko[tmp_in_20].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 4 )
     {
       Global_70_bo = true ;
       Global_66_bo = true ;
       for (tmp_in_21 = 0 ; tmp_in_21 < ArraySize(Global_26_a_168_ko) ; tmp_in_21=tmp_in_21 + 1)
       {
         Global_26_a_168_ko[tmp_in_21].bo_4 = false;
         Global_26_a_168_ko[tmp_in_21].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 1 )
     {
       Global_70_bo = true ;
       Global_72_bo = true ;
       for (tmp_in_22 = 0 ; tmp_in_22 < ArraySize(Global_26_a_168_ko) ; tmp_in_22=tmp_in_22 + 1)
       {
         Global_26_a_168_ko[tmp_in_22].bo_4 = false;
         Global_26_a_168_ko[tmp_in_22].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 2 )
     {
       for (tmp_in_23 = 0 ; tmp_in_23 < ArraySize(Global_26_a_168_ko) ; tmp_in_23=tmp_in_23 + 1)
       {
         Global_26_a_168_ko[tmp_in_23].bo_4 = false;
         Global_26_a_168_ko[tmp_in_23].bo_5 = false;
       }
     }
     if ( MaximumDrawdownAction == 3 )
     {
       Global_72_bo = true ;
       for (tmp_in_24 = 0 ; tmp_in_24 < ArraySize(Global_26_a_168_ko) ; tmp_in_24=tmp_in_24 + 1)
       {
         Global_26_a_168_ko[tmp_in_24].bo_4 = false;
         Global_26_a_168_ko[tmp_in_24].bo_5 = false;
       }
     }
   }
 }
 if ( !(MaximumDrawdownMoney>Global_29_do) )   return;
 Local_4_do = 0.0 ;
 if ( DrawdownCalculation == 1 )
 {
   tmp_st_25 = "";
   tmp_do_26 = 0.0;
   tmp_in_27 = Global_28_in + UID + int(MathPow(10.0,StringLen(IntegerToString(Global_28_in + UID,0,32)) ));
   tmp_in_28 = Global_28_in + UID + int(MathPow(10.0,StringLen(IntegerToString(Global_28_in + UID,0,32)) )) * 2;
   for (tmp_in_29 = 0 ; tmp_in_29 < OrdersTotal() ; tmp_in_29=tmp_in_29 + 1)
   {
     if ( OrderSelect(tmp_in_29,0,0) )
     {
       tmp_in_30 = OrderType();
       tmp_st_31 = OrderSymbol();
       tmp_in_32 = OrderMagicNumber() / 100;
       if ( ( ( tmp_in_30 != 0 || tmp_in_27 != tmp_in_32 ) && (tmp_in_30 != 1 || tmp_in_28 != tmp_in_32) ) )   continue;
       
       if ( ( tmp_st_25 != "" && tmp_st_25 != tmp_st_31 ) )   continue;
       tmp_do_26 = OrderProfit() + OrderSwap() + OrderCommission() + tmp_do_26;
        continue;
     }
     Print(TradeComment + " " + "------",": Failed to select an order! Error=",lizong_11(GetLastError())); 
     
   }
   Local_4_do = -(tmp_do_26);
 }
 if ( DrawdownCalculation == 0 )
 {
   Local_4_do = AccountInfoDouble(ACCOUNT_BALANCE) - AccountInfoDouble(ACCOUNT_EQUITY) ;
 }
 if ( !(Local_4_do>MaximumDrawdownMoney) )   return;
 
 if ( TimeCurrent() - Global_76_lo >  3600 )
 {
   Print(TradeComment + " " + "->",": Maximum Drawdown in money -> Current Loss: ",DoubleToString(Local_4_do,2)," / Current Balance: ",DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2)); 
   Global_76_lo = TimeCurrent() ;
 }
 if ( MaximumDrawdownAction == 0 )
 {
   Global_70_bo = true ;
   Global_71_in = 24 ;
   for (tmp_in_33 = 0 ; tmp_in_33 < ArraySize(Global_26_a_168_ko) ; tmp_in_33=tmp_in_33 + 1)
   {
     Global_26_a_168_ko[tmp_in_33].bo_4 = false;
     Global_26_a_168_ko[tmp_in_33].bo_5 = false;
   }
 }
 if ( MaximumDrawdownAction == 4 )
 {
   Global_70_bo = true ;
   Global_66_bo = true ;
   for (tmp_in_34 = 0 ; tmp_in_34 < ArraySize(Global_26_a_168_ko) ; tmp_in_34=tmp_in_34 + 1)
   {
     Global_26_a_168_ko[tmp_in_34].bo_4 = false;
     Global_26_a_168_ko[tmp_in_34].bo_5 = false;
   }
 }
 if ( MaximumDrawdownAction == 1 )
 {
   Global_70_bo = true ;
   Global_72_bo = true ;
   for (tmp_in_35 = 0 ; tmp_in_35 < ArraySize(Global_26_a_168_ko) ; tmp_in_35=tmp_in_35 + 1)
   {
     Global_26_a_168_ko[tmp_in_35].bo_4 = false;
     Global_26_a_168_ko[tmp_in_35].bo_5 = false;
   }
 }
 if ( MaximumDrawdownAction == 2 )
 {
   for (tmp_in_36 = 0 ; tmp_in_36 < ArraySize(Global_26_a_168_ko) ; tmp_in_36=tmp_in_36 + 1)
   {
     Global_26_a_168_ko[tmp_in_36].bo_4 = false;
     Global_26_a_168_ko[tmp_in_36].bo_5 = false;
   }
 }
 if ( MaximumDrawdownAction != 3 )   return;
 Global_72_bo = true ;
 for (tmp_in_37 = 0 ; tmp_in_37 < ArraySize(Global_26_a_168_ko) ; tmp_in_37=tmp_in_37 + 1)
 {
   Global_26_a_168_ko[tmp_in_37].bo_4 = false;
   Global_26_a_168_ko[tmp_in_37].bo_5 = false;
 }