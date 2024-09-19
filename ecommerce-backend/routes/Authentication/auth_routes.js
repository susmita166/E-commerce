const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const { registeration, matchPassword, login } = require('../../Controller/Authentication/userController'); 

router.post('/register', registeration);
router.get('/login', login);

module.exports = router;
