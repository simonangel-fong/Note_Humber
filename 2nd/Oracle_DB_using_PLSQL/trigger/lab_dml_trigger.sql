-- example: enforce complex business rules that cannot be enforced by a constraint.

CREATE OR REPLACE TRIGGER secure_emp BEFORE
    INSERT ON employees
BEGIN
    IF to_char(sysdate, 'DY') IN ('SAT', 'SUN') THEN
        raise_application_error(-20500, 'You may insert into EMPLOYEES table only during
business hours');
    END IF;
END;
/