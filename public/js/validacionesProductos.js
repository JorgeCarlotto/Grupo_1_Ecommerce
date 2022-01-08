window.addEventListener('load', function () {
    let formulario = document.querySelector('form.formulario');


    formulario.addEventListener('submit', function (e) {
        e.preventDefault();

        let campoNombre = document.getElementById('name');

        if (campoNombre.value == ""  || campoNombre.value.length <= 1 ) {
       
            document.querySelector(`#grupo__nombre .formulario__input-error`).classList.add('formulario__input-error-activo');
            document.querySelector(`#grupo__nombre i`).classList.add('fa-times-circle');
            document.getElementById(`grupo__nombre`).classList.add('formulario__grupo-incorrecto');
         } else  {
             document.querySelector(`#grupo__nombre i`).classList.add('fa-check-circle');
            document.querySelector(`#grupo__nombre .formulario__input-error`).classList.remove('formulario__input-error-activo');
            document.querySelector(`#grupo__nombre i`).classList.remove('fa-times-circle');
           document.getElementById(`grupo__nombre`).classList.add('formulario__grupo-correcto');
         }


         let campoPrecio = document.getElementById('price');

        if (campoPrecio.value == ""  || campoPrecio.value.length <= 0 ) {
       
            document.querySelector(`#grupo__precio .formulario__input-error`).classList.add('formulario__input-error-activo');
            document.querySelector(`#grupo__precio i`).classList.add('fa-times-circle');
            document.getElementById(`grupo__precio`).classList.add('formulario__grupo-incorrecto');
         } else  {
             document.querySelector(`#grupo__precio i`).classList.add('fa-check-circle');
            document.querySelector(`#grupo__precio .formulario__input-error`).classList.remove('formulario__input-error-activo');
            document.querySelector(`#grupo__precio i`).classList.remove('fa-times-circle');
           document.getElementById(`grupo__precio`).classList.add('formulario__grupo-correcto');
         }


         let campoStock = document.getElementById('stock')

         if (campoStock.value == "" ||campoStock.value <= 0 ) {
            document.querySelector(`#grupo__stock .formulario__input-error`).classList.add('formulario__input-error-activo');
            document.querySelector(`#grupo__stock i`).classList.add('fa-times-circle');
            document.getElementById(`grupo__stock`).classList.add('formulario__grupo-incorrecto');
         } else {
            document.querySelector(`#grupo__stock .formulario__input-error`).classList.remove('formulario__input-error-activo');
            document.querySelector(`#grupo__stock i`).classList.remove('fa-times-circle');
           document.getElementById(`grupo__stock`).classList.add('formulario__grupo-correcto');
           document.querySelector(`#grupo__stock i`).classList.add('fa-check-circle');
         }


         let campoDescripcion= document.querySelector('#descripcion')

         if (campoDescripcion.value == "" ||campoDescripcion.value.length < 2 ) {
            document.querySelector(`#grupo__descripcion .formulario__input-error`).classList.add('formulario__input-error-activo');
            document.querySelector(`#grupo__descripcion i`).classList.add('fa-times-circle');
            document.getElementById(`grupo__descripcion`).classList.add('formulario__grupo-incorrecto');
         } else  {
            document.querySelector(`#grupo__descripcion .formulario__input-error`).classList.remove('formulario__input-error-activo');
            document.querySelector(`#grupo__descripcion i`).classList.remove('fa-times-circle');
           document.getElementById(`grupo__descripcion`).classList.add('formulario__grupo-correcto');
           document.querySelector(`#grupo__descripcion i`).classList.add('fa-check-circle');
         }




    })

 })