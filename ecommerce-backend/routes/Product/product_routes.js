const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const { readXml } = require('../../Controller/Product/productController'); 
const {authenticateToken} = require('../../middlewares/auth_middleware');

const multer = require('multer'); 
const upload = multer({ 
    dest: 'uploads/',
    limits: { fileSize: 10 * 1024 * 1024 } // 10 MB limit
});

// router.post('/addProduct', authenticateToken, addProduct);


router.post('/readXml', authenticateToken, upload.single('xmlfile'), readXml);

module.exports = router;
