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
    //! if data base doesn't contains given email
    if (!user) {
      throw new Error("User doesn't exists");
    }
    const isMatch = user.comparePassword(password);
    //! If password entered by user is not matched
    if (isMatch === false) {
      throw new Error("Invalid Password");
    }

    let tokenData = { _id: user._id, email: user.email };

    const token = UserServices.generateToken(
      tokenData,
      "BlocCubitSecret",
      "10m"
    );
  } catch (error) {
    throw error;
  }
};
