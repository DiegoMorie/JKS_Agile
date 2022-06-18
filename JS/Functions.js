// import { Toast } from 'boostrap.esm.min.js';

function Check(Data){
    const info = document.querySelector('info_holder').value
    switch(Data){
        // Validación con RUT
        case 1:
            state = Val_RUT(info)
            if (state == 0){
                window.location.href = 'contact.html';
            } else {
                window.alert("Something went wrong {RUT_METHOD}")
            }
            break;


        // Validación con Correo
        case 2:
            state = Val_Mail(info)
            if (state == 0){    
                window.location.href = 'contact.html';
            } else {
                window.alert("Something went wrong {Mail_METHOD}")
            }
            break;

        // Validación contraseña DuocUC
        case 3:
            const name = document.querySelector('name_holder').value
            state = Val_Pass(info,name)
            if (state == 0){
                window.location.href= "contact.html";
            } else {
                window.alert("Something went wrong {USER_METHOD}")
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


function Redirect(data){
    if(data == 1){
        window.location.href = "contact.html";
    }else {
        window.location.href= "contact.html";
    }
}


function FRedirect(site){
    switch(site){
        case 1:
            window.location.href="https://www.youtube.com/watch?v=__UV4QRnkps";
            break;
        case 2:
            window.location.href="https://www.youtube.com/watch?v=n8rd6hhz_7U";
            break;
        case 3:
            window.location.href="https://www.youtube.com/watch?v=mpD8bIM1FLU";
            break;
        case 4:
            window.location.href = "https://www.youtube.com/watch?v=mpD8bIM1FLU";
            break;
        

    }
}