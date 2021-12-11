
const db = require('../src/database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");


 const Products = db.Product
 
let productController = {
    index: function (req, res) {
        db.Product
        .findAll()
        .then(products => res.render('product/index', {
            products
        }))
        .catch(error  => {
            console.log(error)
            res.send(error)
        })

        
    },
    create: function (req, res) {
         
        Promise.all([
            db.Category.findAll(),
            db.Flavor.findAll()
        ])
        .then(([categorias,flavors])=>{
            res.render('product/create',{categorias,flavors})
        })

        .catch((error) =>{
            res.send(error)
        })

    },

    
    store: function (req, res) {
        // let img
        // if (req.file != undefined) {
        //     img = req.file.filename
        // } else {
        //     img = 'product-default.png'
        // }
     
        db.Product
        .create(
            {
            name: req.body.name,
            category_id : req.body.category_id,
            price: req.body.price,
            description : req.body.description,
            stock: req.body.stock,
            flavor_id: req.body.flavor_id,
            // img : img
           }
         
        )
        .then(()=> {
             res.redirect('/products')})            
        .catch(error => res.send(error))

        },

   


    edit:   function (req, res) {
     
    
            let productos = db.Product.findByPk(req.params.id);
            let categorias = db.Category.findAll();

            Promise.all([productos, categorias])
            .then(function ([producto, categoria]) {
                res.render('product/edit', {producto, categoria})
            })

     },



    update: function (req, res) {

      
        console.log('update')
        const productId = req.params.id
        console.log(req.body)
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
           console.log('actualizado')
            return res.redirect('/products/show/'+ productId)
        })
        .catch(error => res.send(error))

     
    },
//

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

