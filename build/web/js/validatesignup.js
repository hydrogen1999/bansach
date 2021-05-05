/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateSignUp() {
    var signup_form=document.forms["signup_form"];
//    var USER_NAME = document.getElementById("name").value;
//    var EMAIL = document.getElementById("email").value;
//    var PHONE = document.getElementById("phone").value;
//    var PASSWORD = document.getElementById("password").value;
//    var REPEAT_PASS = document.getElementById("repeat-password").value;
    var USER_NAME=signup_form["name"].value;
    var EMAIL=signup_form["email"].value;
    var PHONE=signup_form["phone"].value;
    var PASSWORD=signup_form["password"].value;
    var REPEAT_PASS=signup_form["repeat-password"].value;
   
    if (USER_NAME.length==0) {
        alert("Please provide your full name!");
        signup_form["name"].focus();
        return false;
    }
    if (EMAIL.length==0) {
        alert("Please provide your Email!");
        signup_form["email"].focus();
        return false;
    }
    if (PHONE.length==0) {
        alert("Please provide your phone!");
        signup_form["phone"].focus();
        return false;
    }
    if (PASSWORD.length==0) {
        alert("Please provide your password!");
        PASSWORD=signup_form["password"].focus();
        return false;
    }
    if (REPEAT_PASS.length==0) {
        alert("Enter your password again!");
        signup_form["repeat-password"].focus();
        return false;
    }
    atpos = EMAIL.indexOf("@");
    dotpos = EMAIL.lastIndexOf(".");

    if (atpos < 1 || (dotpos - atpos < 2)) {
        alert("Please enter correct email ID")
        signup_form["email"].focus();
        return false;
    }
    if (PASSWORD != REPEAT_PASS) {
        alert("Mật khẩu không trùng khớp");
        return false;
    }
    return true;
};
