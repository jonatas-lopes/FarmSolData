CREATE OR REPLACE TRIGGER TG_DATAENTRADA_ESTOQUE
BEFORE INSERT ON ESTOQUE FOR EACH ROW
       
BEGIN
         IF :NEW.DATAENTRADA IS NULL THEN
            SELECT SYSDATE
            INTO :NEW.DATAENTRADA
            FROM DUAL;
         END IF;
END;
/
