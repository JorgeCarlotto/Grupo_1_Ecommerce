const path = require('path');
const express = require('express');
const session = require('express-session');
const cookies = require('cookie-parser');
const userLoggedMiddleware = require('./middlewares/userLoggedMiddleware');

//Routing files
const routersAdmin = require('./routers/admin.js');
const routersProducts = require('./routers/product.js');
const routerUser = require('./routers/user.js');
const routersMain = require('./routers/main.js');
const routerCategory = require('./routers/category');
const methodOverride = require('method-override');
const routerFlavor = require('./routers/flavor.js');
const apiUsersRouter = require('./routers/api/apiUsersRouter')
const app = express();


app.use(session({
    secret: 'cualquier cosa',
    resave: false,
    saveUninitialized: false,
}));
app.use(cookies());
app.use(userLoggedMiddleware);
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({
    extended: false
}));
app.use(methodOverride('_method'));

//Server Up
app.listen(3001, () => console.log('Server running...'));

//URL
app.use(routerFlavor);
app.use(routersAdmin);
app.use(routerCategory);
app.use(routersProducts);
app.use('/users', routerUser);
app.use('/', routersMain);

// URL APIs

app.use('/api/users',apiUsersRouter)


app.use((req, res, next) => {
    res.status(404).render('error/error404');
})