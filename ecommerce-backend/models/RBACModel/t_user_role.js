'use strict';
const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../index');
const { Op } = require('sequelize');

class t_user_role extends Model {
    static async insertRoleDetails(data) {
      try {
        const saveData = await t_user_role.create(data);
        console.log("Here is the auto-generated ID:", saveData.id);
        return saveData.id;
      } catch (error) {
        console.error("Error inserting Role details:", error);
        throw error;
      }
    }

    static async getRoleDataBasedOnData(roleId) {
      try {
        let roleIds = Array.isArray(roleId) ? roleId : [roleId];
        let getRecord = await this.findAll({
            where: { id: { [Op.in]: roleIds } },
            attributes: { exclude: ['createdAt', 'updatedAt'] },
            raw: true 
        });
        return getRecord;
      } catch (error) {
          console.error("Error mapping Role With Permission:", error);
          throw error;
      }
    }
}

t_user_role.init({
    name: DataTypes.STRING
},{
    sequelize,
    modelName: 't_user_role',
});

module.exports = t_user_role;
