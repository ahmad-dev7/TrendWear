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
    const user = await UserServices.checkUser(email);
    if (user) {
      const isMatch = user.comparePassword(password);
      if (isMatch === true) {
        let tokenData = { _id: user._id, email: user.email };

        const token = await UserServices.generateToken(
          tokenData,
          "BlocCubitSecret",
          "10m"
        );

        return res.status(200).json({ status: true, token: token });
      } else {
        return res
          .status(401)
          .json({ status: false, message: "Invalid Password" });
      }
    } else {
      return res.status(404).json({ status: false, message: "User Not Found" });
    }
  } catch (error) {
    throw error;
  }
};
