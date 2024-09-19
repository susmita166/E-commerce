'use strict';
const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../index');

class t_assign_user_role__mapping extends Model {
    static async insertUserWiseRole(mappingData) {
        try {
          let insertRecord = await Promise.all(mappingData.map(item =>{
              return this.create({
                  user_id: item.user_id,
                  role_id: item.role_id
              });
          }));
        } catch (error) {
          console.error("Error mapping Role With Permission:", error);
          throw error;
        }
    }

    static async fetchUserWiseRole(userId){
      try{
           let getRecord = this.findAll({
             where:{user_id: userId},
             attributes:{exclude: ['createdAt', 'updatedAt', 'id']}
           })
           return getRecord;
      }catch(error){
        throw error;
      }
    }
}

t_assign_user_role__mapping.init({
    user_id: DataTypes.INTEGER,
    role_id: DataTypes.INTEGER
},{
    sequelize,
    modelName: 't_assign_user_role__mapping',
});

module.exports = t_assign_user_role__mapping;
