function checkUsername() {
    var username = $("#username").val();
    var reg_username = /^\w{6,20}$/;
    var flag = reg_username.test(username);
    if(flag){
        $("#username").css("border","");
        $("#username_T").html("");
    }else{
        $("#username").css("border","1px solid red");
        $("#username_T").html("长度至少为6位且小于20位");
    }
    return flag;
}

function checkPassword() {
    var password = $("#password").val();
    var reg_password = /^\w{6,20}$/;
    var flag = reg_password.test(password);
    if(flag){
        $("#password").css("border","");
        $("#password_T").html("");
    }else{
        $("#password").css("border","1px solid red");
        $("#password_T").html("长度至少为6位");
    }

    return flag;
}

function checkEmail() {
    var email = $("#email").val();
    var reg_email = /^\w+@\w+\.\w+$/;
    var flag = reg_email.test(email);
    if(flag){
        $("#email").css("border","");
        $("#email_T").html("");
    }else{
        $("#email").css("border","1px solid red");
        $("#email_T").html("格式不正确");
    }
    return flag;
}

function checkRepassword() {
    var password = $("#password").val();
    var repassword = $("#repassword").val();
    var flag = password == repassword;
    if(flag){
        $("#repassword").css("border","");
        $("#repassword_T").html("");
    }else{
        $("#repassword").css("border","1px solid red");
        $("#repassword_T").html("两次输入不相等");
    }
    return flag;
}

function checkTelephone() {
    var telephone = $("#telephone").val();
    var reg_telephone = /^1[3456789]\d{9}$/;
    var flag = reg_telephone.test(telephone);
    if(flag){
        $("#telephone").css("border","");
        $("#telephone_T").html("");
    }else{
        $("#telephone").css("border","1px solid red");
        $("#telephone_T").html("格式不正确");
    }
    return flag;
}