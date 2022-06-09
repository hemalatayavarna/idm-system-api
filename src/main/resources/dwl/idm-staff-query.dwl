%dw 2.0
output application/java
---
"SELECT DISTINCT [Employee_ID]
	,[Title]
	,[First_Names]
	,[Last_Name]
	,[Preferred_Name]
	,[Gender_ID]
	,[Main_Org_Unit_ID]
	,[Main_Role_ID]
	,[Main_Position_ID]
	,[Main_Org_Unit_Name]
	,[Main_Role_Name]
	,[Main_Position_Name]
	,[Work_Email_1]
	,[Work_Phone]
	,[Work_Mobile]
	,[IsDepartmentScope]
	,[IsExternal]
	,[IsActive]
	,[Last_Changed_Date]
FROM [dbo].[vw_IDM_INTEGRATION_EMPLOYEE]
WHERE 1=1 AND [Last_Changed_Date] >= ISNULL($(lastChangedDate),Last_Changed_Date)
AND [IsActive] = ISNULL($(isActive), IsActive)
AND [Main_Org_Unit_ID] = ISNULL($(orgUnitId), Main_Org_Unit_ID)
ORDER BY [Employee_ID]
OFFSET $(vars.offset) ROWS FETCH NEXT $(vars.limit) ROWS ONLY"