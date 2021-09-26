const path = require('path');
const express = require('express');

//Routing files
const routersMain = require('./routers/main.js');
const routersProducts = require('./routers/product.js');

const app = express();

//Public folder
const publicFolderPath = path.resolve(__dirname, './public');
app.use(express.static(publicFolderPath));

//Server Up
app.listen(3000, () => console.log('Server running...'));


//URL
app.use('/products', routersProducts);
app.use('/', routersMain);