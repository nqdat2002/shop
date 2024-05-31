import express from "express";
import admin from "../middlewares/admin.js";
import { 
    addProduct, 
    analyst, 
    changeOrderStatus, 
    deleteProduct, 
    getAllOrders, 
    getAllProducts, 
    getAllUsers
} from "../controllers/admin.js";

const adminRouter = express.Router();

adminRouter.post("/add-product", admin, addProduct);
adminRouter.get("/get-all-products", admin, getAllProducts);
adminRouter.get("/get-all-users", admin, getAllUsers);
adminRouter.post("/delete-product", admin, deleteProduct);
adminRouter.get("/get-all-orders", admin, getAllOrders);
adminRouter.post("/change-order-status", admin, changeOrderStatus);
adminRouter.get("/analytics", admin, analyst);

export default adminRouter;