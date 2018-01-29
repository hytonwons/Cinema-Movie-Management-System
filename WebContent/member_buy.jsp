<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 购票</title>
	<link href="css/bootstrap.min_member.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min_member.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
</head>
<body>
	<div class="container">
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<div class="nav-collapse">
							<ul class="nav" style="height:40px">
								<li>
									<img src="image/logo_sm.png" style="padding:5px 30px 0 18px"></img>
								</li>
								<li class="active">
									<a href="member_buy.action" style="font-size:18px;padding-top:15px">购票</a>
								</li>
								<li>
									<a href="member_activity.action" style="font-size:18px;padding-top:15px">参加活动</a>
								</li>
								<li>
									<a href="member_handle.action" style="font-size:18px;padding-top:15px">会员管理</a>
								</li>
							</ul>
							<ul class="nav pull-right">
								<li class="dropdown">
      								<a class="dropdown-toggle" data-toggle="dropdown" href="#" style="padding-top:15px;font-family:微软雅黑">
        								 我的账号 <b class="caret"></b>
     								</a>
      								<ul class="dropdown-menu">
       								  <li>
										<a href="member_settings.action" style="padding-top:5px;font-family:微软雅黑">设置</a>
									  </li>
									  <li>
									 	<a href="logout.action" style="padding-top:5px;font-family:微软雅黑">退出</a>
									 </li>
     							   </ul>
   								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="span2">
					<div class="well" style="padding: 10px 10px;width:200px;position:fixed;">
						<ul class="nav nav-list">
							<li class="nav-header" style="height:30px;font-size:18px">
								CiNEPLeX
							</li>
							<li class="active" style="height:30px;">
								<a href="member_buy.action" style="padding-left:40px;font-family:微软雅黑">选座购票</a>
							</li>
							<li style="height:30px;">
								<a href="member_activity.action" style="padding-left:40px;font-family:微软雅黑">参加活动</a>
							</li>
							<li class="nav-header" style="height:30px;font-size:18px">
								个人账号
							</li>
							<li style="height:30px;">
								<a href="member_handle.action" style="padding-left:40px;font-family:微软雅黑">充值/激活/取消</a>
							</li>
							<li style="height:30px;">
								<a href="member_settings.action" style="padding-left:40px;font-family:微软雅黑">设置</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="span1"></div>
				<div class="span9">
					<div class="row">
						<div class="span7"></div>
						<div class="span2">
							<div id="a">
								<script>setInterval("a.innerHTML=new Date().toLocaleString()+'<br>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay())",500)
								</script>
							</div>
						</div>
					</div>				
					<h4 style="font-size:20px">
						正在热映（今日上映${MovieNum}部影片，共${sessionNum}场）
					</h4>
					<br />
					<s:iterator value="m" id="m">
					<div class="row">
						<div class="span2" id="movie_pic">
							<a href="member_showSession.action?MovieName=<s:property value="#m.name"/>"><img src="image/<s:property value="#m.ID"/>.jpg"></img></a>
						</div>
						<div class="span5" id="movie_intro">
							<h4><a href="member_showSession.action?MovieName=<s:property value="#m.name"/>"><s:property value="#m.name"/></a></h4>
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">类型：</span>
								<span style="font-weight:normal"><s:property value="#m.type"/></span>
							</h5>
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">导演：</span>
								<span style="font-weight:normal"><s:property value="#m.director"/></span>
							</h5>
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">主演：</span>
								<span style="font-weight:normal"><s:property value="#m.actor"/></span>
							</h5>
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">时长：</span>
								<span style="font-weight:normal"><s:property value="#m.length"/>分钟</span>
							</h5>
						</div>
						<div class="span2"></div>
						<HR style="FILTER: progid:DXImageTransform.Microsoft.Glow(color=#987cb9,strength=10)" width="80%" color=#987cb9 SIZE=1>
						<br />
					</div>
					</s:iterator>
				</div>
			</div>
		</div>
		<%@include file="footer.jsp"%> 
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/site.js"></script>
</body>
</html>