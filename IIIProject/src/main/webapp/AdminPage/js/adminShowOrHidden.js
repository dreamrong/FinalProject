$(function(){
    let status=getCookie("status");
    if(status!='admin'){
        $("#isAdmin").hide();
        $("#notAdmin").show();
    } 
})