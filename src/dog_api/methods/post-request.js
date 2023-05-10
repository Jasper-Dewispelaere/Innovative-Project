const requestBodyparser = require("../util/body-parser");
const crypto = require("crypto");
module.exports = async (req, res) => {
    if (req.url === "/api/dogs") {
        try {
            let body = await requestBodyparser(req);
            body.id = crypto.randomUUID();
            req.dogs.push(body); 
            //writeToFile(req.dogs);
            res.writeHead(201, { "Content-Type": "application/json" });
            res.end();
        }
        catch (err) {
            console.log(err);
            res.writeHead(400, { "Content-Type": "application/json" });
            res.end(
                JSON.stringify({
                    title: "Validation Failed",
                    message: "Request body is not valid",
                })
            );
        }
    }
    else {
        res.writeHead(404, { "Content-Type": "application/json" });
        res.end(JSON.stringify({ title: "Not Found", message: "Route not found" }));
    }
};