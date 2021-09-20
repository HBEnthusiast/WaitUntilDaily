*-- FUNCTION WaitUntilDaily(Day_s, Time_s)-----------------------------------------
*         Name: WaitUntilDaily(Day_s, Time_s)             Docs:            
*  Description: Sleeps until a specified Time
*       Author: HBExplorer        
* Date created: 08/23/2021              Date updated: 09/20/2021    
* Time created: 02:51:00 PM            Time updated: 11:33:00 PM
*    Copyright: HBExplorer 2021           
*-----------------------------------------------------------------------------
*    Arguments: Time_s                   Time to sleep until e.g. 13:15, 12:00, 23:59
*
* Return Value: (.T.)    
*-----------------------------------------------------------------------------
Function WaitUntilDaily( Target_Time_s )
Local Target_Time_in_Days_n := 0
Local Target_Time_in_Hours_n := 0
Local Target_Time_in_Minutes_n := 0
Local Target_Time_in_Seconds_n := 0
Local Total_Target_Time_in_Seconds_n := 0
Local Target_Array_a := {}
Local Current_Date_d := DATE()
Local Current_Time_s := TIME()
Local Current_Seconds_n := 0
Local Next_Date_d := Current_Date_d
Local Next_Seconds_n := 0

Current_Seconds_n := TimeToSec( Current_Time_s )
Next_Seconds_n := TimeToSec( Target_Time_s )


SetCancel(.T.)


/*
	If the Target Time is later than now, then calculate the difference between the Target Time and now.
	
	If the Target Time is earlier than now, then calculate the difference between the Target Time tomorrow, and now.
*/
If Next_Seconds_n >= Current_Seconds_n
		Total_Target_Time_in_Seconds_n := Next_Seconds_n - Current_Seconds_n
		?
		? "Waiting for ", Total_Target_Time_in_Seconds_n, " Total seconds"
		?
Else
		Next_Date_d := Current_Date_d + 1
		Target_Array_a := FT_Elapsed( Current_Date_d, Next_Date_d, Current_Time_s, Target_Time_s )	
		// Target_Time_in_Days_n := AllTrim( Str( Target_Array_a[ 1, 2 ] ) )
		Target_Time_in_Hours_n := AllTrim( Str( Target_Array_a[ 2, 1 ] ) ) 
		Target_Time_in_Minutes_n := AllTrim( Str( Target_Array_a[ 3, 1 ] ) ) 
		Target_Time_in_Seconds_n := AllTrim( Str( Target_Array_a[ 4, 1 ] ) )
		Total_Target_Time_in_Seconds_n :=  Target_Array_a[ 4, 2 ]
		?
		? "Waiting for ", Target_Time_in_Hours_n, " hours, ", Target_Time_in_Minutes_n, " minutes, ", Target_Time_in_Seconds_n, " seconds"
		?
EndIf
		
	
FT_Sleep( Total_Target_Time_in_Seconds_n )


Return Nil




// From SuperLib
FUNCTION PROPER(cInString)
local nIter,cOutString,cThisChar,lCapNext

lCapNext   := .T.
cOutString := ''

*- loop for length of string
FOR nIter = 1 TO LEN(cInString)
  cThisChar  := SUBST(cInString,nIter,1)
  *- if its not alpha,cap the next alpha character
  IF !UPPER(cThisChar) $ "ABCDEFGHIJKLMNOPQRSTUVWXYZ'"
    lCapNext := .T.
  ELSE
    *- capitalise it or lower() it accordingly
    IF lCapNext
      cThisChar := UPPER(cThisChar)
      lCapNext  := .F.
    ELSE
      cThisChar := LOWER(cThisChar)
    ENDIF
  ENDIF
  *- add it to the cOutString
  cOutString += cThisChar
NEXT
RETURN cOutString



