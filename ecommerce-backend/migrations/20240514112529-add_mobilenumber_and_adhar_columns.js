'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    // Add mobile numer column
    await queryInterface.addColumn('Users', 'mobileNumber', {
      type: Sequelize.DataTypes.STRING,
      allowNull: false,
      unique: true,
    });

    // Add email column
    await queryInterface.addColumn('Users', 'adhara_number', {
      type: Sequelize.DataTypes.STRING,
      allowNull: false,
      unique: true, // Optional: If you want the email to be unique
      after: 'mobileNumber',
    });
  },

  async down(queryInterface, Sequelize) {
    // Remove mobileNumber column
    await queryInterface.removeColumn('Users', 'mobileNumber');

    // Remove adhara_number column
    await queryInterface.removeColumn('Users', 'adhara_number');
  }
};
