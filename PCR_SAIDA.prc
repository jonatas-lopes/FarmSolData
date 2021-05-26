CREATE OR REPLACE PROCEDURE PCR_SAIDA( vidp in number, vidm in number, vquant in number)
IS

VEXCEPTION EXCEPTION;

BEGIN
  FOR EST IN(
       SELECT E.* FROM ESTOQUE E
       WHERE ID_MEDICAMENTOS = vidm

    )
  LOOP
     IF VQUANT <= EST.QUANTIDADE THEN
       
       INSERT INTO SAIDAS VALUES ( sqn_saidas.nextval
                                  ,vidp
                                  ,vidm
                                  ,sysdate
                                  ,vquant );
                                  
       
        UPDATE ESTOQUE SET
          QUANTIDADE = QUANTIDADE - vquant
          WHERE ID_MEDICAMENTOS = vidm;                           
                                  
                                  
    ELSE
      RAISE VEXCEPTION;
    END IF;
  END LOOP;
EXCEPTION
   WHEN VEXCEPTION THEN
     RAISE_APPLICATION_ERROR(-20999,'SEM ESTOQUE SUFICIENTE');

END;
/
