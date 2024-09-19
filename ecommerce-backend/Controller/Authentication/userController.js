const User = require('../../models/AuthenticationModel/userModel');
const { hashPassword, comparePasswords } = require('../../Helper/security');
const { tokenGenerate, authenticateToken } = require('../../middlewares/auth_middleware');
const moment = require('moment');


/**
 * ----------------------------------
 * This method is responsible for User registration with required user details.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 17/05/24
*/
const registeration = async (req, res) => {
    try {
        let requestData = req.body;
        let Data = {};
        if(requestData.firstName) Data.firstName = requestData.firstName;
        if(requestData.lastName) Data.lastName = requestData.lastName;
        if(requestData.user_role) Data.user_role = requestData.user_role;
        if(requestData.email) Data.email = requestData.email;
        if(requestData.password) Data.password = await hashPassword(requestData.password); 
        if(requestData.mobileNumber) Data.mobileNumber = requestData.mobileNumber;
        if(requestData.adhara_number) Data.adhara_number = requestData.adhara_number;
        const userId = await User.insertUserDetails(Data); 
        res.status(200).json({ message: 'User registered successfully', userId });
    } catch (error) {
            let errorMessage = error.errors[0].message;
            if (errorMessage) {
                res.status(500).json({ status: 'false', error: errorMessage });
            } else {
                res.status(500).json({ status: 'false', error: 'Internal Server Error' });
            }
    }
};

/**
 * ----------------------------------
 * This method is responsible for the Login and send token as a response For Authenticated user.
 * ----------------------------------
 * @param Request $request
 * @return JsonResponse
 * @author Susmita Nayak
 * Created at: 17/05/24
*/

const login = async (req, res) => {
    const userDetail = await User.userDetails(req.query.email);
    if (!userDetail) {
        return res.status(422).json({
            status:false,
            message: 'Invalid email, put the right email for login'
        });
    }
    const isPasswordHashValid = await comparePasswords(req.query.password, userDetail.password);
        if (!isPasswordHashValid) {
            return res.status(401).json({
                status: 'false',
                message: `password not matched.`
            }); 
        }else{
            let request_header = req.headers;
            let userAgent = request_header['user-agent'];
            let userAgentParts = userAgent.split('/');
            const generatedToken = await tokenGenerate(userDetail.id, userDetail.firstName, userDetail.lastName, userAgentParts[0]);
            const userDt = {
                name: userDetail.firstName.concat(" ", userDetail.lastName),
                email: userDetail.email,
                created_at:moment(userDetail.createdAt).format("YYYY-MM-DD HH:mm:ss")
            }
            if(generatedToken){
                return res.status(200).json({
                    message:"Login successful.",
                    token : generatedToken.token,
                    expries_at: generatedToken.tokenExpiryTime,
                    UserDetails:userDt
                });
            }
        }
};

module.exports = {
    registeration,
    login,
    
};
