<%@ page import="com.github.pagehelper.Page" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% pageContext.setAttribute("BasePath", request.getContextPath()); %>
    <title>后台界面</title>
    <script type="text/javascript" src="${BasePath }/static/js/jquery-3.2.1.min.js"></script>
    <link href="${BasePath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${BasePath }/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${BasePath }/static/css/index.css">
    <link rel="shortcut icon" href="${BasePath }/app/favicon.ico" />
    <script src="${BasePath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${BasePath }/static/js/jquery.js"></script>
    <script src="${BasePath }/static/bootstrap/js/bootstrap.js"></script>
    <%--<script src="${BasePath }/static/js/ajaxFileUpLoad.js"></script>--%>
</head>
<body>
<div class="modal fade" id="photoUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改照片</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" id="id_update_input" readonly="readonly">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="roomId" class="form-control" id="roomId_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">照片</label>
                        <div class="col-sm-10">
                            <input type="file" name="file" class="form-control" id="file">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="photo_update_btn">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="photoAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel02">会员新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" enctype="multipart/form-data" id="add_form" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间ID</label>
                        <div class="col-sm-10">
                            <input type="text" name="roomId" class="form-control" id="roomId_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">照片</label>
                        <div class="col-sm-10">
                            <input type="file" name="file" class="form-control" id="picture_add_input">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="photo_add_btn">保存</button>
                    </div>
                </form>
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
                <li><input class="search" type="text" name="roomId" id="roomId_search_input" placeholder="请输入要查询的房间号">
                </li>
                <li><span class="glyphicon glyphicon-search" id="photo_search_modal_btn"></span></li>
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
                <button class="btn btn-primary" id="photo_add_modal_btn">新增</button>
                <span class="help-block"></span>
            </div>
        </div>
        <!-- 显示表格数据 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-striped table-bordered" id="photo_table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>房间ID</th>
                        <th>照片</th>
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
</body>
<script type="text/javascript">
    var totalRecord, currentPage;
    $(function () {
        to_page("photos", 1);
    });

    function to_page(method, pn) {
        $.ajax({
            url: "${BasePath}/photo/" + method,
            data: "pn=" + pn,
            type: "GET",
            dataType: "json",
            success: function (result) {
                build_photo_table(result.extend.pageInfo.list);
                build_page_info(result);
                build_page_nav(method, result);
            }
        });
    }

    //生成table表格内容
    function build_photo_table(result) {
        $("#photo_table tbody").empty();
        $.each(result, function (index, item) {
            var idTd = $("<td></td>").append(item.id);
            var roomIdTd = $("<td></td>").append(item.roomId);
            var pictureTd = "<td><img src=${BasePath}" + item.picture + " style='width:50px;height:25px' /></td>"

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(idTd).append(roomIdTd).append(pictureTd).append(btnTd)
                .appendTo("#photo_table tbody");
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

    $("#photo_add_modal_btn").click(function () {
        reset_form("#photoAddModal form");
        $("#photoAddModal").modal({
            backdrop: "static"
        });
    });
    $(document).on("click", ".edit_btn", function () {
        getPhoto($(this).attr("edit-id"));

        $("#photo_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#photoUpdateModal").modal({
            backdrop: "static"
        });
    });

    //回显会员信息
    function getPhoto(id) {
        $.ajax({
            url: "${BasePath}/photo/photo/" + id,
            type: "GET",
            success: function (result) {
                var photo = result.extend.photo;
                $("#roomId_update_input").val(photo.roomId);
                $("#id_update_input").val(photo.id);
            }
        });
    }

    //删除会员
    $(document).on("click", ".delete_btn", function () {
        var id = $(this).attr("del-id");
        if (confirm("确认删除吗？")) {
            $.ajax({
                url: "${BasePath}/photo/photo/" + id,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page("photos", currentPage);
                }
            });
        }
    });

    $("#photo_update_btn").click(function () {
        var formData = new FormData();
        formData.append("file", $("#file")[0].files[0]);
        formData.append("id", $("#id_update_input").val());
        formData.append("roomId", $("#roomId_update_input").val());
        $.ajax({
            url: "${BasePath}/photo/photo",
            type: "POST",
            data: formData,
            dataType: "json",
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                if (result.code == 200) {
                    $("#photoUpdateModal").modal("hide");
                    to_page("photos", currentPage);
                }
                alert(result.msg);
            }
        });
    });
    //photo_add_btn
    $("#photo_add_btn").click(function () {
        var formData = new FormData();
        formData.append("file", $("#picture_add_input")[0].files[0]);
        formData.append("roomId", $("#roomId_add_input").val());
        $.ajax({
            url: "${BasePath}/photo/addPhoto",
            type: "POST",
            data: formData,
            dataType: "json",
            cache: false,
            processData: false,
            contentType: false,
            success: function (result) {
                if (result.code == 200) {
                    $("#photoAddModal").modal("hide");
                    to_page("photos", totalRecord);
                }
                alert(result.msg);
            }
        });
    });
    $("#photo_search_modal_btn").click(function () {
        $("#photo_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        $.ajax({
            url: "${BasePath}/photo/searchPhotos",
            type: "GET",
            data: "roomId=" + $("#roomId_search_input").val(),
            success: function (result) {
                build_photo_table(result.extend.list);
            }
        });
    });
</script>
</html>
