const jwt = require('jsonwebtoken');
const moment = require('moment');
const PersonalAccessToken = require('../models/AuthenticationModel/t_personal_access_tokens');
const User = require('../models/AuthenticationModel/userModel');
const CustomError = require('../errorHandling/customError');



/**
 * ----------------------------------
 * This middlewear method is responsible for Verify token 
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created: 17/05/24
 */

async function authenticateToken(req, res, next) {
    try{
        const token = req.headers['authorization'];
        if (token == null)  throw new CustomError("Unauthorized, No token provided", 401);

        const removeBearer = token.replace("Bearer ", "");
        let getTokenDetails = await PersonalAccessToken.findUserTokenDetail(removeBearer);
        if(!getTokenDetails) throw new CustomError("Unauthorized", 401);

        let getUserDetails = await User.userDetailsBasedOnUserId(getTokenDetails.created_by);
        if(!getUserDetails) throw new CustomError("Unauthorized User not found", 401);

        const getDateFromToken = moment(getTokenDetails.createdAt);
        const expirationTime = getDateFromToken.clone().add(1, 'hours');
        const currentTime = moment();
        const isTokenExpired = currentTime.isAfter(expirationTime);
        if(isTokenExpired){
            throw new CustomError("Token has expired", 401);
        }
        req.user_detail = getUserDetails;
        return next();
    }catch (error) {
        // console.log(error);
        res.status(error.statusCode || 500).json({
            status: 'false',
            message: error.message || "Internal server error",
        });
    }
    
}


/**
 * ----------------------------------
 * This middlewear method is responsible for generate token during Login
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created: 17/05/24
 */
async function tokenGenerate(userId, userFirstName, userLastName, detectedBrowser) {
    const tokenExpiryDate = Math.floor(Date.now() / 1000) + 3600; 
    const generateToken = await jwt.sign({
        expiresIn: 3600, 
        user: {
            userId: userId,
            userFirstName: userFirstName,
            userLastName: userLastName,
        }
    }, process.env.ACCESS_TOKEN_SECRET);
    if(generateToken){
        let saveTokenDetails = PersonalAccessToken.insertTokenDetails(generateToken, userId, detectedBrowser);
    }
    let tokenTime = oneHourFromNow();
    const returnTokenDetails = { token: generateToken, tokenExpiryTime: tokenTime };
    return returnTokenDetails;
    
}

function oneHourFromNow() {
    let currentDateTime = moment();

    // Add 1 hour to the current date and time
    let futureDateTime = currentDateTime.add(1, 'hours');

    // Format the date and time as desired
    let formattedDateTime = futureDateTime.format("YYYY-MM-DD HH:mm:ss");
    return formattedDateTime;
}

module.exports = {
    tokenGenerate,
    authenticateToken
};
