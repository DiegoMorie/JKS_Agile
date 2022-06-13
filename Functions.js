function Show(){
    const showStyle = document.getElementById('method_holder');
    showStyle.style.opacity = 1;
}

function Ing_Rut(){
    Show()
    const modLogin = document.getElementById('BoxLog');
    modLogin.innerHTML = "<h1>Login rut</h1><br><input type=\"text\" placeholder=\"Ingrese su rut\"/><br><br><button onclick=\"Check(1)\">JOIN</button>" ;
}

function Ing_Correo(){
    Show()
    const modLogin = document.getElementById('BoxLog');
    modLogin.innerHTML = "<h1>Login por Correo</h1><br><input type=\"text\" placeholder=\"Ingrese su correo\"/><br><br><button onclick=\"Check(2)\">JOIN</button>" ;
}

function Ing_DuocPass(){
    Show()
    const modLogin = document.getElementById('BoxLog');
    modLogin.innerHTML = "<h1>Login por contraseña</h1><br><input type=\"text\" placeholder=\"Ingrese nombre de usuario\" id=\"name_holder\"><input type=\"password\" placeholder=\"Ingrese su contraseña Duoc\" id=\"info_holder\"/><br><br><button onclick=\"Check(3)\">JOIN</button>";
}


function Check(Data){
    const info = document.querySelector('info_holder').value
    switch (Data){
        // Validación con RUT
        case 1:
            state = Val_RUT(info)
            if (state == 0){
                location.href = './contact.html';
            } else {

            }
            break;


        // Validación con Correo
        case 2:
            state = Val_Mail(info)
            if (state == 0){    
                
            } else {
                
            }
            break;

        // Validación contraseña DuocUC
        case 3:
            const name = document.querySelector('name_holder').value
            state = Val_Pass(info,name)
            if (state == 0){
                location.href = './contact.html';
            } else {
                
            }
            break;
    }
}



function Val_RUT(info){
    var regex = "!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/";
    var result = info.match(regex);
    if (result){
        return 0;
    } else {
        return 1; 
    }
}

function Val_Mail(info){
    var regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$";
    var result =  info.match(regex);
    if (result){
        return 0;
    } else {
        return 1; 
    }
}

function Val_Pass(info,pass){
    return 0;
}



