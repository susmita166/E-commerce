'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.addColumn('Users', 'user_role', {
      type: Sequelize.DataTypes.INTEGER,
      allowNull: false,
      after: 'id',
    });

  },

  async down (queryInterface, Sequelize) {
    await queryInterface.removeColumn('Users', 'user_role');
  }
};
