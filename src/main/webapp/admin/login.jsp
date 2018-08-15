<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	pageContext.setAttribute("BasePath", request.getContextPath());
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>
	<div class="container-fluid-full">
		<div class="row-fluid">
			<div class="row-fluid">
				<div class="login-box">
					<h2>Login to your account</h2>
					<form class="form-horizontal" action="${BasePath }/checkInfo" method="post" >
					<fieldset>
						<input class="input-large span12" name="username" id="username"
							type="text" placeholder="请输入用户名" /> <input
							class="input-large span12" name="password" id="password"
							type="password" placeholder="请输入密码" />
						<div class="clearfix"></div>
						<label class="remember" for="remember"><input
							type="checkbox" id="remember" />记住账号</label>
						<div class="clearfix"></div>
						<button type="submit" class="btn btn-primary span12">登陆</button>
					</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>