const router = require("express");
const UserController = require("../controller/user.controller");

router.post("/registration", UserController.register);

module.exports = router;
