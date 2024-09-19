'use strict';
const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../models/index');

class User extends Model {
    static async insertUserDetails(data) {
      try {
        const saveData = await User.create(data);
        console.log("Here is the auto-generated ID:", saveData.id);
        return saveData.id;
      } catch (error) {
        console.error("Error inserting user details:", error);
        throw error;
      }
    }

    static async userDetailsBasedOnUserId(id){
      return await User.findOne({
          attributes: {exclude: ['password', 'createdAt', 'updatedAt', 'adhara_number', 'mobileNumber']},
          where: {
            id: id
          }
      }).then(data => {
          return data;
      }).catch(err => {
          return null;
      });
    }

    static async userDetails(email){
      return await User.findOne({
          attributes: {exclude: []},
          where: {
            email: email
          }
      }).then(data => {
          return data;
      }).catch(err => {
          return null;
      });
  }
}

User.init({
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    user_role:DataTypes.INTEGER,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    mobileNumber: DataTypes.STRING,
    adhara_number: DataTypes.STRING,
  }, {
    sequelize,
    modelName: 'User',
});

module.exports = User;
