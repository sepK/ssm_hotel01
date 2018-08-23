<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<div class="modal fade" id="intakeUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">入住信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" id="id_update_input" readonly="readonly"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="roomid" class="form-control" id="roomid_update_input"
                                   readonly="readonly"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="cusname" class="form-control" id="cusname_update_input"
                                   readonly="readonly"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="datetime" name="startTime" class="form-control" id="startTime_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-10">
                            <input type="datetime" name="endTime" class="form-control" id="endTime_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">消费</label>
                        <div class="col-sm-10">
                            <input type="text" name="money" class="form-control" id="money_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="intake_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="intakeAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel02">订单信息新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="roomid" class="form-control" id="roomid_add_input"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客户名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="cusname" class="form-control" id="cusname_add_input"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="datetime" name="startTime" class="form-control" id="startTime_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-10">
                            <input type="datetime" name="endTime" class="form-control" id="endTime_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">消费</label>
                        <div class="col-sm-10">
                            <input type="text" name="money" class="form-control" id="money_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="intake_add_btn">保存</button>
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
                <li><input class="search" type="text" name="cusname" id="cusname_search_input" placeholder="请输入要查询的用户名">
                </li>
                <li><span class="glyphicon glyphicon-search" id="intake_search_modal_btn"></span></li>
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
                <button class="btn btn-primary" id="intake_add_modal_btn">新增</button>
                <span class="help-block"></span>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-striped table-bordered" id="intake_table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>房间ID</th>
                        <th>客户名称</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>消费</th>
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
<%--<div class="container">
    <ul class="nav nav-pills">
        <li role="presentation"><a href="${BasePath }/customer/index">会员管理</a></li>
        <li role="presentation"><a href="${BasePath }/room/index02">客房管理</a></li>
        <li role="presentation"><a href="${BasePath }/employee/index03">员工管理</a></li>
        <li role="presentation"><a href="${BasePath }/order/index04">订单管理</a></li>
        <li role="presentation"><a href="${BasePath }/comment/index05">评论管理</a></li>
        <li role="presentation" class="active"><a href="${BasePath }/intake/index06">入住管理</a></li>
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
            <input type="text" name="cusname" id="cusname_search_input" placeholder="请输入要查询的用户名" />
            <span class="help-block"></span>
        </div>
        <div class="col-md-1">
            <button class="btn btn-info" id="intake_search_modal_btn">搜索</button>
            <span class="help-block"></span>
        </div>
        <div class="col-md-2 col-md-offset-3">
            <button class="btn btn-primary" id="intake_add_modal_btn">新增</button>
            <span class="help-block"></span>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered"
                   id="intake_table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>房间ID</th>
                    <th>客户名称</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>消费</th>
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
        to_page("intakes", 1);
    });

    function to_page(method, pn) {
        $.ajax({
            url: "${BasePath}/intake/" + method,
            data: "pn=" + pn,
            type: "GET",
            dataType: "json",
            success: function (result) {
                build_intake_table(result.extend.pageInfo.list);
                build_page_info(result);
                build_page_nav(method, result);
            }
        });
    }

    //生成table表格内容
    function build_intake_table(result) {
        $("#intake_table tbody").empty();
        $.each(result, function (index, item) {
            var idTd = $("<td></td>").append(item.id);
            var cusnameTd = $("<td></td>").append(item.cusname);
            var roomidTd = $("<td></td>").append(item.roomid);
            var startTimeTd = $("<td></td>").append(item.startTime);
            var endTimeTd = $("<td></td>").append(item.endTime);
            var moneyTd = $("<td></td>").append(item.money);


            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(idTd).append(roomidTd).append(cusnameTd)
                .append(startTimeTd).append(endTimeTd).append(moneyTd).append(btnTd)
                .appendTo("#intake_table tbody");
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

    $("#intake_add_modal_btn").click(function () {
        reset_form("#intakeAddModal form");
        $("#intakeAddModal").modal({
            backdrop: "static"
        });
    });
    $(document).on("click", ".edit_btn", function () {
        getIntake($(this).attr("edit-id"));

        $("#intake_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#intakeUpdateModal").modal({
            backdrop: "static"
        });
    });

    //回显信息
    function getIntake(id) {
        $.ajax({
            url: "${BasePath}/intake/intake/" + id,
            type: "GET",
            success: function (result) {
                var intake = result.extend.intake;
                $("#cusname_update_input").val(intake.cusname);
                $("#id_update_input").val(intake.id);
                $("#roomid_update_input").val(intake.roomid);
                $("#startTime_update_input").val(intake.startTime);
                $("#endTime_update_input").val(intake.endTime);
                $("#money_update_input").val(intake.money);
            }
        });
    }

    //删除
    $(document).on("click", ".delete_btn", function () {
        var id = $(this).attr("del-id");
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${BasePath}/intake/intake/" + id,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page("intakes", currentPage);
                }
            });
        }
    });
    //更新
    $("#intake_update_btn").click(
        function () {
            $.ajax({
                url: "${BasePath}/intake/intake/"
                + $(this).attr("edit-id"),
                type: "PUT",
                data: $("#intakeUpdateModal form").serialize(),
                success: function (result) {
                    if (result.code == 200) {
                        $("#intakeUpdateModal").modal("hide");
                    }
                    alert(result.msg);
                    to_page("intakes", currentPage);
                }
            });
        });
    //添加
    $("#intake_add_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        $.ajax({
            url: "${BasePath}/intake/intake",
            type: "POST",
            data: $("#intakeAddModal form").serialize(),
            success: function (result) {
                if (result.code == 400) {
                } else {
                    $("#intakeAddModal").modal("hide");
                }
                alert(result.msg);
                to_page("intakes", totalRecord);
            }
        });
    });
    //搜索
    $("#intake_search_modal_btn").click(function () {
        $("#intake_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        $.ajax({
            url: "${BasePath}/intake/searchIntakes",
            type: "GET",
            data: "cusname=" + $("#cusname_search_input").val(),
            success: function (result) {
                build_intake_table(result.extend.intakes);
            }
        });
    });

    function validate_add_form() {
        /*if ($("#roomNumber_add_input").attr("ajax-va") == "error") {
            return false;
        }*/
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
</script>
</body>
</html>