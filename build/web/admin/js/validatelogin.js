/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validatelogin() {
    var login_form=document.forms["login_form"];
    var EMAIL=login_form["email"].value;
    var PASSWORD=login_form["password"].value;
    var TYPE=login_form["type"].value;


    if (EMAIL.length==0) {
        alert("Mời cung cấp Email!");
        login_form["email"].focus();
        return false;
    }
    if (PASSWORD.length==0) {
        alert("Mời cung cấp Mật khẩu!");
        login_form["password"].focus();
        return false;
    }
    if (TYPE.length==0) {
        alert("Mời chọn loại tài khoản!");
        login_form["type"].focus();
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