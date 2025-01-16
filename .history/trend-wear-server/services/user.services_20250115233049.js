const UserModel = require("../model/user.model");
const jst = require("jsonwebtoken");

class UserServices {
  static async signupUser(name, email, password) {
    try {
      const createUser = new UserModel({ name, email, password });
      return await createUser.save();
    } catch (error) {
      console.log(error);
    }
  }

  //* For login
  static async checkUser(email) {
    try {
      return await UserModel({ email });
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
