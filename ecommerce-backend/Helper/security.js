const bcrypt = require('bcrypt');

function hashPassword(plainTextPassword) {
    return new Promise((resolve, reject) => {
        bcrypt.hash(plainTextPassword, 10, (err, hash) => {
            if (err) {
                reject(err); // Pass the error to the caller
            } else {
                resolve(hash); // Pass the hash to the caller
            }
        });
    });
}

async function comparePasswords(plainTextPassword, hashedPassword) {
    return new Promise((resolve, reject) => {
        bcrypt.compare(plainTextPassword, hashedPassword, (err, result) => {
            if (err) {
                reject(err); // Pass the error to the caller
            } else {
                resolve(result); 
            }
        });
    });
}





module.exports = { comparePasswords, hashPassword };
