--Demo: multiple cursor

-- Example1:
DECLARE
    CURSOR cur_dep IS
        SELECT
            department_name
          , department_id
        FROM
            departments
        ORDER BY
            department_name;
    CURSOR cur_emp(v_dep_id departments.department_id%type) IS
        SELECT
            first_name
          , last_name
        FROM
            employees
        WHERE
            department_id = v_dep_id
        ORDER BY
            last_name;
BEGIN
    <<deparment>>
    FOR v_rec_dep IN cur_dep LOOP
        <<employee>>
        FOR v_rec_emp IN cur_emp(v_rec_dep.department_id) LOOP
            dbms_output.put_line(v_rec_dep.department_name||' - ' || v_rec_emp.first_name||' '||v_rec_emp.last_name);
        END LOOP employee;
    END LOOP deparment;
END;

/

-- Example2:
DECLARE
    CURSOR cur_loc IS
        SELECT
            location_id
          , street_address
          , city
        FROM
            locations
        ORDER BY
            city;

    CURSOR cur_dep(v_loc_id locations.location_id%type) IS
        SELECT
            department_name
        FROM
            departments
        WHERE
            location_id = v_loc_id
        ORDER BY
            department_name;
BEGIN
    <<loation>>
    FOR v_rec_loc IN cur_loc LOOP
        <<department>>
        FOR v_rec_dep IN cur_dep(v_rec_loc.location_id) LOOP
            dbms_output.put_line(v_rec_loc.street_address||', ' || v_rec_loc.city||' - '||v_rec_dep.department_name);
        END LOOP department;
    END LOOP loation;
END;