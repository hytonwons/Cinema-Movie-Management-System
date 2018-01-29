<%@ page language="java" import="model.Plan" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 排片</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-clockpicker.min.css">
	<link rel="stylesheet" type="text/css" href="css/github.min.css">
	<script type="text/javascript">
		function ajaxsubmit(){
			 var params = {
			 	movieName:document.getElementById("movieName").value,
			 	hallNum:document.getElementById("hallNum").value,
				year:document.getElementById("selYear").value,
				month:document.getElementById("selMonth").value,
				day:document.getElementById("selDay").value,
				time:$("#time").val(),
				price:document.getElementById("price").value,
			 };
			 $.ajax({
			    type: "POST",
			    url: "planAjax.action",
			    data: params,
			    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
			    success: function(json){ 
			    	var obj = $.parseJSON(json);  //使用这个方法解析json
					var message = obj.message;
			    	if(message==""){
			    		$('#myModal').modal({
			    			backdrop:'static'
			    		});
			    		$('#myModal').modal('show');
			    	}else{
			    		document.getElementById("waringLabel").innerHTML=message;
						$('#warningModal').modal({
			    			backdrop:'static'
			    		});
						$('#warningModal').modal('show');
			    		//alert(message);
			    	}
			    },
			    error: function(json){
			    	document.getElementById("waringLabel").innerHTML='系统繁忙，请稍后再试！';
					$('#warningModal').modal({
		    			backdrop:'static'
		    		});
					$('#warningModal').modal('show');
			    	//alert("系统繁忙，请稍后再试！");
			    }
			    });
		}
		
		function ajaxTimeTable(){
			var params = {
				 	hallNum:document.getElementById("hallNum").value,
					year:document.getElementById("selYear").value,
					month:document.getElementById("selMonth").value,
					day:document.getElementById("selDay").value,
				 };
				 $.ajax({
				    type: "POST",
				    url: "showplanAjax.action",
				    data: params,
				    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
				    success: function(json){ 
				    	var obj = $.parseJSON(json);
				    	var plan = obj.plan;
				    	var size = plan.length;
				    	//alert(size);
				    	var tab=document.getElementById("timetable");
				    	if(document.getElementById("tableDiv").style.display=="none"){
					    	for(var i=0;i<size;i++){
					    		var row=tab.insertRow();
					    		var col1=row.insertCell();
					    		col1.innerText=plan[i].movieName;
					    		var col2=row.insertCell();
					    		col2.innerText=plan[i].time;
					    		var col3=row.insertCell();
					    		col3.innerText=plan[i].price+"￥";
					    	}
					    	document.getElementById("tableDiv").style.display="block";
				    	}else{
				    		//document.getElementById("tableDiv").style.display="none";
				    		var rowNum=tab.rows.length;
     						for (var i=1;i<rowNum;i++){
        						 tab.deleteRow(i);
        						 rowNum=rowNum-1;
         						 i=i-1;
     						}
				    		for(var i=0;i<size;i++){
					    		var row=tab.insertRow();
					    		var col1=row.insertCell();
					    		col1.innerText=plan[i].movieName;
					    		var col2=row.insertCell();
					    		col2.innerText=plan[i].time;
					    		var col3=row.insertCell();
					    		col3.innerText=plan[i].price+"￥";
					    	}
				    		//document.getElementById("tableDiv").style.display="block";
				    	}
				    },
				    error: function(json){
				    	
				    }
				    });
			}
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
      <img src="image/logo_sm.png" style="padding-top:10px;padding-right:5px"></img>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav"  style="font-size:16px">
        <li><a href="salesman_session" style="font-size:18px">售票</a></li>
		<li class="active"><a href="planactivity_plan" style="font-size:18px">排片</a></li>
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

<br />
<div class="container" id="plan">
		<div class="container">
			<div class="col-md-8">
				<h3 style="font-size:20px;font-weight:bold">制定排映计划</h3>
				<br />
				<form class="form-horizontal">						
					<div class="form-group">
						<label class="col-sm-2 control-label" style="font-size:18px">影片：</label>
						<div class="col-sm-3">
							<select class="form-control" id="movieName">
								<s:iterator value="mp" id="m">
									<option value="<s:property value="#m.name"/>"><s:property value="#m.name" /></option>
								</s:iterator>
							</select> 
						</div>
						<div class="col-sm-7"></div>
					</div>
					<br />
					<div class="form-group">
						<label class="col-sm-2 control-label" style="font-size:18px">厅号：</label>
						<div class="col-sm-2">
							<select class="form-control" id="hallNum">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select> 
						</div>
						<div class="col-sm-8"></div>
					</div>
					<br />
					<div class="form-group">
						<label class="col-sm-2 control-label" style="font-size:18px">日期：</label>
						<div class="col-sm-2">
							<select class="form-control" id="selYear"></select>	
						</div>
						<div class="col-sm-2">
							<select class="form-control" id="selMonth"></select>	
						</div>
						<div class="col-sm-2">
							<select class="form-control" id="selDay"></select>	
						</div>
						<div class="col-sm-4"></div>										
					</div>
					<br />	
					<div class="form-group">
						<label class="col-sm-2 control-label" style="25px;font-size:18px">时间：</label>
						<div class="col-sm-3">
							<div class="input-group clockpicker">
								<input id="time" type="text" class="form-control" readonly="readonly" value="09:30">
								<span class="input-group-addon">修改</span>
							</div>
						</div>
						<div class="col-sm-5" style="padding-top:5px">
							<a href="javascript:ajaxTimeTable()" style="font-size:12px">点击查看该日该厅已制定的放映计划</a>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<br />
					<div class="form-group">
						<label class="col-sm-2 control-label" style="font-size:18px">票价：</label>
						<div class="col-sm-2">
							<select class="form-control" id="price">
								<option value="60">60￥</option>
								<option value="70">70￥</option>
								<option value="80">80￥</option>
								<option value="90">90￥</option>
								<option value="100">100￥</option>
							</select> 
						</div>
						<div class="col-sm-8"></div>
					</div>
					<br />
					<div class="form-group">
						<!-- 用ajax后button的type必须改成button不能使用submit -->
						<div class="col-sm-7"></div>
						<div class="col-sm-5">
							<button type="button" class="btn btn-danger" style="width:80px" onclick="ajaxsubmit()">提&nbsp;交</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4">
				<br />
				<div id="tableDiv" style="display:none">
					<h4>该日该厅已制定的放映计划如下：</h4>
			    	<table class="table table-hover" id="timetable">
					<thead>
						<tr style="font-size:20px">
							<th>片名</th>
							<th>开始时间</th>
							<th>票价</th>
						</tr>
					</thead>
						<tr>
						</tr>
					<tbody>
						
					</tbody>
				</table>
				</div>
			</div>
		</div>		
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:350px">
		<div class="modal-content">
			<div class="modal-header">
				<h4></h4>
			</div>
			<div class="modal-body">
				<br />
				<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label" style="font-weight:normal;font-size:20px">&nbsp;&nbsp;&nbsp;您已成功地制定了一场排映计划！</label>
				</div>
				<br />
				<div class="form-group">
					<div class="col-sm-offset-8 col-sm-4">
						<button type="button" class="btn btn-primary" style="width:80px" onclick="window.location.href='planactivity_plan'">确&nbsp;认</button>
					</div>
				</div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="warningModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:350px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4></h4>
			</div>
			<div class="modal-body">
				<br />
				<form class="form-horizontal">
				<div class="form-group">
					<label id="waringLabel" class="col-sm-offset-2 control-label" style="font-weight:normal;font-size:20px"></label>
				</div>
				<br />
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script type="text/javascript" src="js/year_month_day.js"></script>
<script type="text/javascript"> 
var selYear = window.document.getElementById("selYear"); 
var selMonth = window.document.getElementById("selMonth"); 
var selDay = window.document.getElementById("selDay"); 
// 新建一个DateSelector类的实例，将三个select对象传进去 
var myDate = new Date();
var currentYear = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
var currentMonth = myDate.getMonth()+1;    //获取当前月份(0-11,0代表1月)
var currentDate = myDate.getDate(); 
new DateSelector(selYear, selMonth, selDay, currentYear, currentMonth, currentDate);  
</script> 
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-clockpicker.min.js"></script>

<script type="text/javascript">
$('.clockpicker').clockpicker()
	.find('input').change(function(){
		console.log(this.value);
	});
var input = $('#single-input').clockpicker({
	placement: 'bottom',
	align: 'left',
	autoclose: true,
	'default': 'now'
});

$('.clockpicker-with-callbacks').clockpicker({
		donetext: 'Done',
		init: function() { 
			console.log("colorpicker initiated");
		},
		beforeShow: function() {
			console.log("before show");
		},
		afterShow: function() {
			console.log("after show");
		},
		beforeHide: function() {
			console.log("before hide");
		},
		afterHide: function() {
			console.log("after hide");
		},
		beforeHourSelect: function() {
			console.log("before hour selected");
		},
		afterHourSelect: function() {
			console.log("after hour selected");
		},
		beforeDone: function() {
			console.log("before done");
		},
		afterDone: function() {
			console.log("after done");
		}
	})
	.find('input').change(function(){
		console.log(this.value);
	});

// Manually toggle to the minutes view
$('#check-minutes').click(function(e){
	// Have to stop propagation here
	e.stopPropagation();
	input.clockpicker('show')
			.clockpicker('toggleView', 'minutes');
});
if (/mobile/i.test(navigator.userAgent)) {
	$('input').prop('readOnly', true);
}
</script>
<script type="text/javascript" src="js/highlight.min.js"></script>
<script type="text/javascript">
hljs.configure({tabReplace: '    '});
hljs.initHighlightingOnLoad();
</script>
</body>
</html>