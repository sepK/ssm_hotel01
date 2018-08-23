<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台界面</title>
    <%
        pageContext.setAttribute("BasePath", request.getContextPath());
    %>
    <script type="text/javascript" src="${BasePath }/static/js/jquery-3.2.1.min.js"></script>
    <link href="${BasePath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${BasePath }/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${BasePath }/static/css/index.css">
    <link rel="shortcut icon" href="${BasePath }/app/favicon.ico" />
    <script src="${BasePath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${BasePath }/static/js/jquery.js"></script>
    <script src="${BasePath }/static/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="modal fade" id="cusUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">会员修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="customerName" class="form-control"
                                   id="cusName_update_input"> <span class="help-block"></span>
                        </div>
                    </div>
                    <input type="hidden" name="password" id="password_update_input"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex_update_input1" value="男" checked="checked">
                                男
                            </label> <label class="radio-inline">
                            <input type="radio" name="sex" id="sex_update_input2" value="女"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="mail" class="form-control"
                                   id="email_update_input"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control"
                                   id="phone_update_input"> <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="cus_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="cusAddModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel02">会员新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="customerName" class="form-control"
                                   id="cusName_add_input"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control"
                                   id="cusPassWord_add_input"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"> <input type="radio"
                                                                name="sex" id="sex_add_input1" value="男"
                                                                checked="checked">
                                男
                            </label> <label class="radio-inline"> <input type="radio"
                                                                         name="sex" id="sex_add_input2" value="女"> 女
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="mail" class="form-control"
                                   id="email_add_input"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control"
                                   id="phone_add_input"> <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-5">
                            <input type="text" name="verifyCode" class="form-control"
                                   placeholder="请输入验证码" id="verifyCode_add_input"/> <span
                                class="help-block"></span>
                        </div>
                        <div class="col-sm-5">
                            <img src="${BasePath}/customer/verifyCode" onclick="myRefersh(this)"
                                 id="img_add"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="cus_add_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 搭建显示页面 -->
<div class="container">
    <div class="row header">
        <div class="col-md-2 header-left"><img src="${BasePath}/static/images/logo.png" alt=""></div>
        <div class="col-md-8 header-center">
            <ul class="ul">
                <li><span class="title">酒店后台管理</span></li>
                <li><input class="search" type="text" name="cusName" id="cusName_search_input" placeholder="请输入要查询的用户名">
                </li>
                <li><span class="glyphicon glyphicon-search" id="cus_search_modal_btn"></span></li>
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
            <li role="presentation"><a href="${BasePath }/photo/index07">客房照片管理</a></li>
        </ul>
    </div>
    <div class="right">
        <div class="row">
            <%--<div class="col-md-2 col-md-offset-4">
                <input type="text" name="cusName" id="cusName_search_input" placeholder="请输入要查询的用户名">
                <span class="help-block"></span>
            </div>
            <div class="col-md-1">
                <button class="btn btn-info" id="cus_search_modal_btn">搜索</button>
                <span class="help-block"></span>
            </div>--%>
            <div class="col-md-2 col-md-offset-10">
                <button class="btn btn-primary" id="cus_add_modal_btn">新增</button>
                <span class="help-block"></span>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-striped table-bordered"
                       id="cus_table">
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

        <!-- 显示分页信息 -->
        <div class="row">
            <!--分页文字信息  -->
            <div class="col-md-6" id="page_info_area"></div>
            <!-- 分页条信息 -->
            <div class="col-md-6" id="page_nav_area"></div>
        </div>
    </div>
</div>
<%-- <ul class="nav nav-pills">
     <li role="presentation" class="active"><a href="${BasePath }/customer/index">会员管理</a></li>
     <li role="presentation"><a href="${BasePath }/room/index02">客房管理</a></li>
     <li role="presentation"><a href="${BasePath }/employee/index03">员工管理</a></li>
     <li role="presentation"><a href="${BasePath }/order/index04">订单管理</a></li>
     <li role="presentation"><a href="${BasePath }/comment/index05">评论管理</a></li>
     <li role="presentation"><a href="${BasePath }/intake/index06">入住管理</a></li>
 </ul>
 <!-- 标题 -->
 <div class="row">
     <div class="col-md-12">
         <h1>酒店后台管理</h1>
     </div>
 </div>

 <!-- 按钮 -->
 <div class="right">
     <div class="row">
         <div class="col-md-2 col-md-offset-4">
             <input type="text" name="cusName" id="cusName_search_input"
                    placeholder="请输入要查询的用户名"> <span class="help-block"></span>
         </div>
         <!-- <div class="col-md-2">
         <input type="text" name="phone"  id="phone_search_input" placeholder="请输入要查询的电话">
         <span class="help-block"></span>
     </div> -->
         <div class="col-md-1">
             <button class="btn btn-info" id="cus_search_modal_btn">搜索</button>
             <span class="help-block"></span>
         </div>
         <div class="col-md-2 col-md-offset-3">
             <button class="btn btn-primary" id="cus_add_modal_btn">新增</button>
             <span class="help-block"></span>
         </div>
     </div>
     <!-- 显示表格数据 -->
     <div class="row">
         <div class="col-md-12">
             <table class="table table-hover table-striped table-bordered"
                    id="cus_table">
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

     <!-- 显示分页信息 -->
     <div class="row">
         <!--分页文字信息  -->
         <div class="col-md-6" id="page_info_area"></div>
         <!-- 分页条信息 -->
         <div class="col-md-6" id="page_nav_area"></div>
     </div>
 </div>--%>

<script type="text/javascript">
    var totalRecord, currentPage;
    $(function () {
        to_page("customers", 1);
    });

    function to_page(method, pn) {
        $.ajax({
            url: "${BasePath}/customer/" + method,
            data: "pn=" + pn,
            type: "GET",
            dataType: "json",
            success: function (result) {
                build_cus_table(result.extend.pageInfo.list);
                build_page_info(result);
                build_page_nav(method, result);
            }
        });
    }

    //生成table表格内容
    function build_cus_table(result) {
        $("#cus_table tbody").empty();
        $.each(result, function (index, item) {
            var idTd = $("<td></td>").append(item.id);
            var cusNameTd = $("<td></td>").append(item.customerName);
            var sexTd = $("<td></td>").append(item.sex);
            var emailTd = $("<td></td>").append(item.mail);
            var phoneTd = $("<td></td>").append(item.phone);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(idTd).append(cusNameTd).append(sexTd)
                .append(emailTd).append(phoneTd).append(btnTd)
                .appendTo("#cus_table tbody");
        });
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append(
            "当前" + result.extend.pageInfo.pageNum + "页,总"
            + result.extend.pageInfo.pages + "页,总"
            + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function build_page_nav(method, result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append(
            $("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append(
            $("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(method, 1);
            });
            prePageLi.click(function () {
                to_page(method, result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append(
            $("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append(
            $("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(method, result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(method, result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            if (item != 0) {
                var numLi = $("<li></li>")
                    .append($("<a></a>").append(item));
                if (result.extend.pageInfo.pageNum == item) {
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(method, item);
                });
                ul.append(numLi);
            }
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    $("#cus_add_modal_btn").click(function () {
        reset_form("#cusAddModal form");
        myRefersh(document.getElementById("img_add"));
        $("#cusAddModal").modal({
            backdrop: "static"
        });
    });
    $(document).on("click", ".edit_btn", function () {
        getCus($(this).attr("edit-id"));

        $("#cus_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#cusUpdateModal").modal({
            backdrop: "static"
        });
    });

    //回显会员信息
    function getCus(id) {
        $.ajax({
            url: "${BasePath}/customer/customer/" + id,
            type: "GET",
            success: function (result) {
                var cus = result.extend.customer;
                $("#password_update_input").val(cus.password);
                $("#phone_update_input").val(cus.phone);
                $("#sex_update_input").val(cus.sex);
                $("#cusName_update_input").val(cus.customerName);
                $("#email_update_input").val(cus.mail);
            }
        });
    }

    //删除会员
    $(document).on("click", ".delete_btn", function () {
        var cusName = $(this).parents("tr").find("td:eq(1)").text();
        var id = $(this).attr("del-id");
        if (confirm("确认删除【" + cusName + "】吗？")) {
            $.ajax({
                url: "${BasePath}/customer/customer/" + id,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page("customers", currentPage);
                }
            });
        }
    });
    $("#cus_update_btn").click(
        function () {
            $.ajax({
                url: "${BasePath}/customer/customer/"
                + $(this).attr("edit-id"),
                type: "POST",
                data: $("#cusUpdateModal form").serialize(),
                success: function (result) {
                    $("#cusUpdateModal").modal("hide");
                    alert(result.msg);
                    to_page("customers", currentPage);
                }
            });
        });
    $("#cus_add_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        $.ajax({
            url: "${BasePath}/customer/customer",
            type: "POST",
            data: $("#cusAddModal form").serialize(),
            success: function (result) {
                $("#cusAddModal").modal("hide");
                alert(result.msg);
                to_page("customers", totalRecord);
            }
        });
    });
    $("#cus_search_modal_btn").click(function () {
        //cusName_search_input phone_search_input
        $("#cus_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        $.ajax({
            url: "${BasePath}/customer/searchCus",
            type: "POST",
            data: "cusName=" + $("#cusName_search_input").val(),
            success: function (result) {
                build_cus_table(result.extend.list);
            }
        });
    });

    function validate_add_form() {
        //1、拿到要校验的数据，使用正则表达式
        if ($("#cusName_add_input").attr("ajax-va") == "error") {
            return false;
        }
        if ($("#verifyCode_add_input").attr("ajax-va") == "error") {
            return false;
        }
        var cusName = $("#cusName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(cusName)) {
            show_validate_msg("#cusName_add_input", "error",
                "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        } else {
            show_validate_msg("#cusName_add_input", "success", "");
        }
        ;

        //2、校验邮箱信息
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        //3.校验电话信息
        var phone = $("#phone_add_input").val();
        var regPhone = /^1[3|4|5|8]\d{9}$/;
        if (!regPhone.test(phone)) {
            show_validate_msg("#phone_add_input", "error", "您输入的电话号码格式不正确");
            return false;
        } else {
            show_validate_msg("#phone_add_input", "success", "");
        }
        return true;
    }

    //显示校验结果的提示信息
    function show_validate_msg(ele, status, msg) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#cusName_update_input").change(function () {
        //cusName_update_input
        checkName("#cusName_update_input");
    });
    $("#cusName_add_input").change(function () {
        checkName("#cusName_add_input");
    });

    function checkName(element) {
        var cusName = $(element).val();
        $.ajax({
            url: "${BasePath}/customer/checkName",
            data: "cusName=" + cusName,
            type: "POST",
            success: function (result) {
                if (result.code == 400) {
                    show_validate_msg(element, "error", "用户名已存在");
                    $(element).attr("ajax-va", "error");
                } else {
                    show_validate_msg(element, "success", "用户名可用");
                    $(element).attr("ajax-va", "success");
                }
            }
        });
    }

    $("#verifyCode_add_input").change(
        function () {
            var verifyCode = $("#verifyCode_add_input").val();
            $.ajax({
                url: "${BasePath}/customer/checkVerifyCode",
                type: "POST",
                data: "verifyCode=" + verifyCode,
                success: function (result) {
                    if (result.code == 400) {
                        show_validate_msg("#verifyCode_add_input",
                            "error", "验证码错误");
                        $("#verifyCode_add_input").attr("ajax-va",
                            "error");
                    } else {
                        show_validate_msg("#verifyCode_add_input",
                            "success", "");
                        $("#verifyCode_add_input").attr("ajax-va",
                            "success");
                    }
                }
            });
        });

    function myRefersh(e) {
        const source = e.src; // 获得原来的 src 中的内容
        var index = source.indexOf("?"); // 从 source 中寻找 ? 第一次出现的位置 (如果不存在则返回 -1 )
        if (index > -1) { // 如果找到了 ?  就进入内部
            var s = source.substring(0, index); // 从 source 中截取 index 之前的内容 ( index 以及 index 之后的内容都被舍弃 )
            var date = new Date(); // 创建一个 Date 对象的 一个 实例
            var time = date.getTime(); // 从 新创建的 Date 对象的实例中获得该时间对应毫秒值
            e.src = s + "?time=" + time; // 将 加了 尾巴 的 地址 重新放入到 src 上
        } else {
            var date = new Date();
            e.src = source + "?time=" + date.getTime();
        }
    }
</script>
</body>
</html>