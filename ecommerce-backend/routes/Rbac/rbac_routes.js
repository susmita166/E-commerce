const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const { addRole, addPermission, assignRolePermission, fetchRolePermission, editRolePermission, assignUserWithRole, fetchUserRole, fetchUserWiseRoleAndPermission } = require('../../Controller/RBAC/rbac_controller'); 
const {authenticateToken} = require('../../middlewares/auth_middleware');

router.post('/addRole', authenticateToken, addRole);
router.post('/addPermission', authenticateToken, addPermission);
router.post('/assignRolePermission', authenticateToken, assignRolePermission);
router.get('/fetchRolePermission', authenticateToken, fetchRolePermission);
router.post('/editRolePermission', authenticateToken, editRolePermission);
router.post('/assignUserWithRole', authenticateToken, assignUserWithRole);
router.get('/fetchUserRole', authenticateToken, fetchUserRole);
router.get('/fetchUserWiseRoleAndPermission', authenticateToken, fetchUserWiseRoleAndPermission);

module.exports = router;
