import express from "express";
import dotenv from "dotenv";
import userRouter from "./routers/user.js";
import adminRouter from "./routers/admin.js";
import authRouter from "./routers/auth.js";
import productRouter from "./routers/product.js";
import connect from "./db/connection.js";

dotenv.config({ path: "./config.env" });

const app = express();
app.use(express.json());

app.get("/", (req, res) => {
    res.json({name: "datnq2002"});
});

app.use("/api/user", userRouter);
app.use("/api/admin", adminRouter);
app.use("/api", authRouter);
app.use("/api/product", productRouter);

const PORT = process.env.PORT || 8080;

connect.then((req, res) =>{
    app.listen(PORT, () => {
        console.log(`Server is runing on PORT: ${PORT}`);
    });
}).catch((err) =>{
    console.log(`DB has error: ${err}`);
});