window.addEventListener('load', function () {

    let formulario = document.getElementById('formulario');
    let inputs = document.querySelectorAll('#formulario .formulario__grupo');
    
    
    //expresiones regulares en js 
    const expresiones = {
        password: /^.{8,20}$/, // 8 a 20 digitos. //faltaria que lleve una mayuscula, una minuscula, un número y un caracter especial
       correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,    
    }
    
    const campos = {
        password: false,
        correo: false,   

    }
    
    const validarFormulario = (e) =>{
    
       switch (e.target.name) {
            case 'password':  
            validarCampo(expresiones.password,e.target, 'password') 
               break;
    
          
            case 'email':   
            validarCampo(expresiones.correo,e.target, 'correo') 
               break;
    
    
           default:
               break;
       }
       
    }
    
    
    const validarCampo = (expresion, input, campo) => {
        
        if (expresion.test(input.value)) { //con el test comprobamos las expresiones regulares
            document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
            document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
            document.querySelector(`#grupo__${campo} i`).classList.add('fa-check-circle');
            document.querySelector(`#grupo__${campo} i`).classList.remove('fa-times-circle');
            document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove('formulario__input-error-activo');
            campos[campo]= true;
    
         }else{
             document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
             document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
             document.querySelector(`#grupo__${campo} i`).classList.remove('fa-check-circle');
             document.querySelector(`#grupo__${campo} i`).classList.add('fa-times-circle');
             document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add('formulario__input-error-activo');
             campos[campo]= false;
         }
    }
     
    inputs.forEach((input) => {
        input.addEventListener('keyup', validarFormulario);
        input.addEventListener('blur', validarFormulario)
    })
    
    formulario.addEventListener('submit', function (e) {
        e.preventDefault()
      if ( campos.correo && campos.password) {
          formulario.reset();
    
          document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
          document.getElementById('formulario__mensaje').classList.remove('formulario__mensaje-activo')
          setTimeout(() => {
            document.getElementById('formulario__mensaje-exito').classList.remove('formulario__mensaje-exito-activo');
        }, 3000);
    
        document.querySelectorAll('.formulario__grupo-correcto').forEach((icono) => {
            icono.classList.remove('formulario__grupo-correcto');
        });
        
      }
      else{
          document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo')
      }
    }) 
    
    
    
})