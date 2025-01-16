const UserModel = require("../model/user.model");

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
}

module.exports = UserServices;
