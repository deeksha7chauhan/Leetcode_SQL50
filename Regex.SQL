#1527. Patients With a Condition
#Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.
select patient_id,patient_name,conditions from Patients where conditions like 'DIAB1%'  or  conditions like '% DIAB1%' ;
#### % is a wildcard, meaning "any characters after".
#### conditions LIKE '% DIAB1%'This matches any condition where DIAB1 is not at the beginning, but appears with a space before it.The % before and after allows any text around DIAB1
