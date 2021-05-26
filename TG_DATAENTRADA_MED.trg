CREATE OR REPLACE TRIGGER TG_DATAENTRADA_MED
       BEFORE INSERT ON MEDICAMENTOS FOR EACH ROW
       
BEGIN
              IF :NEW.DATACADASTRO IS NULL THEN
                SELECT SYSDATE
                INTO :NEW.DATACADASTRO
                FROM DUAL;
              END IF;

        END;
/