*Settings*
Documentation   Test Tasks
Resource            Database.robot
Resource            Actions.robot

*Keywords*
Add User From Database
   [Arguments]      ${user_data} 

   Connect To Postgres

   Insert User          ${user_data} 

   Disconnect from Database

