```sql
CREATE OR REPLACE DIRECTORY ext_tab_data as '/home/oracle/Desktop/lab10/data';
GRANT read, write on directory ext_tab_data to exercise10;
```

- Countries1.txt

```txt
ENG,England,English
SCO,Scotland,English
IRE,Ireland,English
WAL,Wales,Welsh
```

- Countries2.txt

```txt
FRA,France,French
GER,Germany,German
USA,United States of America,English
CAN,Canada,English
```

```sql
CREATE TABLE  countries_ext(
    country_code        VARCHAR2(5),
    country_name        VARCHAR2(50),
    country_language    VARCHAR2(50)
)
ORGANIZATION EXTERNAL
(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_tab_data
    ACCESS PARAMETERS
    (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ','
        MISSING FIELD VALUES ARE NULL
        (
            country_code        CHAR(5),
            country_name        CHAR(50),
            country_language    CHAR(50)
        )
    )
LOCATION('Countries1.txt','Countries2.txt')
)
REJECT LIMIT UNLIMITED;
```

```sql
CREATE OR REPLACE DIRECTORY ext_football_data as '/home/oracle/Desktop/lab10/partb';
GRANT read, write on directory ext_football_data to exercise10;

CREATE TABLE  football_ext(
    player_id       VARCHAR2(5),
    player_number   VARCHAR2(5),
    player_lname    VARCHAR2(50),
    player_fname    VARCHAR2(50),
    player_position VARCHAR2(10),
    player_team     VARCHAR2(5)
)
ORGANIZATION EXTERNAL
(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY ext_football_data
    ACCESS PARAMETERS
    (
        RECORDS DELIMITED BY NEWLINE
        FIELDS TERMINATED BY ','
        MISSING FIELD VALUES ARE NULL
        (
            player_id       Char(5),
            player_number   Char(5),
            player_lname    Char(50),
            player_fname    Char(50),
            player_position Char(10),
            player_team     Char(5)
        )
    )
LOCATION('football.dat')
)
REJECT LIMIT UNLIMITED;

```
