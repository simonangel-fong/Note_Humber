-- bodiless package

CREATE OR REPLACE PACKAGE lab_bodiless_pkg IS
    c_pi CONSTANT NUMBER( 3, 2 ) :=3.14;
END;
/

DECLARE
    v_radius NUMBER :=2;
BEGIN
    dbms_output.put_line('Area: '||v_radius*v_radius*lab_bodiless_pkg.c_pi);
END;