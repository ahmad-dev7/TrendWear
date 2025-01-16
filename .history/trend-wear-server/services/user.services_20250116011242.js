const UserModel = require("../model/user.model");
const jwt = require("jsonwebtoken");

class UserServices {
  static async signupUser(name, email, password) {
    console.log(email + " came for signup");
    try {
      const createUser = new UserModel({ name, email, password });
      return await createUser.save();
    } catch (error) {
      console.log(error);
    }
  }

  //* For login
  static async checkUser(email) {
    console.log(email + " came for login");
    try {
      return await UserModel.findOne({ email });
    } catch (error) {
      console.log(error);
    }
  }

  //* JWT-Token
  static async generateToken(tokenData, secret_key, jwt_expire) {
    return jwt.sign(tokenData, secret_key, { expiresIn: jwt_expire });
  }
}

module.exports = UserServices;
