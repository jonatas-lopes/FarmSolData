CREATE OR REPLACE PROCEDURE PCR_ENTRADA_ESTOQUE(vid in integer, vquant in number)
IS
v integer;  
BEGIN
             
           
            SELECT id_medicamentos 
            into  
            v
            FROM estoque
            WHERE id_medicamentos = vid
            and exists (select 1 from estoque where id_medicamentos = vid);
            
            if v <> 0 then
            UPDATE ESTOQUE SET
            QUANTIDADE = QUANTIDADE + vquant     
            WHERE ID_MEDICAMENTOS = v;
            end if;
            
 EXCEPTION 
    WHEN NO_DATA_FOUND THEN
       
        INSERT INTO ESTOQUE VALUES(sqn_estoque.nextval,vid,vquant,sysdate);           
   
      
                 
   
          
END;                     
        
            
    
                 
 
                   
           
         
       
      
           
         
           
              
        
                   
           
                 
            
                           
             
          
   
/
