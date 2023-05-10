module.exports = (req, res) => {
    if (req.url == "/api/dogs") {
        res.statusCode = 200;
        res.setHeader("Content-Type", "application/json");
        res.write(JSON.stringify(req.dogs));
        res.end();
    }
    else {
        res.writeHead(404, { "Content-Type": "application/json" });
        res.end(JSON.stringify({ title: "Not Found 💀 ", message: "Route not found" }));
    }
};