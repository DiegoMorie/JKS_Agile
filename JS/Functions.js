function Show(){
    const Style = document.getElementById('method_holder');
    Style.style.opacity = 1;
}

function Ing_Rut(){
    Show()
    const Mod_login = document.getElementById('BoxLog');
    Mod_login.innerHTML = "<h1>Log in rut</h1><br><input type=\"text\" placeholder=\"Ingrese su rut\"/><br><br><button onsubmit=\"Check(1)\">JOIN</button>" ;
}


function Check(Data,info){
    switch (Data){
        // Validación con RUT
        case 1:
            state = Val_RUT(info)
            if (state == 0){
                // ALERT something wrong
            } else {
                // Send to next page
            }
            break;


        // Validación con Correo
        case 2:
            state = Val_Mail(info)
            if (state == 0){
                // ALERT something wrong
            } else {
                // Send to next page
            }
            break;

        // Validación contraseña DuocUC
        case 3:
            state = Val_Pass(info)
            if (state == 0){
                // ALERT something wrong
            } else {
                // Send to next page
            }
            break;
    }
}