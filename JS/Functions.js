

function Show(){
    const showStyle = document.getElementById('method_holder');
    showStyle.style.opacity = 1;
}

function Ing_Rut(){
    Show()
    const modLogin = document.getElementById('BoxLog');
    modLogin.innerHTML = "<h1>Login rut</h1><br><input type=\"text\" placeholder=\"Ingrese su rut\"/><br><br><button onsubmit=\"Check(1)\">JOIN</button>" ;
}

function Ing_Correo(){
    Show()
    const modLogin = document.getElementById('BoxLog');
    modLogin.innerHTML = "<h1>Login por Correo</h1><br><input type=\"text\" placeholder=\"Ingrese su correo\"/><br><br><button onsubmit=\"Check(2)\">JOIN</button>" ;
}

function Ing_DuocPass(){
    Show()
    const modLogin = document.getElementById('BoxLog');
    modLogin.innerHTML = "<h1>Login por contraseña</h1><br><input type=\"text\" placeholder=\"Ingrese su contraseña Duoc\"/><br><br><button onsubmit=\"Check(3)\">JOIN</button>" ;
}


function Check(Data,info){
    switch (Data){
        // Validación con RUT
        case 1:
            state = Val_RUT(info)
            if (state == 0){
                location.href = '../PHP/TeSt.php'
            } else {

            }
            break;


        // Validación con Correo
        case 2:
            state = Val_Mail(info)
            if (state == 0){    
                location.href = '../PHP/TeSt.php'
            } else {
                
            }
            break;

        // Validación contraseña DuocUC
        case 3:
            state = Val_Pass(info)
            if (state == 0){
                location.href = '/PHP/Te'
            } else {
                
            }
            break;
    }
}



function Val_RUT(info){
    var regex = "!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/";
    var result = info.match(regex);
    if (result){
        return 1;
    } else {
        return 0; 
    }
}

function Val_Mail(info){
    var regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$";
    var result =  info.match(regex);
    if (result){
        return 1;
    } else {
        return 0; 
    }
}

function Val_Pass(info){
    return 1;
}