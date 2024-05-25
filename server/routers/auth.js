import express from "express"; 
import auth from "../middlewares/auth.js";
import { 
    getUserData, 
    isValidToken, 
    signIn, 
    signUp 
} from "../controllers/auth.js";
const authRouter = express.Router();

authRouter.post("/signup", signUp);
authRouter.post("/signin", signIn);
authRouter.post("/tokenIsValid", isValidToken);
authRouter.get("/getUserData", auth, getUserData);

export default authRouter;