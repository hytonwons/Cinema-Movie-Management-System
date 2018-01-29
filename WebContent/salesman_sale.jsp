<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 售票</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" media="all">
	<script src="js/jquery-1.7.2.min.js"></script>	
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <img src="image/logo_sm.png" style="padding-top:10px;padding-right:5px"></img>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav"  style="font-size:16px">
        <li class="active"><a href="salesman_session" style="font-size:18px">售票</a></li>
		<li><a href="planactivity_plan" style="font-size:18px">排片</a></li>
        <li><a href="planactivity_activity" style="font-size:18px">制定活动</a></li>
      </ul>
      <form class="navbar-form navbar-left" method="post" action="salesman_query" onsubmit="return validate_content();">
        <div class="form-group">
          <input type="text" size='25' class="form-control" value="请输入会员ID或手机号" id="search_content" name="search_content" onblur="if(this.value=='') this.value='请输入会员ID或手机号'" onfocus="if(this.value =='请输入会员ID或手机号' ) this.value=''">
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
      <ul class="nav navbar-nav pull-right" style="font-size:15px">
		<li><a href="index.jsp">退出</a></li>
	  </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>

<br />
<div class="container" id="timeLine">
	<div class="col-md-9"></div>
	<div class="col-md-2">
		<div id="a"><script>setInterval("a.innerHTML=new Date().toLocaleString()+'<br>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay())",500)</script></div>
	</div>
	<div class="col-md-1"></div>
</div>

<div class="container" id="timetable">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#movie" data-toggle="tab" style="font-size:18px">按影片热度</a>
			</li>
			<li><a href="#time" data-toggle="tab" style="font-size:18px">按时间顺序</a></li>
			<li style="float:right"></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-content">
				<div class="tab-pane fade in active" id="movie">
					<br />
					<table class="table table-hover">
						<thead>
							<tr style="font-size:20px">
								<th>片名</th>
								<th>开始时间</th>
								<th>厅号</th>
								<th>剩余座位</th>
								<th>票价</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="listByPopularity" id="p">
							<tr style="font-size:18px">
								<td><s:property value="#p.movieName"/></td>
								<td><s:property value="#p.startTime"/></td>
								<td><s:property value="#p.hallNum"/>号厅</td>
								<td><s:property value="#p.leftSeat"/></td>
								<td><s:property value="#p.price"/>￥</td>
								<td><button type="button" class="btn btn-primary" onclick="window.location.href='salesman_showSeat.action?sessionID=<s:property value="#p.ID"/>'">购买</button></td>
							</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="time">
					<br />
					<table class="table table-hover">
						<thead>
							<tr style="font-size:20px">
								<th>片名</th>
								<th>开始时间</th>
								<th>厅号</th>
								<th>剩余座位</th>
								<th>票价</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="listByTime" id="time">
							<tr style="font-size:18px">
								<td><s:property value="#time.movieName"/></td>
								<td><s:property value="#time.startTime"/></td>
								<td><s:property value="#time.hallNum"/>号厅</td>
								<td><s:property value="#time.leftSeat"/></td>
								<td><s:property value="#time.price"/>￥</td>
								<td><button type="button" class="btn btn-primary" onclick="window.location.href='<%=basePath %>salesman_showSeat.action?sessionID=<s:property value="#time.ID"/>'">购买</button></td>
							</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</div>
</body>
</html>