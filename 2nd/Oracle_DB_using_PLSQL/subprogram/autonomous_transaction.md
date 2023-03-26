# Oracle Autonomous Transaction

[Back](../index.md)

- [Oracle Autonomous Transaction](#oracle-autonomous-transaction)
  - [Autonomous Transaction](#autonomous-transaction)

---

## Autonomous Transaction

- A single connected session can have **more than one** active transaction at a time.

- `Autonomous Transaction`: allow a session to have two or more active transactions at the same time.

- The `autonomous transaction (AT)` is called from within the `main transaction (MT)`.

- `PRAGMA AUTONOMOUS_TRANSACTION`: declare a subprogram is an `autonomous transaction`.

  - must end with a semicolon `;`,
  - and comes **after** `IS/AS`.

- Example:

  ```sql
  -- Autonomous Transaction
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


  -- Main Transaction
  CREATE OR REPLACE PROCEDURE atm_trans(p_cardnbr NUMBER, p_loc NUMBER) IS
  BEGIN
      log_usage(p_cardnbr, p_loc);
      IF withdrawal_fail THEN
          ROLLBACK;
      END IF;
  END atm_trans;

  ```

---

[Top](#oracle-autonomous-transaction)
