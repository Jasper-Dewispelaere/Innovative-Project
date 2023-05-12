const http = require("http");
const getReq = require("./methods/get-request");
const postReq = require("./methods/post-request");
const putReq = require("./methods/put-request");
const deleteReq = require("./methods/delete-request");
let dogs = require("./data/dogs.json");
//require("dotenv").config();

const PORT = process.env.PORT || 5001;

// const cors = require('cors');
// app.use(cors({
//     origin: 'https://www.section.io'
// }));

const server = http.createServer((req, res) => {
    req.dogs = dogs;
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:50943');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    switch (req.method) {
        case "GET":
            getReq(req, res);
            break;
        case "POST":
            postReq(req, res);
            break;
        case "PUT":
            putReq(req, res);
            break;
        case "DELETE":
            deleteReq(req, res);
            break;
        default:
            res.statusCode = 404;
      res.setHeader("Content-Type", "application/json");
      res.write(
        JSON.stringify({ title: "Not Found 💀", message: "Route not found" })
      );
      res.end();
    }
});

server.listen(PORT, () => {
    console.log(`🚀 Server started on port: ${PORT}`);
});