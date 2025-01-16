const UserServices = require("../services/user.services");

exports.signup = async (req, res, next) => {
  try {
    const { name, email, password } = req.body;
    const successRes = await UserServices.signup(name, email, password);
    res.status(200).json({ message: "Success" });
  } catch (error) {
    throw error;
  }
};
