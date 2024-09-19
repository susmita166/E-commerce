const express = require('express');
const helmet = require("helmet");
const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Middleware to parse URL-encoded bodies
app.use(express.urlencoded({ extended: true }));

// Helmet middleware for securing HTTP headers
app.use(helmet());
/**
 * Load the environment variables from the .env file.
 */
require('dotenv').config();

const multer = require('multer');
const upload = multer();
// app.use(upload.none());

// Import Sequelize instance
const sequelize = require('./models/index').sequelize;

// Import authentication route files
const webRoutes = require('./routes/Authentication/auth_routes');
app.use('/api/auth', webRoutes);

// Import RBAC route files
const RbacRoutes = require('./routes/Rbac/rbac_routes');
app.use('/api/rbac', RbacRoutes);

// Import product route files
const productRoutes = require('./routes/Product/product_routes');
app.use('/api/product', productRoutes);

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Starting Express server on http://localhost:${PORT}`);
});
