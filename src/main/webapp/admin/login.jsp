<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台界面</title>
    <%
        pageContext.setAttribute("BasePath", request.getContextPath());
    %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Login Form Template</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="${BasePath }/static/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${BasePath }/static/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${BasePath }/static/assets/css/form-elements.css">
    <link rel="stylesheet" href="${BasePath }/static/assets/css/style.css">

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${BasePath }/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="${BasePath }/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="${BasePath }/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="${BasePath }/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${BasePath }/static/assets/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>欢迎登陆</strong></h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <p>请输入你的账号和密码:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" class="login-form" id="login_form">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">adminname</label>
                                <input type="text" name="adminname" placeholder="请输入用户名"
                                       class="form-username form-control" id="form-username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">Password</label>
                                <input type="password" name="password" placeholder="请输入密码"
                                       class="form-password form-control" id="form-password">
                            </div>
                            <button type="button" class="btn" id="login_btn">登陆</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Javascript -->
<script src="${BasePath }/static/assets/js/jquery-1.11.1.min.js"></script>
<script src="${BasePath }/static/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${BasePath }/static/assets/js/jquery.backstretch.min.js"></script>
<script src="${BasePath }/static/assets/js/scripts.js"></script>
<script>
    $("#login_btn").click(function () {
        $.ajax({
            url: "${BasePath}/adminLogin",
            type: "POST",
            dataType: "json",
            data: $("#login_form").serialize(),
            success: function (result) {
                if (result.code == 400) {
                    alert("用户密码错误或者用户不存在");
                    window.location.href = "${BasePath}/login";
                } else {
                    window.location.href = "${BasePath}/customer/index";
                }
            }
        });
    });

</script>
</body>

</html>