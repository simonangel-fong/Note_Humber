-- : Enforcing Complex Data Integrity Rules

CREATE OR REPLACE TRIGGER check_sal_trigger BEFORE
    UPDATE OF job_id ON copy_emp FOR EACH ROW
DECLARE
    v_job_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_job_count
    FROM job_history
    WHERE employee_id = :old.employee_id
        AND job_id = :new.job_id;
    IF v_job_count >0 THEN
        raise_application_error(-20201, 'This employee has already done this job');
    END IF;
END;