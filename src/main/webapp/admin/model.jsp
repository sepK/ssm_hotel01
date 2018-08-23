<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("BasePath", request.getContextPath());
    %>
    <title>Title</title>
    <link rel="stylesheet" href="${BasePath }/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${BasePath }/static/css/index.css">
</head>
<body>
<div class="container">
    <div class="row header">
        <div class="col-md-2 header-left"><img src="${BasePath}/static/images/logo.png" alt=""></div>
        <div class="col-md-8 header-center">
            <ul class="ul">
                <li><span class="title">酒店后台管理</span></li>
                <li><input class="search" type="text" name="cusName" id="roomNumber_search_input"
                           placeholder="请输入要查询的用户名"></li>
                <li><span class="glyphicon glyphicon-search" id="room_search_modal_btn"></span></li>
            </ul>
        </div>
        <div class="col-md-2 header-right login">
            <span class="glyphicon glyphicon-user"></span>
            <span class="username">${loginUser.adminname}</span>
        </div>
    </div>
</div>
<div class="content">
    <div class="left">
        <ul class="nav nav-pills">
            <li role="presentation"><a href="${BasePath }/customer/index">会员管理</a></li>
            <li role="presentation"><a href="${BasePath }/room/index02">客房管理</a></li>
            <li role="presentation"><a href="${BasePath }/employee/index03">员工管理</a></li>
            <li role="presentation"><a href="${BasePath }/order/index04">订单管理</a></li>
            <li role="presentation"><a href="${BasePath }/comment/index05">评论管理</a></li>
            <li role="presentation"><a href="${BasePath }/intake/index06">入住管理</a></li>
        </ul>
    </div>
    <div class="right">
        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <button class="btn btn-primary" id="cus_add_modal_btn">新增</button>
                <span class="help-block"></span>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-striped table-bordered" id="cus_table">
                    <thead>
                    <tr>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>性别</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6" id="page_info_area"></div>
            <div class="col-md-6" id="page_nav_area"></div>
        </div>
    </div>
</div>
<script src="${BasePath }/static/js/jquery.js"></script>
<script src="${BasePath }/static/bootstrap/js/bootstrap.js"></script>
</body>
</html>
