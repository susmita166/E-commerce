'use strict';
const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../index');

class t_user_permission extends Model {
    static async insertPermissionDetails(data) {
      try {
        const saveData = await t_user_permission.create(data);
        console.log("Here is the auto-generated ID:", saveData.id);
        return saveData.id;
      } catch (error) {
        console.error("Error inserting Permission details:", error);
        throw error;
      }
    }

    static async getPermissionData() {
      try {
          let getRecord = this.findAll({ order: [['id', 'ASC']],attributes: {exclude: [ 'createdAt', 'updatedAt']}});
          return getRecord;
      } catch (error) {
          console.error("Error mapping Role With Permission:", error);
          throw error;  
      }
    }

    static async getDataBasedOnRoleId(permissionId) {
      try {
        let roleIds = Array.isArray(permissionId) ? permissionId : [permissionId];
        let getRecord = this.findAll({
          // order: [['permission_id', 'ASC']],
           where: {
             id : permissionId
           },
           attributes: {exclude: ['createdAt', 'updatedAt']}
        });
        return getRecord;
      } catch (error) {
        console.error("Error mapping Role With Permission:", error);
        throw error;
      }
    }
}

t_user_permission.init({
    name: DataTypes.STRING
},{
    sequelize,
    modelName: 't_user_permission',
});

module.exports = t_user_permission;
