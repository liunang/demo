var loginObj = NT.namespace("loginObj");
loginObj.login = function () {
    this.ajaxLogin = function (username, password) {
        var util = new NT.utilObj.util();
        util.emmAjax({
            url: './login.action',
            data: {"userName": username, "pwd": password},
            success: function (data) {
                var obj = eval('(' + data + ')');
                if (obj.success == 'true') {
                    window.location = "./main.html";
                } else {
                	util.msg(obj.data);
                }
            },
        });
    };
};

$(function () {
    var login = new NT.loginObj.login();
    $("#submit1").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        login.ajaxLogin(username, $.md5(password));
    });
    $("#systemAppBtn").click(function () {
    	$("#erWeiMaModal").modal("show");
    });
    

});


$(document).ready(function () {
    var theWindow = $(window);

    function resized() {
    	var msg = "您的浏览器可能缩放了，如果不能查看全部内容，请按下F11键";
    	layer.msg(msg,{
    		offset: '20px',
    		time: 8000
    	});  	
    }
    theWindow.resize(function () {
        resized();
    }).trigger('resize');
});


document.onkeydown = onEnterDown;

function onEnterDown(e) {
    var login = new NT.loginObj.login();
    var keycode;
    if (navigator.appName == "Microsoft Internet Explorer") {
        keycode = event.keyCode;
    } else {
        keycode = e.which;
    }
    if (keycode == "13") {
        var username = $("#username").val();
        var password = $("#password").val();
        login.ajaxLogin(username, $.md5(password));
    }
}
	
	
