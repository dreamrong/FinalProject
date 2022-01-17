function setCookie(cname, cvalue, exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    let expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";

}




function getCookie(cname) {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie() {
    let user = getCookie("username");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
        user = prompt("Please enter your name:", "");
        if (user != "" && user != null) {
            setCookie("username", user, 30);
        }
    }
    checkLoginStatus();
}

function checkLoginStatus() {
    let loginStatus = getCookie("username");
    if (loginStatus == '') {
        $("#status").text("尚未登入");
        $("#status").css('color', 'red');
    } else {
        $("#status").text(loginStatus + "~~您已經登入"+"；身分是:"+getCookie("status"));
        $("#status").css('color', 'green');
        // This text indicates success.
    }


}

function signOutCookie() {
	setCookie("username","");
	setCookie("status","");
	setCookie("account","");
//    document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
//    document.cookie = "status=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
//    document.cookie = "account=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
    $("#status").text("尚未登入");
    checkLoginStatus();
    console.log("清除coockie");

}

function signInCookie() {

    user = prompt("Please enter your name:", "");
    if (user != "" && user != null) {
        setCookie("username", user, 30);
    }

    checkLoginStatus();
}
