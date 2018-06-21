/**
 * Created by Administrator on 2017/7/7.
 */
$(function () {
    var account=$("#account");
    var pwd=$("#pwd");
    var sign=$("#btnSign");

    account.on('focus',function () {
        $("#valiAccount").text("请输入学号/手机号");
    });
    account.on('blur',function () {
        $("#valiAccount").text("");
    });
    pwd.on('focus',function () {
        $("#valiPwd").text("密码为6位");
    });
    pwd.on('blur',function () {
        $("#valiPwd").text("");
    });

    sign.on('click',function () {
        //alert(account.val());
        if(account.val()==""){
            $("#valiAccount").text("请输入学号/手机号");
        }
        if(account.val().length<10&&account.val().length>1){
            $("#valiAccount").text("请确认重新输入！");
        }

        if(pwd.val().length>8||account.val().length<4){
            $("#valiPwd").text("请确认重新输入！");
        }

        if((account.val()=="2511150329"&&pwd.val()=="123456")||(account.val()=="2511150330"&&pwd.val()=="abcdef")){
            alert("登录成功");
        }
    });

});
