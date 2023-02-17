--Demo: explicit cursor for update

-- Syntax: cursor for update

DECLARE
    CURSOR cursor_name IS
        SELECT column_name
        FROM table_name FOR UPDATE OF column_reference NOWAIT;
BEGIN
 -- open cursor
END;

 -- Syntax: FOR UPDATE OF column-name
DECLARE
    CURSOR cursor_name IS
        SELECT col_1
          , col_2
        FROM tb_1 t1
          , tb_2 t2
        WHERE tb_1.pk = tb_2.pk FOR UPDATE OF t1.col_2 NOWAIT; --tb_1 is lock
BEGIN
 -- open cursor
END;