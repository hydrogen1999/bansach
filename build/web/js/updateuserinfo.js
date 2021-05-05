/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function updateUserInfo() {
    var updateuserinfo = document.forms["updateuserinfo"];
    var USER_NAME = updateuserinfo["USER_NAME"].value;
    var PHONE = updateuserinfo["PHONE"].value;
    var PASSWORD = updateuserinfo["PASSWORD"].value;
    var REPEAT_PASS = updateuserinfo["REPEAT_PASSWORD"].value;
    
    if (USER_NAME.length == 0) {
        alert("Please provide your full name!");
        updateuserinfo["USER_NAME"].focus();
        return false;
    }
    if (PHONE.length == 0) {
        alert("Please provide your phone!");
        updateuserinfo["PHONE"].focus();
        return false;
    }
    if (PASSWORD.length == 0) {
        alert("Please provide your password!");
        PASSWORD = updateuserinfo["PASSWORD"].focus();
        return false;
    }
    if (REPEAT_PASS.length == 0) {
        alert("Enter your password again!");
        updateuserinfo["REPEAT_PASSWORD"].focus();
        return false;
    }
   
    if (PASSWORD != REPEAT_PASS) {
        alert("Mật khẩu không trùng khớp");
        return false;
    }
    return true;
};


