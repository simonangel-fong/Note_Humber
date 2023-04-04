# PLSQL Oracle-Supplied Packages

[Back](../index.md)

- [PLSQL Oracle-Supplied Packages](#plsql-oracle-supplied-packages)
  - [Oracle-Supplied Packages](#oracle-supplied-packages)
  - [DBMS\_OUTPUT Package](#dbms_output-package)
  - [UTL\_FILE Package](#utl_file-package)
  - [UTL\_MAIL Package](#utl_mail-package)

## Oracle-Supplied Packages

- List of Some Oracle-Supplied Packages

  | Tab              | Function                                                                                            |
  | ---------------- | --------------------------------------------------------------------------------------------------- |
  | `DBMS_LOB`       | Enables manipulation of Oracle Large Object column datatypes: CLOB, BLOB and BFILE                  |
  | `DBMS_LOCK`      | Used to request, convert, and release locks in the database through Oracle Lock Management services |
  | `DBMS_OUTPUT`    | Provides debugging and buffering of messages                                                        |
  | `HTP`            | Writes HTML-tagged data into database buffers                                                       |
  | `UTL_FILE`       | Enables reading and writing of operating system text files                                          |
  | `UTL_MAIL`       | Enables composing and sending of e-mail messages                                                    |
  | `DBMS_SCHEDULER` | Enables scheduling of PL/SQL blocks, stored procedures, and external procedures or executables      |

---

## DBMS_OUTPUT Package

- The `DBMS_OUTPUT` package **sends text messages** from any PL/SQL block into a private memory area, from which the message can be displayed on the screen.

- Common uses of DBMS_OUTPUT include:

  - output results back to the developer during testing for debugging purposes.
  - trace the code execution path for a function or procedure.

- `PUT`: places text in the buffer.
- `NEW_LINE` sends the buffer to the screen.
- `PUT_LINE` does a PUT followed by a NEW_LINE.
- `GET_LINE` and `GET_LINES` read the buffer.
- Messages are not sent until after the calling block finishes.

- should use `DBMS_OUTPUT` only in anonymous PL/SQL blocks **for testing purposes**

  - not use `DBMS_OUTPUT` in PL/SQL programs that are called from a “real” application, which can include its own application code to display results on the user’s screen.
  - Instead, you would return the text to be **displayed as an `OUT` argument** from the subprogram.使用 out 参数代替 dbms_output 包

---

## UTL_FILE Package

- Allows PL/SQL programs allow to **read, write, and manipulate** operating system files.

  - Can access text files in operating system directories defined by a `CREATE DIRECTORY` statement.

- The `UTL_FILE` package can be used only to manipulate **text files**, **NOT binary files**.

  - To read binary files (BFILES) the `DBMS_LOB` package is used.

- Procedure:

  - `.FOPEN(dir, file, 'r')`: open and read text file
  - `.FOPEN(dir, file, 'w')`: open and write text file
  - `.FOPEN(dir, file, 'a')`: open and append text file
  - `.GET_LINE(f, buf, len)`: reads a line of text from the file into an output buffer parameter.
    - The maximum input record size is 1,023 bytes.
  - `.PUT(f, buf)` / `.PUT_LINE(f, buf)`: write a text to the opened file
  - `.NEW_LINE`: terminates a line in an output file.
  - `.FCLOSE(f)`: close the file

- Exceptions

  - `INVALID_PATH`: if the file location or file name was invalid
  - `INVALID_MODE`: open_mode parameter was invalid
  - `INVALID_FILEHANDLE`: if the file handle was invalid
  - `INVALID_OPERATION`: if the file could not be opened or operated on
  - `READ_ERROR`: if an OS error occured during reading
  - `WRITE_ERROR`: if an OS error occured during writing
  - `INTERNAL_ERROR`:
  - `NO_DATA_FOUND`: (not specific to the UTL_FILE) raised when reading past the end of a file using GET_LINE(S).
  - `VALUE_ERROR`: (not specific to the UTL_FILE)

- Example:

```sql
-- read text file

CREATE OR REPLACE PROCEDURE lab_read(
    p_dir IN VARCHAR2
  , p_filename IN VARCHAR2
)IS
    v_file      utl_file.file_type;
    CURSOR cur_emp IS
        SELECT last_name
          , salary
          , department_id
        FROM employees
        ORDER BY department_id;
    v_newdeptno employees.department_id%type;
    v_olddeptno employees.department_id%type :=0;
BEGIN
    v_file := utl_file.fopen(p_dir, p_filename, 'w');
    utl_file.put_line(v_file, 'report: Generated ON'||sysdate());
    utl_file.new_line(v_file);
    utl_file.fclose(v_file);
    FOR rec_row IN cur_emp LOOP
        utl_file.put_line (v_file, ' EMPLOYEE: ' || rec_row.last_name || 'earns: ' || rec_row.salary);
    END LOOP;
    utl_file.put_line(v_file, '*** END OF REPORT ***');
    utl_file.fclose (v_file);
EXCEPTION
    WHEN utl_file.invalid_filehandle THEN
        dbms_output.put_line('Invalid File.');
    WHEN utl_file.write_error THEN -- 8
        dbms_output.put_line('Unable to write to file');
END;
/

BEGIN
    lab_read('MYDIR', 'salreport.txt');
END;
```

---

## UTL_MAIL Package

- The `UTL_MAIL` package allows sending email from the Oracle database to remote recipients.

- Contains three procedures:

  - `SEND` for messages without attachments
  - `SEND_ATTACH_RAW` for messages with binary attachments

    - The maximum size of a RAW file is 32,767 bytes, so you cannot use this to send a large JPEG, MP3, or WAV file.

  - `SEND_ATTACH_VARCHAR2` for messages with text attachments

---

[TOP](#plsql-oracle-supplied-packages)
