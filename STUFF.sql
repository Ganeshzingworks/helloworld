SELECT DISTINCT     tblTestMaster.TestNo AS TestNo, tblTestMaster.TestName AS Test, tblFinishGoodDetails.Frequency AS Frequency, 
                      tblFinishGoodDetails.InspectionMethod AS InspectionMethod
FROM         tblTestMaster INNER JOIN
                      tblFinishGoodDetails ON tblTestMaster.TestNo = tblFinishGoodDetails.TestNo INNER JOIN
                      tblPkgFamilyMaster ON tblFinishGoodDetails.PKGTechNo = tblPkgFamilyMaster.PKGTechNo
WHERE    ((Del = 0) OR (DEL IS NULL)) AND   (tblPkgFamilyMaster.PKGTechNo ='74' )


select  * from tblFinishGoodDetails where PKGTechNo='74' and ((Del = 0) OR (DEL IS NULL))

select * from tblPkgFamilyMaster ---Packing Techinical Family Master

select * from tblBulkMaster where FormulaNo='G123' --Formula Master

select * from tblBulkPhysicochemicalTestMethodMaster  where FNo='1136' 

select * from tblBulkTestTransaction where InspDate='9-jan-2023'

select * from tblBulkPhysicochemicalTestMethodDetails


--Concatenate Multiple Rows Into Single String

select distinct TechFamDesc from tblPkgFamilyMaster

select NAMES=STUFF ((select ','+ TechFamDesc from tblPkgFamilyMaster FOR XML path('') ),1,1,'')  

SELECT NAMES=SUBSTRING(
    ( SELECT ','+ TechFamDesc from tblPkgFamilyMaster  FOR XML PATH('')), 2, 200000)

	declare @NAMES nvarchar(1000)
SELECT @NAMES = COALESCE(@NAMES + ',', '')+TechFamDesc FROM tblPkgFamilyMaster
select @NAMES

select STRING_AGG(TechFamDesc, ',') from tblPkgFamilyMaster --2017  --GROUP_CONCAT 
