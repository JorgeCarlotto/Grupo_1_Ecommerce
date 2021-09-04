//Require
const path = require('path');
const express = require('express');

const app = express();

//Public folder
const publicFolderPath = path.resolve(__dirname, './public');
app.use(express.static(publicFolderPath));

//Routes
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/views/index.html'))
});

app.get('/product-details', (req, res) => {
    res.sendFile(path.join(__dirname, '/views/productDetail.html'))
});
app.get('/register', (req, res) => {
    res.sendFile(path.join(__dirname, '/views/register.html'))
});

//Server Up
app.listen(3000, () => console.log('Server running'))