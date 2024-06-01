import mongoose from "mongoose";
let uri = process.env.CONNECTION_URL;
const connect = mongoose.connect(uri).then(
    (res) => {
        console.log("Database connected");
    }
).catch((err) =>{
    console.log(`Database connection error: ${err}`);
});

export default connect;