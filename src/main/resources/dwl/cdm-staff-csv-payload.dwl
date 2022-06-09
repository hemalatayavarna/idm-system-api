%dw 2.0
import * from modules::CommonFunctions
output application/csv quoteValues = true
---
payload map ( item , index ) -> {
	employeeId: item.Employee_ID default "",
	firstName: item.First_Names default "",
	lastName: item.Last_Name default "",
	preferredName: item.Preferred_Name default "",
	salutation: item.Title default "",
	workEmail: item.Work_Email_1 default "",
	workPhone: item.Work_Phone default "",
	workMobile: item.Work_Mobile default "",
	mainPositionId: item.Main_Position_ID default "",
	mainPositionName: item.Main_Position_Name default "",
	mainRoleId: item.Main_Role_ID default "",
	mainRoleName: item.Main_Role_Name default "",
	gender: setGender(item.Gender_ID) default "",
	isExternal: setTrueOrFalse(item.IsExternal) default "",
	mainOrgUnitId: item.Main_Org_Unit_ID default "",
	mainOrgUnitName: item.Main_Org_Unit_Name default "",
	isDepartmentScope: item.IsDepartmentScope default "",
	isActive: setTrueOrFalse(item.IsActive) default "",
	lastUpdatedOn: item.IDE_Last_Changed_Date default "",
	positionName: item.orgUnitName default "",
	roleName: item.Role_Name default "",
	orgUnitId: item.Org_Unit_ID default "",
	orgUnitName: item.Org_Unit_Name default "",
	orgStartDate: item.Org_Start_Date default "",
	orgEndDate: item.Org_End_Date default "",
	isMainSite: setTrueOrFalse(item.IsMainSite) default "",
	idesLastUpdatedOn: item.IDES_Last_Changed_Date default ""
}
