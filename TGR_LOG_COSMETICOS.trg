CREATE OR REPLACE TRIGGER TGR_LOG_COSMETICOS
AFTER INSERT OR UPDATE OR DELETE ON COSMETICOS FOR EACH ROW

BEGIN
      IF INSERTING THEN
        INSERT INTO COSMETICOS_LOG VALUES(SQN_LOG_COSMETICOS.NEXTVAL,SYSDATE,'I',USER);
      END IF;

      IF UPDATING THEN
        INSERT INTO COSMETICOS_LOG VALUES(SQN_LOG_COSMETICOS.NEXTVAL,SYSDATE,'U',USER);
      END IF;

      IF DELETING THEN
        INSERT INTO COSMETICOS_LOG VALUES(SQN_LOG_COSMETICOS.NEXTVAL,SYSDATE,'D',USER);
      END IF;
END;
/