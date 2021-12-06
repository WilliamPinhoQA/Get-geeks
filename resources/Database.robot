*Settings*
Documentation   Database Helpers

Library         DatabaseLibrary


*Keywords*
Connect To Postgres
    Connect To Database         psycopg2            #library
    ...                         tsctgnpr            #database_name
    ...                         tsctgnpr            #user
    ...                         V9O5d7HZhG4oHZVBV4iAMrhXy0cDU9sx            #password
    ...                         castor.db.elephantsql.com                   #server url
    ...                         5432                                        #port

Reset Env
    ${delete_geeks}     Set Variable    DELETE from public.geeks;
    Execute SQL String          DELETE from public.users;
    Execute SQL String          ${delete_geeks}