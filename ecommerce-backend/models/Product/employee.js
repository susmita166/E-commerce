'use strict';
const { Model, DataTypes } = require('sequelize');
const { sequelize } = require('../../models/index');

class Employee extends Model {}

Employee.init({
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    allowNull: false,
    autoIncrement: true
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  position: {
    type: DataTypes.STRING,
    allowNull: false
  },
  department: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  sequelize,
  modelName: 'Employee',
  tableName: 'employee',
  timestamps: false
});

module.exports = Employee;
