%dw 2.0
import * from modules::CommonFunctions
output application/json
---
payload groupBy ((item, index) -> item.Employee_ID) pluck ((value, key, index) -> {
	employeeId: value.Employee_ID distinctBy value.Employee_ID reduce value + value.Employee_ID default "",
	firstName: value.First_Names distinctBy value.First_Names reduce value + value.First_Names
    default "",
	lastName: value.Last_Name distinctBy value.Last_Name reduce value  default "",
	preferredName: value.Preferred_Name distinctBy value.Preferred_Name reduce value default "",
	salutation: value.Title distinctBy value.Title reduce value default "",
	workEmail: value.Work_Email_1 distinctBy value.Work_Email_1 reduce value default "",
	workPhone: value.Work_Phone distinctBy value.Work_Phone reduce value default "",
	workMobile: value.Work_Mobile distinctBy value.Work_Mobile reduce value default "",
	mainPositionId: value.Main_Position_ID distinctBy value.Main_Position_ID reduce value default "",
	mainPositionName: value.Main_Position_Name distinctBy value.Main_Position_Name reduce value default "",
	mainRoleId: value.Main_Role_ID distinctBy value.Main_Role_ID reduce value default "",
	mainRoleName: value.Main_Role_Name distinctBy value.Main_Role_Name reduce value default "",
	gender: setGender(value.Gender_ID distinctBy value.Gender_ID reduce value) default "",
	isExternal: setTrueOrFalse(value.IsExternal distinctBy value.IsExternal reduce value) default "",
	mainOrgUnitId: value.Main_Org_Unit_ID distinctBy value.Main_Org_Unit_ID reduce value default "",
	mainOrgUnitName: value.Main_Org_Unit_Name distinctBy value.Main_Org_Unit_Name reduce value default "",
	isDepartmentScope: value.IsDepartmentScope distinctBy value.IsDepartmentScope reduce value default "",
	isActive: setTrueOrFalse(value.IsActive distinctBy value.IsActive reduce value) default "",
	lastUpdatedOn: value.IDE_Last_Changed_Date distinctBy value.IDE_Last_Changed_Date reduce value default "",
	roles: value map ((item, index) -> {
		roleName: item.Role_Name default "",
		positionName: item.Position_Name default "",
		orgUnitId: item.Org_Unit_ID default "",
		orgUnitName: item.Org_Unit_Name default "",
		orgStartDate: item.Org_Start_Date default "",
		orgEndDate: item.Org_End_Date default "",
		isMainSite: setTrueOrFalse(item.IsMainSite) default "",
		idesLastUpdatedOn: item.IDES_Last_Changed_Date default ""
	})
})
