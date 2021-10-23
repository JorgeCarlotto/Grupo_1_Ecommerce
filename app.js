const path = require('path');
const express = require('express');

//Routing files
const routersMain = require('./routers/main.js');
const routersProducts = require('./routers/product.js');
const routerUser = require('./routers/user.js');

const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));

//Server Up
app.listen(3001, () => console.log('Server running...'));

//URL
app.use('/products', routersProducts);
app.use('/users', routerUser);
app.use('/', routersMain);

app.use((req, res, next) => {
    res.status(404).render('error/error404');
})