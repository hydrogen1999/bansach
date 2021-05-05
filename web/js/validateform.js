/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateForm() {
    var login_form=document.forms["login_form"];
    var EMAIL=login_form["email1"].value;
    var PASSWORD=login_form["password1"].value;


    if (EMAIL.length==0) {
        alert("Mời cung cấp Email!");
        login_form["email1"].focus();
        return false;
    }
    if (PASSWORD.length==0) {
        alert("Mời cung cấp Mật khẩu!");
        login_form["password1"].focus();
        return false;
    }
    atpos = EMAIL.indexOf("@");
    dotpos = EMAIL.lastIndexOf(".");

    if (atpos < 1 || (dotpos - atpos < 2)) {
        alert("Nhập lại chính xác Email!");
        login_form["email1"].focus();
        return false;
    }
    return true;
};


