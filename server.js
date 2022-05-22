import express from "express";
const app = express();
const port = process.env.HTTP_SERVER_PORT;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});