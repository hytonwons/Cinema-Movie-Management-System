<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//在head中<base href>指定basePath
%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 登录</title>
	<link href="css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/css_sprite.css" rel="stylesheet">
	<script src="js/jquery-1.7.2.min.js"></script>	
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<!-- <a href="<%=basePath %>index.jsp">首页</a> -->
<div class="header_">
  <h1 class="headerLogo"><a href="<%=basePath %>index.jsp"><img alt="logo" src="image/logo.png"></a></h1>
</div>

<div class="banner_">
	<div class="login-aside">
		<div id="o-box-up"></div>
		<div id="o-box-down"  style="table-layout:fixed;">
			<form class="form-horizontal" method="post" action="login">
				<div class="form-group" id="error_msg">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<span id="error" class=" control-label" style="color:red;font-weight:bold;font-size:16px">${message}</span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" style="font-weight:bold;font-size:15px;font-family:微软雅黑">卡号</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="user.ID">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" style="font-weight:bold;font-size:15px;font-family:微软雅黑">密码</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="user.password">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-6" style="padding-top:7px">
						<a href="register_step1.jsp" style="font-weight:bold;font-family:微软雅黑">还没有账号，去注册</a>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="submit" class="btn btn-primary" style="width:80px;padding-top:7px;font-size:15px;font-weight:bold;font-family:微软雅黑">登&nbsp;录</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>