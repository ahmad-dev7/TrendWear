const router = require("express").Router();
const UserController = require("../controller/user.controller");

router.post("/signup", UserController.signup);
router.get("/login", UserController.login);

module.exports = router;
