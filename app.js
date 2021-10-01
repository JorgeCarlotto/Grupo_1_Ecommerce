const path = require('path');
const express = require('express');

//Routing files
const routersMain = require('./routers/main.js');
const routersProducts = require('./routers/product.js');

const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));

//Server Up
app.listen(3000, () => console.log('Server running...'));

//URL
app.use('/products', routersProducts);
app.use('/', routersMain);