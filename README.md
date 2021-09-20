# WaitUntilDaily
Wait Until a specified time

Windows command line utility to pause until a specified Time

Pauses until a time of day.  If the time is LESS THAN the current time, then the pause will be until the next day.

Syntax:

WaitUntilDaily.exe (Time)

Examples:

The command lines after this line will run at the next 9 am opportunity.  If the current time is later than 9 am, then they will run on the next day.
WaitUntilDailiy.exe "09:00"


Runs at 3:05 pm.
WaitUntilDaily.exe "15:05"

