'use strict';
const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../models/index');
const moment = require('moment');

class t_personal_access_tokens extends Model {
  static async insertTokenDetails(generateToken, userId, detectedBrowser) {
    try {
      const currentDate = moment(new Date()).format("YYYY-MM-DD HH:mm:ss"); 
      console.log("date",currentDate);
      const saveData = await t_personal_access_tokens.create({ token: generateToken, status: 1, created_by:userId, detect_browser:detectedBrowser, createdAt:currentDate, updatedAt:currentDate});
      return saveData.id;
    } catch (error) {
      console.error("Error inserting token details:", error);
      throw error;
    }
  }

  static async findUserTokenDetail(token){
    return await t_personal_access_tokens.findOne({
        attributes: {exclude: ['detect_browser', 'mobileNumber', 'updatedAt', 'id']},
        where: {
          token: token,
          status:1
        }
    }).then(data => {
        return data;
    }).catch(err => {
        return null;
    });
  }
}


t_personal_access_tokens.init({
  token: DataTypes.STRING,
  status: DataTypes.BOOLEAN,
  detect_browser:DataTypes.STRING,
  created_by: DataTypes.INTEGER
}, {
  sequelize,
  modelName: 't_personal_access_tokens',
});

module.exports = t_personal_access_tokens;