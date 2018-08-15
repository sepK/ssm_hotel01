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
    <script type="text/javascript"
            src="${BasePath }/static/js/jquery-3.2.1.min.js"></script>
    <link href="${BasePath }/static/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">
    <script src="${BasePath }/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="modal fade" id="roomUpdateModal" tabindex="-1" role="dialog"
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
                        <label class="col-sm-2 control-label">客房类型</label>
                        <div class="col-sm-10">
                            <input type="text" name="type" class="form-control" id="type_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间价格</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="price_update_input" >
                        </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客房状态</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="status">
                                <option value="0">空闲</option>
                                <option value="1">预定</option>
                                <option value="2">入住</option>
                                <option value="3">退房</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客房介绍</label>
                        <div class="col-sm-10">
                            <input type="text" name="introduce" class="form-control" id="introduce_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客房号</label>
                        <div class="col-sm-10">
                            <input type="text" name="roomNumber" class="form-control"
                                   id="roomNumber_update_input"> <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="room_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="roomAddModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
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
                        <label class="col-sm-2 control-label">客房类型</label>
                        <div class="col-sm-10">
                            <input type="text" name="type" class="form-control" id="type_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间价格</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="price_add_input" >
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客房状态</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="status">
                                <option value="0">空闲</option>
                                <option value="1">预定</option>
                                <option value="2">入住</option>
                                <option value="3">退房</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客房介绍</label>
                        <div class="col-sm-10">
                            <input type="text" name="introduce" class="form-control" id="introduce_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">客房号</label>
                        <div class="col-sm-10">
                            <input type="text" name="roomNumber" class="form-control" id="roomNumber_add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="room_add_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 搭建显示页面 -->
<div class="container">
    <ul class="nav nav-pills">
        <li role="presentation"><a href="${BasePath }/customer/index">会员管理</a></li>
        <li role="presentation" class="active"><a href="${BasePath }/room/index02">客房管理</a></li>
        <li role="presentation"><a href="${BasePath }/index03">供应商管理</a></li>
        <li role="presentation"><a href="${BasePath }/index04">商品管理</a></li>
        <li role="presentation"><a href="${BasePath }/index05">宠物管理</a></li>
        <li role="presentation"><a href="${BasePath }/index06">订单管理</a></li>
    </ul>
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>酒店后台管理</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-2">
            <select id="status_search_select">
                <option value="0">空闲房间</option>
                <option value="1">预定房间</option>
                <option value="2">入住房间</option>
                <option value="3">正在退房的房间</option>
            </select>

        </div>

        <div class="col-md-2 col-md-offset-2">
            <input type="text" name="roomNumber" id="roomNumber_search_input" placeholder="请输入要查询的房间号" />
            <span class="help-block"></span>
        </div>
        <div class="col-md-1">
            <button class="btn btn-info" id="room_search_modal_btn">搜索</button>
            <span class="help-block"></span>
        </div>
        <div class="col-md-2 col-md-offset-3">
            <button class="btn btn-primary" id="room_add_modal_btn">新增</button>
            <span class="help-block"></span>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered"
                   id="room_table">
                <thead>
                <tr>
                    <th>客房ID</th>
                    <th>客房类型</th>
                    <th>客房价格</th>
                    <th>客房状态</th>
                    <th>房间介绍</th>
                    <th>房间号</th>
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
<script type="text/javascript">
    var totalRecord, currentPage;
    $(function () {
        to_page("rooms", 1);
    });

    function to_page(method, pn) {
        $.ajax({
            url: "${BasePath}/room/" + method,
            data: "pn=" + pn,
            type: "GET",
            dataType: "json",
            success: function (result) {
                build_room_table(result.extend.pageInfo.list);
                build_page_info(result);
                build_page_nav(method, result);
            }
        });
    }

    //生成table表格内容
    function build_room_table(result) {
        $("#room_table tbody").empty();
        $.each(result, function (index, item) {
            var idTd = $("<td></td>").append(item.id);
            var typeTd = $("<td></td>").append(item.type);
            var priceTd = $("<td></td>").append(item.price);
            var statusTd = $("<td></td>").append(item.status == 0?"空闲": item.status == 1?"预定": item.status == 2?"入住":"退房");
            var introduceTd = $("<td></td>").append(item.introduce);
            var roomNumberTd = $("<td></td>").append(item.roomNumber);


            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append(
                $("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(idTd).append(typeTd).append(priceTd)
                .append(statusTd).append(introduceTd).append(roomNumberTd).append(btnTd)
                .appendTo("#room_table tbody");
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

    $("#room_add_modal_btn").click(function () {
        reset_form("#roomAddModal form");
        $("#roomAddModal").modal({
            backdrop: "static"
        });
    });
    $(document).on("click", ".edit_btn", function () {
        getRoom($(this).attr("edit-id"));

        $("#room_update_btn").attr("edit-id", $(this).attr("edit-id"));
        $("#roomUpdateModal").modal({
            backdrop: "static"
        });
    });

    //回显信息
    function getRoom(id) {
        $.ajax({
            url: "${BasePath}/room/room/" + id,
            type: "GET",
            success: function (result) {
                var room = result.extend.room;
                $("#type_update_input").val(room.type);
                $("#price_update_input").val(room.price);
                $("#status_update_input").val(room.status );
                $("#roomNumber_update_input").val(room.roomNumber);
                $("#introduce_update_input").val(room.introduce);
                $("#roomUpdateModal select").val(room.status);
            }
        });
    }

    //删除会员
    $(document).on("click", ".delete_btn", function () {
        var roomNumber = $(this).parents("tr").find("td:eq(5)").text();
        var id = $(this).attr("del-id");
        if (confirm("确认删除【" + roomNumber + "】吗？")) {
            $.ajax({
                url: "${BasePath}/room/room/" + id,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page("rooms", currentPage);
                }
            });
        }
    });
    $("#room_update_btn").click(
        function () {
            $.ajax({
                url: "${BasePath}/room/room/"
                + $(this).attr("edit-id"),
                type: "POST",
                data: $("#roomUpdateModal form").serialize(),
                success: function (result) {
                    $("#roomUpdateModal").modal("hide");
                    alert(result.msg);
                    to_page("rooms", currentPage);
                }
            });
        });
    $("#room_add_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        $.ajax({
            url: "${BasePath}/room/room",
            type: "POST",
            data: $("#roomAddModal form").serialize(),
            success: function (result) {
                $("#roomAddModal").modal("hide");
                alert(result.msg);
                to_page("rooms", totalRecord);
            }
        });
    });
    $("#room_search_modal_btn").click(function () {
        //roomName_search_input phone_search_input
        $("#room_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        $.ajax({
            url: "${BasePath}/room/searchRoom",
            type: "POST",
            data: "roomNumber=" + $("#roomNumber_search_input").val(),
            success: function (result) {
                build_room_table(result.extend.list);
            }
        });
    });

    function validate_add_form() {
        if ($("#roomNumber_add_input").attr("ajax-va") == "error") {
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
    $("#roomNumber_add_input").change(function () {
        $.ajax({
            url:"${BasePath}/room/checkRoomNumber",
            type:"POST",
            data:"roomNumber="+$(this).val(),
            success:function (result) {
                   if(result.code == 400){
                       show_validate_msg("#roomNumber_add_input","error","客房号存在");
                       $("#roomNumber_add_input").attr("ajax-va", "error");
                   }else{
                       show_validate_msg("#roomNumber_add_input","success","");
                       $("#roomNumber_add_input").attr("ajax-va", "success");
                   }
            }
        });
    });
    $("#status_search_select").change(function () {
        $("#room_table tbody").empty();
        $("#page_info_area").empty();
        $("#page_nav_area").empty();
        $.ajax({
            url: "${BasePath}/room/searchByStatus",
            type: "POST",
            data: "status="+$(this).val(),
            success: function (result) {
                build_room_table(result.extend.list);
            }
        });
    });
</script>
</body>
</html>