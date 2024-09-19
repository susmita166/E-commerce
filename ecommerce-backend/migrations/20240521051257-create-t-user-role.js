'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('t_user_roles', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });

    // await queryInterface.addColumn('Users', 'user_role', {
    //   type: Sequelize.DataTypes.INTEGER,
    //   allowNull: false,
    //   after: 'id',
    //   references: {
    //     model: 't_user_roles', // name of the target table
    //     key: 'id' // key in the target table that we're referencing
    //   },
    // });
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('t_user_roles');
  }
};