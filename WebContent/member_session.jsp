<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 购票</title>
	<link href="css/bootstrap.min_member.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min_member.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
	<link href="css/timetable.css" rel="stylesheet">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/site.js"></script>

</head>
	<body>
		<div class="container">
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<div class="nav-collapse collapse">
							<ul class="nav navbar-nav" style="height:40px">
								<li>
									<img src="image/logo_sm.png" style="padding:5px 30px 0 18px"></img>
								</li>
								<li class="active">
									<a href="member_buy.action" style="font-size:18px;padding-top:15px">购票</a>
								</li>
								<li>
									<a href="member_activity.action" style="font-size:18px;padding-top:15px">设置</a>
								</li>
								<li class="dropdown">
									<a href="member_handle.action" style="font-size:18px;padding-top:15px">会员管理</a>
								</li>
							</ul>
							<ul class="nav pull-right">
								<li class="dropdown">
      								<a class="dropdown-toggle" data-toggle="dropdown"  href="#" style="padding-top:15px;font-family:微软雅黑">
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
						${m.name}（今日上映${SessionNum}场）
					</h4>
					<div class="row">
						<div class="span3">
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">导演：</span>
								<span style="font-weight:normal">${m.director}</span>
							</h5>
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">类型：</span>
								<span style="font-weight:normal">${m.type}</span>
							</h5>
						</div>
						<div class="span5">
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">主演：</span>
								<span style="font-weight:normal">${m.actor}</span>
							</h5>
							<h5 style="font-family:微软雅黑">
								<span style="font-weight:bold">时长：</span>
								<span style="font-weight:normal">${m.length}分钟</span>
							</h5>
						</div>
						<div class="span1"></div>
					</div>
					<br />
					<div class="row">
					<div class="span7">
					<table class="playtime">
						<tbody>
							<s:iterator value="s" id="s">
							<tr>
								<td class="t1">
									<div class="p_r">
										<p class="ci_p_time"><s:property value="#s.startTime"/></p>
									</div>
								</td>
								<td>
									<div class="p_r">
										<p><s:property value="#s.hallNum"/>号厅</p>
									</div>
								</td>
								<td>
									<div class="p_r">
										<p>剩余<s:property value="#s.leftSeat"/>座</P>
									</div>
								</td>
								<td>
									<div class="p_r">
										<p class="newprice"><s:property value="#s.price"/>￥</p>
									</div>
								</td>
								<td>
									<div class="b_">
										<button type="button" class="btn btn-primary" style="font-family:微软雅黑" onclick="window.location.href='member_seat.action?sessionID=<s:property value="#s.ID"/>'">选座购票</button>
									</div>
								</td>
							</tr>
							</s:iterator>
						</tbody>
					</table>	
					</div>
					<div class="span2"></div>
					</div>
				</div>
			</div>
		</div>	
	<%@include file="footer.jsp"%> 
	</body>
</html>