const express = require('express');
const Role = require('../../models/RBACModel/t_user_role');
const User = require('../../models/AuthenticationModel/userModel');
const Permission = require('../../models/RBACModel/t_user_permission');
const RoleWisePermission = require('../../models/RBACModel/t_assign_role_permission_mapping');
const UserWiseRole = require('../../models/RBACModel/t_assign_user_role__mapping');
const CustomError = require('../../errorHandling/customError');

/**
 * ----------------------------------
 * This method is responsible for the add user role.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 23/05/24
*/
const addRole = async (req, res) => {
    let requestData = req.body;
    let Data = {};
    if(requestData.roleName) Data.name = requestData.roleName;
    const saveId = await Role.insertRoleDetails(Data); 
    res.status(200).json({ message: 'Role Deatails inserted successfully', saveId });
}


/**
 * ----------------------------------
 * This method is responsible for the add user role.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 23/05/24
*/
const addPermission = async (req, res) => {
    let requestData = req.body;
    let Data = {};
    if(requestData.permissionName) Data.name = requestData.permissionName;
    const saveId = await Permission.insertPermissionDetails(Data); 
    res.status(200).json({ message: 'Permission Deatails inserted successfully', saveId });
}


/**
 * ----------------------------------
 * This method is responsible for the Assign user With Role.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 28/05/24
*/
const assignUserWithRole = async (req, res) => {
    try{
        let requestData = req.body;
        let UserId = requestData.UserId;
        let roleId = requestData.roleId;
        if (!roleId || !UserId) {
            throw new CustomError("Userid and Role id are required.", 401);
        }
        let assignUserWithMultipleRole = roleId.map(id =>{
            return {
                user_id:UserId,
                role_id:id
            }
        })
        const saveId = await UserWiseRole.insertUserWiseRole(assignUserWithMultipleRole);
        res.status(200).json({ message: 'User Wise Role details inserted successfully', saveId });
    }catch (error) {
        res.status(error.statusCode || 500).json({
            status: 'false',
            message: error.message || "Internal server error",
        });
    }
}


/**
 * ----------------------------------
 * This method is responsible for the Fetch User wise Role.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 29/05/24
*/
const fetchUserRole = async(req, res) =>{
    try {
        let requestData = req.body;
        let userId = requestData.userId;
        if (!userId) {
            throw new CustomError("User id is required.", 401);
        }
        let getUserData = await User.userDetailsBasedOnUserId(userId);
        if(getUserData == null){
            throw new CustomError("User id not found.", 404);
        }
        let getUserWiseRoleData = await UserWiseRole.fetchUserWiseRole(getUserData.id);
        let getRoleId = getUserWiseRoleData.map(data => data.role_id);
        console.log(getRoleId);
        let getRoleName = await Role.getRoleDataBasedOnData(getRoleId);
        let userRoleDetails = {
            "UserId":getUserData.id,
            "UserName":getUserData.firstName +' '+ getUserData.lastName,
            "RoleDetails":getRoleName,
        }
        res.status(200).json({ message: 'User Wise Role details', userRoleDetails });
    }catch (error) {
        res.status(error.statusCode || 500).json({
            status: 'false',
            message: error.message || "Internal server error",
        });
    }
}


/**
 * ----------------------------------
 * This method is responsible for the Fetch User Wise Role And Permission.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 29/05/24
*/
const fetchUserWiseRoleAndPermission = async(req, res) =>{
    try{
        let requestData = req.body;
        let userId = requestData.userId;
        if (!userId) {
            throw new CustomError("User id is required.", 401);
        }
        let getUserData = await User.userDetailsBasedOnUserId(userId);//Here i get all User Details
        let getRoleWisePermissionData = await RoleWisePermission.getDataBasedOnRoleId(getUserData['user_role']);//Here i get all Role wise permission details based on role id
        let getRoleData = getRoleWisePermissionData.map(item => item.role_id);//Here i group the role id
        let uniqueRoleId = [... new Set(getRoleData)] //Here i get Unique array
        let getRoleDetails = await Role.getRoleDataBasedOnData(uniqueRoleId);//Here i get Role details based on role id
        let userDetails = {
            UserId: getUserData.id,
            UserName: getUserData.firstName + " " + getUserData.lastName,
            RoleDetails: getRoleDetails,
            permissions: [] // Initialize permissions array here
        };
        let getUserPermissionDetails = getRoleWisePermissionData.map(async(data) => {
            let getRoleWisePermissionData = await Permission.getDataBasedOnRoleId(data.permission_id);
            getRoleWisePermissionData.forEach((item) => {
                userDetails.permissions.push(item.dataValues);
            });
        });
        let permissionDetails = await Promise.all(getUserPermissionDetails);
        res.status(200).json({ message: 'User Wise Role And Permission details', userDetails });
    }catch (error) {
        res.status(error.statusCode || 500).json({
            status: 'false',
            message: error.message || "Internal server error",
        });
    }
}


/**
 * ----------------------------------
 * This method is responsible for the Assign user role With Permission.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 28/05/24
*/
const assignRolePermission = async (req, res) => {
    try {
        let requestData = req.body;
        let roleId = requestData.roleId;
        let permissionIds = requestData.permissionIds;
        if (!roleId || !permissionIds) {
            throw new CustomError("Role id and permission id are required.", 401);
        }
        let roleWisePermissionMapping = permissionIds.map(permissionId => {
            return {
                role_id:roleId,
                permissionId:permissionId
            }
        });
        const saveId = await RoleWisePermission.insertRoleWisePermission(roleWisePermissionMapping);
        res.status(200).json({ message: 'Role Wise Permission details inserted successfully', saveId });
  
    } catch (error) {
        res.status(error.statusCode || 500).json({
            status: 'false',
            message: error.message || "Internal server error",
        });
    }
    
}

/**
 * ----------------------------------
 * This method is responsible for the Fetch user role With Permission.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 28/05/24
*/
const fetchRolePermission = async(req, res) =>{
    try {
        let requestData = req.body;
        let roleId = requestData.roleId;
        if (!roleId) {
            throw new CustomError("Role id is required.", 401);
        }
        let getRoleData = await Role.getRoleDataBasedOnData(roleId);
        // console.log(roleId);
        if(getRoleData == ""){
            throw new CustomError("Role id not found.", 404);
        }
        let getPermissionData = await Permission.getPermissionData();
        let getRoleWisePermissionData = await RoleWisePermission.getDataBasedOnRoleId(roleId);
        let permissionIds = getRoleWisePermissionData.map(item =>item.permission_id);//By using map we get all the permission ids
        let getPermissionList = permissionIds.map(item =>{
            let matchPermission = getPermissionData.find(permissionData => permissionData.id === item);
            return matchPermission ? { id: matchPermission.id, name: matchPermission.name } : null;
        })
        let rolePermissionDetails = {
            "RoleId":getRoleData[0].id,
            "RollName":getRoleData[0].name,
            "Permission":getPermissionList,
        }
        res.status(200).json({ message: 'Role Wise Permission details', rolePermissionDetails });
    }catch (error) {
        res.status(error.statusCode || 500).json({
            status: 'false',
            message: error.message || "Internal server error",
        });
    }
}

/**
 * ----------------------------------
 * This method is responsible for the Edit user role With Permission.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 28/05/24
*/
const editRolePermission = async(req, res) =>{
    try {
        let requestData = req.body;
        let roleId = requestData.roleId;
        let permissionIds = requestData.permissionIds;
        if (!roleId || !permissionIds) {
            throw new CustomError("Role id and permission id are required.", 401);
        }
        let getRoleData = await Role.getRoleDataBasedOnData(roleId);
        if(getRoleData == ""){
            throw new CustomError("Role id not found.", 404);
        }
        let deleteRolePermission = RoleWisePermission.deleteRoleWisePermission(roleId);
        if(deleteRolePermission){
            let roleWisePermissionMapping = permissionIds.map(permissionId => {
                return {
                    role_id:roleId,
                    permissionId:permissionId
                }
            });
            const saveId = await RoleWisePermission.insertRoleWisePermission(roleWisePermissionMapping);
            res.status(200).json({ status: 'true', message: 'Permission details update successfully', saveId });
        }
    }catch (error) {
        res.status(error.statusCode || 500).json({
            status: 'false',
            message: error.message || "Internal server error",
        });
    }
}

module.exports = {
    addRole,
    addPermission,
    assignRolePermission,
    fetchRolePermission,
    editRolePermission,
    assignUserWithRole,
    fetchUserRole,
    fetchUserWiseRoleAndPermission
};

