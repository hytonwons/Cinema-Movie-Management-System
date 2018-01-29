<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 逐月统计</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
	<link href="css/affix.css" rel="stylesheet">
	<script src="js/jquery-1.7.2.min.js"></script>	
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/highcharts-3D.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript" src="js/chart.js"></script>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
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
      <img src="image/logo_sm.png" style="padding-top:10px;padding-right:15px"></img>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav"  style="font-size:18px">
        <li><a href="manager_approve.action">批准放映计划</a></li>
		<li class="active"><a href="manager_chart.action">逐月统计</a></li>
		<li><a href="manager_movie.action">影片管理</a></li>
      </ul>
      <ul class="nav navbar-nav pull-right" style="font-size:15px">
		<li><a href="index.jsp">退出</a></li>
	  </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>

<br></br>
<div class="container">
    <div class="row">
        <div class="col-md-2" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125" style="font-family:微软雅黑">
                <li class="active"><a href="#chart-1">会员信息</a></li>
                <li><a href="#chart-2">消费信息</a></li>
                <li><a href="#chart-3">会员卡使用信息</a></li>
                <li><a href="#chart-4">上座率信息</a></li>
                <li><a href="#chart-5">购票信息</a></li>
            </ul>
        </div>
		<div class="col-md-1"></div>
        <div class="col-md-9">
			<div id="chart-1">
				<h3 style="font-weight:bold;border-left:5px solid #cc3333;">&nbsp;&nbsp;会员信息</h3>
				<h4 style="font-weight:bold;padding-left:30px;padding-top:20px">
					<span>性别</span>
					<span style="padding-left:370px">年龄</span>
				</h4>
				<div class="row">
					<input type="hidden" id="manData" value="${gender.man}" />
					<input type="hidden" id="womanData" value="${gender.woman}" />
					<div id="genderpie" class="col-md-5" style="margin-top:100px;height:280px"></div>
					<div class="col-md-1"></div>
					<input type="hidden" id="Data10" value="${age.teens}" />
					<input type="hidden" id="Data20" value="${age.twenties}" />
					<input type="hidden" id="Data30" value="${age.thirties}" />
					<input type="hidden" id="Data40" value="${age.forties}" />
					<input type="hidden" id="Data50" value="${age.fifties}" />
					<input type="hidden" id="Data60" value="${age.elderly}" />
					<div id="ageColumn-drilldown" class="col-md-6" style="margin-top:30px;width:420px;height:400px"></div>
				</div>
			</div>
			<br></br>
			<div id="chart-2">
				<h3 style="font-weight:bold;border-left:5px solid #cc3333;">&nbsp;&nbsp;消费信息</h3>
				<input type="hidden" id="consumeDateData" value="${thirtyDateString}" />
				<input type="hidden" id="consumeData" value="${consumeString}" />
				<div id="consume" style="margin-top:50px"></div>
			</div>
			<br></br>
			<div id="chart-3">
				<h3 style="font-weight:bold;border-left:5px solid #cc3333;">&nbsp;&nbsp;会员卡使用信息</h3>
				<h4 style="font-weight:bold;padding-left:30px;padding-top:20px">
					<span>会员卡类型分布</span>
					<span style="padding-left:300px">卡有效/停止/暂停/取消情况</span>
				</h4>
				<div class="row">
					<input type="hidden" id="diamondData" value="${vip.diamond}" />
					<input type="hidden" id="goldData" value="${vip.gold}" />
					<input type="hidden" id="silverData" value="${vip.silver}" />
					<div id="vipTypePie" class="col-md-5" style="margin-top:30px;height:250px"></div>
					<div class="col-md-1"></div>
					<input type="hidden" id="validData" value="${valid.valid}" />
					<input type="hidden" id="cancelData" value="${valid.cancel}" />
					<input type="hidden" id="pauseData" value="${valid.pause}" />
					<input type="hidden" id="stopData" value="${valid.stop}" />
					<div id="vipConditionPie" class="col-md-6" style="margin-top:10px;height:300px"></div>
				</div>
			</div>
			<br></br>
			<div id="chart-4">
				<h3 style="font-weight:bold;border-left:5px solid #cc3333;">&nbsp;&nbsp;上座率信息</h3>
				<input type="hidden" id="totalDateData" value="${thirtyDateString}" />
				<input type="hidden" id="totalData" value="${totalPeopleString}" />
				<div id="totalNum" style="margin-top:50px"></div>
				<div class="row">
					<div class="col-md-1"></div>
					<input type="hidden" id="hallDateData" value="${sevenDateString}" />
					<input type="hidden" id="hall1Data" value="${hall1String}" />
					<input type="hidden" id="hall2Data" value="${hall2String}" />
					<input type="hidden" id="hall3Data" value="${hall3String}" />
					<input type="hidden" id="hall4Data" value="${hall4String}" />
					<input type="hidden" id="hall5Data" value="${hall5String}" />
					<div id="hall" class="col-md-10" style="margin-top:50px"></div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<input type="hidden" id="movieDateData" value="${sevenDateString}" />
					<input type="hidden" id="movie1Data" value="${movie1String}" />
					<input type="hidden" id="movie2Data" value="${movie2String}" />
					<input type="hidden" id="movie3Data" value="${movie3String}" />
					<input type="hidden" id="movie4Data" value="${movie4String}" />
					<input type="hidden" id="movie5Data" value="${movie5String}" />
					<div id="movie" class="col-md-10" style="margin-top:50px"></div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<br></br>
			<div id="chart-5">
				<h3 style="font-weight:bold;border-left:5px solid #cc3333;">&nbsp;&nbsp;购票信息</h3>
				<div class="row">
					<div class="col-md-2"></div>
					<input type="hidden" id="cardData" value="${cc.card}" />
					<input type="hidden" id="cashData" value="${cc.cash}" />
					<div class="col-md-7" id="buypie" style="margin-top:30px;width:450px;height:300px"></div>
					<div class="col-md-3"></div>
				</div>
			</div>
			<br></br>
		</div>
	</div>
</div>
</body>
</html>