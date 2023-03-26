CREATE OR REPLACE PROCEDURE log_usage (
    p_card_id NUMBER
  , p_loc NUMBER
) IS
    PRAGMA autonomous_transaction;
BEGIN
    INSERT INTO log_table (
        card_id
      , location
      , tran_date
    ) VALUES (
        p_card_id
      , p_loc
      , sysdate
    );
    COMMIT;
END log_usage;
CREATE OR REPLACE PROCEDURE atm_trans(p_cardnbr NUMBER, p_loc NUMBER) IS
BEGIN
    log_usage(p_cardnbr, p_loc);
    IF withdrawal_fail THEN
        ROLLBACK;
    END IF;
END atm_trans;