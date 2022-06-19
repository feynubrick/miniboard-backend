import express from 'express';

import routers from './routers/_index.js';

const app = express();
const port = process.env.BACKEND_HTTP_PORT;

app.use(routers);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
