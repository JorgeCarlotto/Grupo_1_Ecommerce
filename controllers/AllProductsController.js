  const path = require('path')
  const fs = require('fs')


  const productsFilePath = path.join(__dirname, '../data/productDataBase.json');
  const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));

  const allProductsController = {
    productsTodos: function (req,res) {
        res.render('allProducts', {products:products})
    }

  }


  module.exports = allProductsController