const path = require('path');
const express = require('express');
const session = require('express-session');
const cookies = require('cookie-parser');
const userLoggedMiddleware = require('./middlewares/userLoggedMiddleware');

//Routing files
const routersMain = require('./routers/main.js');
const routersProducts = require('./routers/product.js');
const routerUser = require('./routers/user.js');
const methodOverride = require('method-override');
const app = express();


app.use(session({
    secret: 'cualquier cosa',
    resave:false,
    saveUninitialized:false,
}));
app.use(cookies());
app.use(userLoggedMiddleware);
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: false }));
app.use(methodOverride('_method'));

//Server Up
app.listen(3000, () => console.log('Server running...'));

//URL
//app.use('/admin', routersAdmin);
app.use('/products', routersProducts);
app.use('/users', routerUser);
app.use('/', routersMain);

app.use((req, res, next) => {
    res.status(404).render('error/error404');
})