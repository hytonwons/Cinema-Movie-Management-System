<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 会员查询</title>
	<link href="css/searchContent.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="css/dataTables.bootstrap.css" />
    
	<script src="js/jquery-1.7.2.min.js"></script>	
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.js"></script>
	<script src="js/dataTables.bootstrap.js"></script>
	
	<script>
		    $(document).ready(function() {
		    	ordering: false,
				$("#pay_table").dataTable( {
					language: {
						lengthMenu: '<select class="form-control input-xsmall">' + '<option value="5">5</option>' + '<option value="10">10</option>' + '<option value="20">20</option>' + '<option value="30">30</option>' + '<option value="40">40</option>' + '<option value="50">50</option>' + '</select>条记录',//左上角的分页大小显示。
		                processing: "载入中",//处理页面数据的时候的显示
		                paginate: {//分页的样式文本内容。
							previous: "上一页",
		                    next: "下一页",
		                    first: "首页",
		                    last: "末页"
		                },
		                
						zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
						
						//下面三者构成了总体的左下角的内容。
		                info: "总共_PAGES_ 页，显示第_START_ 到第 _END_ ，筛选之后得到 _TOTAL_ 条，初始_MAX_ 条 ",//左下角的信息显示，大写的词为关键字。
		                infoEmpty: "0条记录",//筛选为空时左下角的显示。
		                infoFiltered: ""//筛选之后的左下角筛选提示(另一个是分页信息显示，在上面的info中已经设置，所以可以不显示)，
		            }
				});
				$("#consume_table").dataTable( {
					ordering: false,
					language: {
						lengthMenu: '<select class="form-control input-xsmall">' + '<option value="5">5</option>' + '<option value="10">10</option>' + '<option value="20">20</option>' + '<option value="30">30</option>' + '<option value="40">40</option>' + '<option value="50">50</option>' + '</select>条记录',//左上角的分页大小显示。
		                processing: "载入中",//处理页面数据的时候的显示
		                paginate: {//分页的样式文本内容。
							previous: "上一页",
		                    next: "下一页",
		                    first: "首页",
		                    last: "末页"
		                },
		                
						zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
						
						//下面三者构成了总体的左下角的内容。
		                info: "总共_PAGES_ 页，显示第_START_ 到第 _END_ ，筛选之后得到 _TOTAL_ 条，初始_MAX_ 条 ",//左下角的信息显示，大写的词为关键字。
		                infoEmpty: "0条记录",//筛选为空时左下角的显示。
		                infoFiltered: ""//筛选之后的左下角筛选提示(另一个是分页信息显示，在上面的info中已经设置，所以可以不显示)，
		            }
				});
			} );
	</script>
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
      <img src="image/logo_sm.png" style="padding-top:5px;padding-right:5px"></img>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav"  style="font-size:16px">
        <li><a href="salesman_session" style="font-size:18px">售票</a></li>
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

<div class="container">
	<div class="col-md-6">
		<div class="profile-header">
			<div class="profile-header-main">
				<div class="top">
					<label class="control-label" style="font-size:18px">会员信息</label>
				</div>
				<div class="content">
					<div class="form-group">
						<div class="row">
						<label class="col-sm-2">姓名：</label>
						<label class="col-sm-4">${ri.familyName}${gender}</label>
						<label class="col-sm-2">手机：</label>
						<label class="col-sm-4">${ri.telephone}</label>
						</div>
					</div>	
					<div class="form-group">
						<div class="row">
						<label class="col-sm-2">卡号：</label>
						<label class="col-sm-4">${ri.ID}</label>
						<label class="col-sm-2">类型：</label>
						<label class="col-sm-4">${cardType}</label>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
						<label class="col-sm-2">积分：</label>
						<label class="col-sm-4">${ri.point}</label>
						<div class="col-sm-6"></div>
						</div>
					</div>			
				</div>
			</div>
		</div>
	</div>
</div>

<br></br>
<div class="container">
	<div class="col-md-8">
		<ul id="myTab" class="nav nav-tabs" style="font-size:18px">
		<li class="active">
			<a href="#pay" data-toggle="tab">TA的缴费记录</a>
		</li>
		<li><a href="#consume" data-toggle="tab">TA的消费记录</a></li>
		</ul>
		
		<div id="myTabContent" class="tab-content">
			<div class="tab-content">
				<div class="tab-pane fade in active" id="pay">
				<br />
					<div class="container">
						<div class="col-md-8">
					<table id="pay_table" class="table table-hover">
						<thead>
							<tr style="font-size:18px">
								<th>缴费金额</th>
								<th>缴费日期</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="p" id="p">
							<tr>
								<td><s:property value="#p.money"/>￥</td>
								<td><s:date name="#p.date" format="yyyy-MM-dd"/></td>
							</tr>
							</s:iterator>
						</tbody>
					</table>									
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade" id="consume">
					<br />
					<div class="container">
						<div class="col-md-8">
					<table id="consume_table" class="table table-hover">
						<thead>
							<tr style="font-size:18px">
								<th>消费金额</th>
								<th>观看电影</th>
								<th>消费日期</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="c" id="c">
							<tr>
								<td><s:property value="#c.money"/>￥</td>
								<td><s:property value="#c.movieName"/></td>
								<td><s:date name="#c.date" format="yyyy-MM-dd"/></td>
							</tr>
							</s:iterator>
						</tbody>
					</table>									
						</div>
					</div>
				</div>
				</div>
		</div>
	</div>
</div>
</body>
</html>