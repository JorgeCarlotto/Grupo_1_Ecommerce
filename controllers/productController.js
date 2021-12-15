
const db = require('../src/database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");


const {
    render
} = require('ejs');
const {
    validationResult
} = require('express-validator');
const { restart } = require('nodemon');


 const Products = db.Product
 
let productController = {
    index: function (req, res) {
        db.Product
        .findAll()
        .then(products => res.render('product/index', {
            products
        }))
        .catch(error  => {
   
            res.send(error)
        })

        
    },
    create: function (req, res) {
        Promise.all([
            db.Category.findAll(),
            db.Flavor.findAll(),
        ])
        .then(function ([categoria,flavors]) {
          res.render('product/create',{categoria,flavors})
        })

        .catch((error) =>{
            res.send(error)
        })
    },

    
    store: function (req, res) {
        const validation = validationResult(req);
        if (validation.errors.length > 0) {
            Promise.all([
                db.Category.findAll(),
                db.Flavor.findAll(),    
            ])
            .then(function ([categoria,flavors]) {
              res.render('product/create',{
                  errors: validation.mapped(),
                oldData: req.body, 
                categoria,flavors}
              )          
            })
    
        } else {
            db.Product
                .create({
                    name: req.body.name,
                    category_id : req.body.category_id,
                    price: req.body.price,
                    description : req.body.description,
                    stock: req.body.stock,
                    flavor_id: req.body.flavor_id,
                })
                .then(() => res.redirect('/products'))
        }},

    edit:   function (req, res) {
            Promise.all([
                db.Category.findAll(),
                db.Flavor.findAll(),
                db.Product.findByPk(req.params.id)
            ])
            .then(function ([categoria, flavors, producto]) {
                res.render('product/edit', {categoria, flavors, producto})
            })

     },

    update: function (req, res) {
        const validation = validationResult(req)
        const productId = req.params.id
        if (validation.errors.length > 0) {
            Promise.all([
                db.Category.findAll(),
                db.Flavor.findAll(),
                db.Product.findByPk(req.params.id)
            ])

            .then(function ([categoria, flavors, producto]) {
                res.render('product/edit',{
                    errors: validation.mapped(),
                     oldData: req.body,
                     categoria:categoria,
                     flavors:flavors,
                     producto:producto
              })
            })
      
        } else {
             db.Product
             .update({
                 name: req.body.name,
                 category_id : req.body.category_id,
                 price: req.body.price,
                 description : req.body.description,
                 stock: req.body.stock,
             },{
                 where: {id: productId}
             })
             .then(() =>{
                 return res.redirect('/products/show/'+ productId)
             })
    
        }    
    },


    show: function (req, res) {
        db.Product.findByPk(req.params.id, {
            include: [{association: 'category'}]
        })
        .then(product =>{
            res.render('product/show', {product})
        })
    },
  
    shoppingCart: function (req, res) {
        res.render('product/shoppingCart')
    },

    //
    destroy:  (req, res) => {
      
        let productId = req.params.id;
   
        db.Product
        .destroy({where: {id: productId}, force: true})
        .then(()=>{
            return res.redirect('/')})
        .catch(error => res.send(error))
        
    },

    search: (req,res) =>{
        let productoBuscado = req.query.search;
    
        db.Product.findAll({
            where: {
                name:{[Op.like]: '%' + productoBuscado + '%'}      
            }
        })
        .then( products => {
            console.log(products)
            res.render('product/findProducts', {products})
        })
        .catch(error => res.send(error))
    
   

    }
   
}

module.exports = productController;

