const UserServices = require("../services/user.services");

exports.signup = async (req, res, next) => {
  try {
    const { name, email, password } = req.body;
    const successRes = await UserServices.signupUser(name, email, password);
    res.status(200).json({ message: "Success" });
  } catch (error) {
    throw error;
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = UserServices.checkUser(email);
    if (!user) {
      throw new Error("User doesn't exists");
    }
    const isMatch = user.comparePassword(password);
  } catch (error) {
    throw error;
  }
};
