export LD_LIBRARY_PATH=/oracle/Siebel/15.0.0.0/ses/siebsrvr/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/oracle/Siebel/15.0.0.0/ses/gtwsrvr/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/oracle/app/oracle/product/11.2.0/client/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH


---- Gatewate Config -----
source /oracle/Siebel/15.0.0.0/ses/gtwysrvr/cfgenv.sh

cd /oracle/Siebel/15.0.0.0/ses/config/
./config.sh -mode enterprise
./config.sh -mode enterprise
-------------------------

---- Create ODBC ----
cd /oracle/Siebel/15.0.0.0/ses/siebsrvr/install_script/install/
./CreateDbSrvrEnvScript /oracle/Siebel/15.0.0.0/ses ENU Oracle
---------------------

---- DB Check ----
cd /oracle/Siebel/15.0.0.0/ses/siebsrvr/bin/
./odbcsql /source SBA_15_DSN /user sadmin /password sadmin
------------------

@echo EXECUTE DBMS_STATS.GATHER_SCHEMA_STATS(ownname => 'SIEBEL'); | sqlplus siebel/siebel@SIEBELDB


---- DB Install ----
source /oracle/Siebel/15.0.0.0/ses/siebsrvr/dbenv.sh

cd /oracle/Siebel/15.0.0.0/ses/config/
./config.sh -mode dbsrvr

cd /oracle/Siebel/15.0.0.0/ses/siebsrvr/bin/
./srvrupgwiz /m master_install.ucf

cd /oracle/Siebel/15.0.0.0/ses/config/
./config.sh -mode dbsrvr

cd /oracle/Siebel/15.0.0.0/ses/siebsrvr/bin/
./srvrupgwiz /m master_install_lang.ucf
------------------

# Gateway check
. /oracle/Siebel/15.0.0.0/ses/gtwysrvr/siebenv.sh
list_ns
stop_ns
start_ns


# Siebel Server Install
Update CreateSiebSrvrEnvScript
---
##Add variables to be read from siebsrvr.prd
## SIEB_PRODDEF_FILE=$(GetLanguageDir $SIEBEL_LANGUAGE)/install/siebsrvr.prd
 SIEB_PRODDEF_FILE=/oracle/Siebel/15.0.0.0.0/ses/siebsrvr/install_script/install/siebsrvr.prd
---

cd /oracle/Siebel/15.0.0.0/ses/siebsrvr/install_script/install/
./CreateSiebSrvrEnvScript /oracle/Siebel/15.0.0.0/ses/siebsrvr dev1-sbl15-01:2320 ENU Oracle

. /oracle/Siebel/15.0.0.0/ses/siebsrvr/cfgenv.sh
cd /oracle/Siebel/15.0.0.0/ses/config/
./config.sh -mode siebsrvr

#Script for startup siebel server
