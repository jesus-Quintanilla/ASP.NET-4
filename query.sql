SELECT Friends_2.Friend_E_Mail AS email, LEFT (email, INSTR(email, '@') - 1) AS Member

, LEFT (email, INSTR(email, '@') - 1) AS Name     

FROM (Members INNER JOIN Friends Friends_2 ON Members.E_Mail = Friends_2.My_E_Mail) 

WHERE (Friends_2.My_E_Mail = ?) AND (Friends_2.Friend_E_Mail <> ?) 

UNION ALL 

SELECT Friends_2.My_E_Mail AS email, LEFT (email, INSTR(email, '@') - 1) 
AS Member, LEFT (email, INSTR(email, '@') - 1) AS Name 

FROM (Members Members_1 INNER JOIN Friends Friends_2 ON Members_1.E_Mail = Friends_2.My_E_Mail) 

WHERE (Friends_2.Friend_E_Mail = ?) AND (Friends_2.My_E_Mail <> ?)
