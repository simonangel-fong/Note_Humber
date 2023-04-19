-- conditional predicate

DROP TRIGGER secure_emp;

CREATE OR REPLACE TRIGGER secure_emp BEFORE
    INSERT OR UPDATE OR DELETE ON employees
BEGIN
    IF to_char(sysdate, 'DY') IN ('SAT', 'SUN') THEN
        IF deleting THEN
            raise_application_error (-20501, 'You may delete from EMPLOYEES table only during business hours');
        ELSIF inserting THEN
            raise_application_error (-20502, 'You may insert into EMPLOYEES table only during business hours');
        ELSIF updating THEN
            raise_application_error (-20503, 'You may update EMPLOYEES table only during business hours');
        END IF;
    END IF;
END;
/

DROP TRIGGER secure_emp;

CREATE OR REPLACE TRIGGER secure_emp BEFORE
    UPDATE ON employees
BEGIN
    IF updating('SALARY') THEN
        IF to_char(sysdate, 'DY') IN ('SAT', 'SUN') THEN
            raise_application_error (-20501, 'You may not update SALARY on the weekend');
        END IF;
    ELSIF updating('JOB_ID') THEN
        IF to_char(sysdate, 'DY') = 'SUN' THEN
            raise_application_error (-20502, 'You may not update JOB_ID on Sunday');
        END IF;
    END IF;
END;
/

