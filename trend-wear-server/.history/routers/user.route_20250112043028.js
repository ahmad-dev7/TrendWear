import router, { post } from "express";
import { register } from "../controller/user.controller";

post("/registration", register);

export default router;
