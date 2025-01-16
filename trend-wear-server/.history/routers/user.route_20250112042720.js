const router = require("express");

router.post("/registration", UserController.register);

module.exports = router;
