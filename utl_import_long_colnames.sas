*                _              _               _
 _ __ ___   __ _| | _____   ___| |__   ___  ___| |_
| '_ ` _ \ / _` | |/ / _ \ / __| '_ \ / _ \/ _ \ __|
| | | | | | (_| |   <  __/ \__ \ | | |  __/  __/ |_
|_| |_| |_|\__,_|_|\_\___| |___/_| |_|\___|\___|\__|

;

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.class;
  set sashelp.class(keep=name age);;
run;quit;

%utlfkil(d:/xls/longnames.xlsx);
%utl_submit_r64('
source("c:/Program Files/R/R-3.4.0/etc/Rprofile.site",echo=T);
library(haven);
library(XLConnect);
library(rJava);
class<-read_sas("d:/sd1/class.sas7bdat");
class;
colnames(class)<-c("nam1234567890123456789012345678901234567890",
                   "age1234567890123456789012345678901234567890");
wb<-loadWorkbook("d:/xls/longnames.xlsx",create=TRUE);
createSheet(wb, name="class");
writeWorksheet(wb, class, sheet = "class");
saveWorkbook(wb);
');

*                    _   _
 _ __   __ _ ___ ___| |_| |__  _ __ _   _
| '_ \ / _` / __/ __| __| '_ \| '__| | | |
| |_) | (_| \__ \__ \ |_| | | | |  | |_| |
| .__/ \__,_|___/___/\__|_| |_|_|   \__,_|
|_|
;


proc sql dquote=ansi;
  connect to excel (Path="d:/xls/longnames.xlsx" mixed=yes);
    create
        table classfix as
    select * from connection to Excel
        (
         Select
              nam1234567890123456789012345678901234567890  as nam
             ,age1234567890123456789012345678901234567890 as age
         from
           [class$]
        );
    disconnect from Excel;
Quit;

*_        ______  ____    ______
\ \      / /  _ \/ ___|  / /  _ \
 \ \ /\ / /| |_) \___ \ / /| |_) |
  \ V  V / |  __/ ___) / / |  _ <
   \_/\_/  |_|   |____/_/  |_| \_\

;

%utl_submit_wps64('
options set=R_HOME "C:/Program Files/R/R-3.4.0";
libname wrk "%sysfunc(pathname(work))";
proc r;
submit;
source("C:/Program Files/R/R-3.3.2/etc/Rprofile.site", echo=T);
library(XLConnect);
wb<-loadWorkbook("d:/xls/longnames.xlsx",create=FALSE);
class<-readWorksheet(wb, "class");
colnames(class)<-c("NAM","AGE");
endsubmit;
import r=class data=wrk.classwps;
run;quit;
');

proc print data=classwps;
run;quit;


Up to 40 obs from classwps total obs=19

Obs    NAM        AGE

  1    Alfred      14
  2    Alice       13
  3    Barbara     13
  4    Carol       14
  5    Henry       14


