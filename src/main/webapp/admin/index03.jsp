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
    <script src="${BasePath }/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${BasePath }/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${BasePath }/static/css/index.css">
    <link rel="shortcut icon" href="${BasePath }/app/favicon.ico" />
    <script src="${BasePath }/static/js/jquery.js"></script>
    <script src="${BasePath }/static/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="modal fade" id="empsUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">房间信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex_update_input1" value="男" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex_update_input2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" name="age" class="form-control" id="age_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">职务</label>
                        <div class="col-sm-10">
                            <input type="text" name="duty" class="form-control" id="duty_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emps_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="empsAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel02">客房信息新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex_add_input1" value="男" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sex_add_input2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" name="age" class="form-control" id="age_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="phone" class="form-control" id="phone_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">职务</label>
                        <div class="col-sm-10">
                            <input type="text" name="duty" class="form-control" id="duty_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emps_add_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row header">
        <div class="col-md-2 header-left"><img src="${BasePath}/static/images/logo.png" alt=""></div>
        <div class="col-md-8 header-center">
            <ul class="ul">
                <li><span class="title">酒店后台管理</span></li>
                <li><input class="search" type="text" name="empName" id="empName_search_input" placeholder="请输入要查询的员工名">
                </li>
                <li><span class="glyphicon glyphicon-search" id="emps_search_modal_btn"></span></li>
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
            <div class="col-md-2 col-md-offset-10">
                <button class="btn btn-primary" id="emps_add_modal_btn">新增</button>
                <span class="help-block"></span>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-striped table-bordered" id="emps_table">
                    <thead>
                    <tr>
                        <th>用户ID</th>
                        <th>用户名称</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>电话</th>
                        <th>职务</th>
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
<!-- 搭建显示页面 -->
<%--<div class="container">
    <ul class="nav nav-pills">
        <li role="presentation"><a href="${BasePath }/customer/index">会员管理</a></li>
        <li role="presentation"><a href="${BasePath }/room/index02">客房管理</a></li>
        <li role="presentation" class="active"><a href="${BasePath }/employee/index03">员工管理</a></li>
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
    <div class="row">
        <div class="col-md-2 col-md-offset-4">
            <input type="text" name="empName" id="empName_search_input" placeholder="请输入要查询的员工名" />
            <span class="help-block"></span>
        </div>
        <div class="col-md-1">
            <button class="btn btn-info" id="emps_search_modal_btn">搜索</button>
            <span class="help-block"></span>
        </div>
        <div class="col-md-2 col-md-offset-3">
            <button class="btn btn-primary" id="emps_add_modal_btn">新增</button>
            <span class="help-block"></span>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered"
                   id="emps_table">
                <thead>
                <tr>
                    <th>用户ID</th>
                    <th>用户名称</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>电话</th>
                    <th>职务</th>
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
        to_page("employees", 1);
    });

    function to_page(method, pn) {
        $.ajax({
            url: "${BasePath}/employee/" + method,
            data: "pn=" + pn,
            type: "GET",
            dataType: "json",
            success: function (result) {
                build_emps_table(result.extend.pageInfo.list);
                build_page_info(result);
                build_page_nav(method, result);
            }
        });
    }

    //生成table表格内容
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        $.each(result, function (index, item) {
            var idTd = $("<td></td>").append(item.id);
            var empNameTd = $("<td></td>").append(item.empName);
            var sexTd = $("<td></td>").append(item.sex);
            var ageTd = $("<td></td>").append(item.age);
            var phoneTd = $("<td></td>").append(item.phone);
            var dutyTd = $("<td></td>").append(item.duty);


            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(idTd).append(empNameTd).append(sexTd)
                .append(ageTd).append(phoneTd).append(dutyTd).append(btnTd)
                .appendTo("#emps_table tbody");
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

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
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

    $("#emps_add_modal_btn").click(function () {
        reset_form("#empsAddModal form");
        $("#empsAddModal").modal({
            backdrop: "static"
        });
    });
    $(document).on("click", ".edit_btn", function () {
        getEmps($(this).attr("edit-id"));

        $("#emps_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#empsUpdateModal").modal({
            backdrop: "static"
        });
    });

    //回显信息
    function getEmps(id) {
        $.ajax({
            url: "${BasePath}/employee/employee/" + id,
            type: "GET",
            success: function (result) {
                var emp = result.extend.emp;
                $("#empName_update_input").val(emp.empName);
                if (emp.sex == "男") {
                    $("#sex_update_input1").attr("checked", "checked");
                } else {
                    $("#sex_update_input2").attr("checked", "checked");
                }
                $("#age_update_input").val(emp.age);
                $("#phone_update_input").val(emp.phone);
                $("#duty_update_input").val(emp.duty);
            }
        });
    }

    //删除会员
    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(1)").text();
        var id = $(this).attr("del-id");
        if (confirm("确认删除【" + empName + "】吗？")) {
            $.ajax({
                url: "${BasePath}/employee/employee/" + id,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page("employees", currentPage);
                }
            });
        }
    });
    $("#emps_update_btn").click(
        function () {
            $.ajax({
                url: "${BasePath}/employee/employee/"
                + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#empsUpdateModal form").serialize(),
                success: function (result) {
                    $("#empsUpdateModal").modal("hide");
                    alert(result.msg);
                    to_page("employees", currentPage);
                }
            });
        });
    $("#emps_add_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        $.ajax({
            url: "${BasePath}/employee/employee",
            type: "POST",
            data: $("#empsAddModal form").serialize(),
            success: function (result) {
                $("#empsAddModal").modal("hide");
                alert(result.msg);
                to_page("emps", totalRecord);
            }
        });
    });
    $("#emps_search_modal_btn").click(function () {
        //empsName_search_input phone_search_input
        $("#emps_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        $.ajax({
            url: "${BasePath}/employee/searchEmps",
            type: "POST",
            data: "empName=" + $("#empName_search_input").val(),
            success: function (result) {
                build_emps_table(result.extend.list);
            }
        });
    });

    function validate_add_form() {
        if ($("#empName_add_input").attr("ajax-va") == "error") {
            return false;
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

    $("#empName_add_input").change(function () {
        $.ajax({
            url: "${BasePath}/employee/checkEmpName",
            type: "GET",
            data: "empName=" + $(this).val(),
            success: function (result) {
                if (result.code == 400) {
                    show_validate_msg("#empName_add_input", "error", "用户名已经存在");
                    $("#empName_add_input").attr("ajax-va", "error");
                } else {
                    show_validate_msg("#empName_add_input", "success", "");
                    $("#empName_add_input").attr("ajax-va", "success");
                }
            }
        });
    });
</script>
</body>
</html>