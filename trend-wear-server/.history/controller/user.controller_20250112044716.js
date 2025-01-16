const UserServices = require("../services/user.services");

exports.register = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const successRes = await UserServices.registerUser(email, password);
    res.status(200).json({ message: "Success" });
  } catch (error) {
    throw error;
  }
};
