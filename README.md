# utl_import_long_conames
Import excel tables/sheets when column names are greater than 32 characters

   ```  Importing excel when column namesa are over 32 characters  ```
   ```    ```
   ```  There are quite a few ways to import excel objects with column names  ```
   ```  greater that 32 characters.  ```
   ```    ```
   ```  WORKING CODE  ```
   ```    ```
   ```    SAS Passthru  ```
   ```    ```
   ```       select * from connection to Excel  ```
   ```            Select  ```
   ```                 nam1234567890123456789012345678901234567890  as nam  ```
   ```     WPS/R  ```
   ```           wb<-loadWorkbook("d:/xls/longnames.xlsx");  ```
   ```           colnames(class)<-c("NAM","AGE");  ```
   ```           import data=classwps  ```
   ```    ```
   ```     SAS/libname (not shown)  ```
   ```    ```
   ```    ```
   ```  NOTES  ```
   ```  =====  ```
   ```    ```
   ```    1. Best way uses pass thru ( change on the excel side) solution below  ```
   ```       (need programmers SAS?)  ```
   ```    ```
   ```    2. Second best way is to use WPS/R and colnames  ```
   ```    ```
   ```    2. libname xel "d:/xls/longnames.xlsx" scan_text=no header=no;  ```
   ```       read header row only  ```
   ```         ie set xel.class (obs=1)  ```
   ```         ie read the data 'class$a2:z99'n (maybe not be quite the righe syntax, over specify?)  ```
   ```          rename f1,f2,...fn to valid names  ```
   ```    ```
   ```    ```
   ```    ```
   ```  HAVE Sheet with column name that ar 43 characters  ```
   ```  =================================================  ```
   ```    ```
   ```  d:/xls/longnames.xlsx  ```
   ```    ```
   ```  Sheet Class  ```
   ```    ```
   ```   +-------------------------------------------------------------------------------------------------+  ```
   ```   |   |                A                            |                  B                            |  ```
   ```   +-------------------------------------------------------------------------------------------------+  ```
   ```   |   | nam1234567890123456789012345678901234567890 | age1234567890123456789012345678901234567890   |  ```
   ```   | 1 +---------------------------------------------------------------------------------------------+  ```
   ```   | 2 |Alfred                                       |                  14                           |  ```
   ```   | 3 |Alice                                        |                  13                           |  ```
   ```   | 4 |Barbara                                      |                  13                           |  ```
   ```   | 5 |Carol                                        |                  14                           |  ```
   ```   | 6 |Henry                                        |                  14                           |  ```
   ```   | 7 |....                                         |                  ..                           |  ```
   ```   +-------------------------------------------------------------------------------------------------+  ```
   ```    ```
   ```    ```
   ```  WANT  SAS dataset classfix with short names  ```
   ```  ===========================================  ```
   ```    ```
   ```  Up to 40 obs from classfix total obs=19  ```
   ```    ```
   ```  Obs    NAM        AGE  ```
   ```    ```
   ```    1    Alfred      14  ```
   ```    2    Alice       13  ```
   ```    3    Barbara     13  ```
   ```    4    Carol       14  ```
   ```    5    Henry       14  ```
   ```    ....  ```
