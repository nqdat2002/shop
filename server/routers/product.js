import express from "express";
import auth from "../middlewares/auth.js";
import { 
    getDealOfDay, 
    getProductByCategory, 
    rateProduct, 
    searchProduct 
} from "../controllers/product.js";
const productRouter = express.Router();

productRouter.get("/product-by-category", auth, getProductByCategory);
productRouter.get("/search/:name", auth, searchProduct);
productRouter.post("/rate-product", auth, rateProduct);
productRouter.get("/deal-of-day", auth, getDealOfDay);

export default productRouter;
