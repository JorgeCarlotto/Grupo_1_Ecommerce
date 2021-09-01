//Require
const path = require('path');
const express = require('express');

const app = express();

//Public folder
const publicFolderPath = path.resolve(__dirname, './public');
app.use(express.static(publicFolderPath));

//Routes


//Server Up
app.listen(3000, () =>  console.log('Server running'))