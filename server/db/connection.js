import mongoose from "mongoose";
let uri = process.env.CONNECTION_URL;
const connect = mongoose.connect('mongodb+srv://datfeed2706:En2pCBakSzeE8Ume@mycluster.htyubnp.mongodb.net/?retryWrites=true&w=majority&appName=myCluster').then(
    (res) => {
        console.log("Database connected");
    }
).catch((err) =>{
    console.log(`Database connection error: ${err}`);
});

export default connect;