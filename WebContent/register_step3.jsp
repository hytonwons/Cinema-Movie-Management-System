<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 注册</title>
	<link href="css/bootstrap.min_member.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min_member.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
	<link href="css/register.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span1"></div>
			<div class="span11">
				<a href=""><img src="image/logo_md.png" style="padding:5px 30px 0 0"></img></a>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="span2"></div>
			<div class="span8">
				<div class="steps">
					<ol>
						<li class="active">
							<i>1</i>
							<span>填写注册信息</span>
						</li>
						<li class="active">
							<i>2</i>
							<span>充值激活</span>
						</li>
						<li class="active">
							<i>√</i>
							<span>注册成功</span>
						</li>
					</ol>
				</div>
			</div>
			<div class="span2"></div>
		</div>
		<div class="row">
			<div class="span2"></div>
			<div class="span8" style="text-align:center">
				<br></br>
				<div>
					<h4>您已成为CiNEPLeX的一员！</h4>
					<br />
					<h5 style="font-family:微软雅黑">立刻用您的卡号${ID}去<a href="index.jsp">登录</a></h5>
				</div>				
			</div>
			<div class="span2"></div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min_member.js"></script>
	<script src="js/site.js"></script>
	<%@include file="footer.jsp"%> 
</body>
</html>