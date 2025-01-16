const UserModel = require("../model/user.model");

class UserServices {
  static async registerUser(email, password) {
    try {
      const createUser = new UserModel({ email, password });
      return await createUser.save();
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = UserServices;
