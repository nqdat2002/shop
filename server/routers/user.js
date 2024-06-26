import express from "express";
import auth from "../middlewares/auth.js";
import { 
    addtoCart, 
    confirmOrder, 
    deleteFromCart, 
    orderProducts, 
    saveUserAddress,  
    viewOrders 
} from "../controllers/user.js";
const userRouter = express.Router();

userRouter.post("/add-to-cart", auth, addtoCart);
userRouter.delete("/remove-from-cart/:id", auth, deleteFromCart);
userRouter.post("/save-user-address", auth, saveUserAddress);
userRouter.post("/order", auth, orderProducts);
userRouter.get("/orders/me", auth, viewOrders);
userRouter.get("/confirm-order", auth, confirmOrder);

export default userRouter;