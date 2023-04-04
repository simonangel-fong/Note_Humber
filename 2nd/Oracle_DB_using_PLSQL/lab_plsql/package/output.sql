-- package: dbms_output

DECLARE
BEGIN
 -- send a line of message from a block into a buffer, then displays
    dbms_output.put_line('The cat sat on the mat');
 -- send a message from a block into a buffer, then displays
    dbms_output.put('The cat sat ');
    dbms_output.put('on the mat');
 -- retrieves a single line of buffered information
    dbms_output.new_line;

    
    dbms_output.put_line('The cat sat on the mat');

    dbms_output.new_line;
END;