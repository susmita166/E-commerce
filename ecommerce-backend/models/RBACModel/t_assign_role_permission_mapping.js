'use strict';
const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../index');

class t_assign_role_permission_mapping extends Model {
    static async insertRoleWisePermission(mappingData) {
        try {
          let insertRecord = await Promise.all(mappingData.map(item =>{
            return this.create({
                role_id: item.role_id,
                permission_id: item.permissionId
            });
          }));
        } catch (error) {
          console.error("Error mapping Role With Permission:", error);
          throw error;
        }
    }

    static async getDataBasedOnRoleId(roleId) {
      try {
        let roleIds = Array.isArray(roleId) ? roleId : [roleId];
        let getRecord = this.findAll({
          order: [['permission_id', 'ASC']],
           where: {
             role_id : roleIds
           },
           attributes: {exclude: ['id', 'createdAt', 'updatedAt']}
        });
        return getRecord;
      } catch (error) {
        console.error("Error mapping Role With Permission:", error);
        throw error;
      }
    }


  static async deleteRoleWisePermission(roleId) {
    try {
      let deleteRecord = this.destroy({
         where: {
          role_id : roleId
         },
      });
      return deleteRecord;
    } catch (error) {
      console.error("Error while deleting Role With Permission data:", error);
      throw error;
    }
}
}

t_assign_role_permission_mapping.init({
    role_id: DataTypes.INTEGER,
    permission_id: DataTypes.INTEGER
},{
    sequelize,
    modelName: 't_assign_role_permission_mapping',
});

module.exports = t_assign_role_permission_mapping;
