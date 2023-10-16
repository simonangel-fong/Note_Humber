# Warehouse - Storage

[Back](../index.md)

- [Warehouse - Storage](#warehouse---storage)
  - [Tablespaces](#tablespaces)
  - [Default Tablespace](#default-tablespace)
  - [Syntax](#syntax)
    - [List all tablespace](#list-all-tablespace)
    - [List all datafile with tablespace](#list-all-datafile-with-tablespace)
    - [Create Tablespace](#create-tablespace)
    - [Drop Tablespace](#drop-tablespace)
    - [Drop Tablespace and Datafiles](#drop-tablespace-and-datafiles)
    - [Drop Datafiles/Tempfiles](#drop-datafilestempfiles)
    - [Offline/Online Tablespace](#offlineonline-tablespace)
    - [Read-only / Read Write Tablespace](#read-only--read-write-tablespace)
    - [Rename Tablespace](#rename-tablespace)
    - [Example: Multiple datafiles](#example-multiple-datafiles)

---

## Tablespaces

- Tablespaces can be
  - Bigfile / smallfile
  - **System managed** extents or **user managed** extents
  - Automatic segment space management

---

- tbsp vs data file

- The database’s data is stored

  - **logically** in `tablespaces` and
  - **physically** in `data files` that correspond to the tablespaces.

- The **logical storage** management is **independent** of the **physical storage** of the data files.

---

## Default Tablespace

- The `SYSTEM` and `SYSAUX` tablespaces are **mandatory** tablespaces that are created at the time of database creation.
- They must be **online**.
- The `SYSTEM tablespace`

  - used for **core functionality** (for example, data dictionary tables).
  - should **not** be used to **store schema objects** other than those that the installation places there.

- The auxiliary `SYSAUX tablespace`

  - used for **additional** database components.
  - stores **schema objects** associated with _Oracle-provided features_.

- The `SYSTEM` and `SYSAUX` tablespaces should **not** be used for **application data.**

---

## Syntax

### List all tablespace

- List all tbsp from the control file.

```sql
SELECT * FROM v$tablespace;
```

---

### List all datafile with tablespace

```sql
# list all datafile
SELECT name, create_time, status, enable FROM v$datafile;

# list all tempfile
SELECT * FROM v$tempfile;

# list all datafile with tbsp
SELECT * FROM dba_data_files;

# list all tempfile with tbsp
SELECT * FROM dba_temp_files;
```

---

### Create Tablespace

```sql
CREATE TABLESPACE  tbsp_name
DATAFILE '/home/oracle/app/oracle/oradata/orcl/tbsp_name01.dbf'
SIZE 20m;

```

---

### Drop Tablespace

- Drop tablespace
  - no rollback.
  - not automatically remove data file.
  - System tbsp cannot drop.

```sql
DROP TABLESPACE tbsp_name;
```

- If the tbsp is not empty, should use recursively remove any segments.

```sql
DROP TABLESPACE tbsp_name INCLUDING CONTENTS CASCADE CONSTRAINTS;
```

---

### Drop Tablespace and Datafiles

- Dropping a tablespace **does not automatically** remove the `data files` from the file system.

  - If the `Oracle Managed Files` **feature** is used for the tablespace, such files will be removed **automatically** when you drop the tablespace.

```sql
DROP TABLESPACE tbsp_name INCLUDING CONTENTS AND DATAFILES;
```

---

### Drop Datafiles/Tempfiles

- drop a single datafile or tempfile
  - The datafile must be empty.

```sql
ALTER TABLESPACE tbsp_name DROP DATAFILE
'/u01/app/oracle/oradata/ORCLCDB/tbsp_name01.dbf'
```

- Restrictions for Dropping Datafiles
  - The `database` must be **open**.
  - If a datafile is not empty, it cannot be dropped.
    - If you must remove a datafile that is **not empty** and that cannot be made empty by dropping schema objects, you must **drop the tablespace** that contains the datafile.
  - You cannot drop the first or only datafile in a tablespace.不能第一或唯一.
    - `DROP DATAFILE` cannot be used with a **bigfile** tablespace.因为 bigfile 只有一个 datafile
  - **cannot** drop datafiles in a **read-only** tablespace.
  - **cannot** drop datafiles in the `SYSTEM` tablespace.

---

### Offline/Online Tablespace

```sql
# tbsp
ALTER TABLESPACE tbsp_name OFFLINE;
ALTER TABLESPACE tbsp_name ONLINE;

# datafile
ALTER TABLESPACE DATAFILE '/u01/oracle/ica/ica_tbs01.dbf' OFFLINE;
ALTER TABLESPACE DATAFILE '/u01/oracle/ica/ica_tbs01.dbf' ONLINE;
```

---

### Read-only / Read Write Tablespace

```sql
ALTER TABLESPACE tbsp_name READ ONLY;
ALTER TABLESPACE tbsp_name READ WRITE;
```

---

### Rename Tablespace

```sql
ALTER TABLESPACE old_name RENAME TO new_name;
```

---

### Example: Multiple datafiles

```sql
# create tbsp
CREATE TABLESPACE prod_data
DATAFILE '/home/oracle/app/oracle/oradata/orcl/proddata_01.dbf'
SIZE 100m;

# add datafile
ALTER TABLESPACE prod_data
ADD DATAFILE '/home/oracle/app/oracle/oradata/orcl/proddata_02.dbf'
SIZE 100m;
```

---

[TOP](#warehouse---storage)
