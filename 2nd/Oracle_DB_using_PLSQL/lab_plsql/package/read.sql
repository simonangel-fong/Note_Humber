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