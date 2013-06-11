Adobe-AS3-Callback-Helper
=========================

A helper which simplifies the process of creating an anonymous callback function in which you want it to receive the variables as they were when the function was declared, not at the point when it is executed.


Please look in Demo.as to see how it is implemented.

To get the anonymous function that you want to call in the future you call CallbackHelper.createCallback() and pass the anonymous function in as the first paramater. Then in all subsequent paramaters you pass in the variables that the anonymous function is expecting as paramaters. The anonymous function will receive these variables with the values they contain at this point, not the values they contain when the function is later executed.

Please let me know if you find this useful.
