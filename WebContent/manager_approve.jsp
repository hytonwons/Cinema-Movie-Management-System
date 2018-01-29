<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 批准放映计划</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" media="all">
	
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
      <img src="image/logo_sm.png" style="padding-top:10px;padding-right:15px"></img>
    </div>

	
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav"  style="font-size:18px">
        <li class="active"><a href="manager_approve.action">批准放映计划</a></li>
		<li><a href="manager_chart.action">逐月统计</a></li>
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
		<div class="col-md-9"></div>
		<div class="col-md-2">
			<div id="a"><script>setInterval("a.innerHTML=new Date().toLocaleString()+'<br>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay())",500);</script></div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<h3 style="padding-left:15px;font-size:20px;font-weight:bold">待审核的放映计划如下：</h3>
			<br />
			<div id="table" style="padding-left:35px">
				<table class="table table-bordered" id="timetable">
					<thead style="font-size:18px">
						<tr>
							<th>日期</th>
							<th>厅号</th>
							<th>时间</th>
							<th>影片</th>
							<th>票价</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="plan" id="p">
						<tr>
							<td><s:date name="#p.date" format="yyyy-MM-dd"/></td>
							<td><s:property value="#p.hallNum"/></td>
							<td><s:property value="#p.time"/></td>
							<td><s:property value="#p.movieName"/></td>
							<td><s:property value="#p.price"/>￥</td>
							<td><a onclick="modify(<s:property value="#p.ID"/>)" href="javascript:void(0)">修改</a>
							<a onclick="removeAjax(<s:property value="#p.ID"/>)" href="javascript:void(0)">删除</a>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<br />
			<div class="form-group">
				<div class="col-sm-1" style="padding-left:20px">
					<button type="button" class="btn btn-danger" style="font-size:18px" onclick="submitAjax()">批&nbsp;准</button>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" 
								data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel" style="font-weight:bold;color:white">修改排映计划</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal">
							<br />
							<label id="ID" style="display:none"></label>
							<div class="form-group">
								<div class="col-sm-1"></div>
								<label class="col-sm-2 control-label" style="padding-left:25px;font-size:18px">时间：</label>
								<div class="col-sm-3">
									<input id="time" type="text" class="form-control" value="">
								</div>
								<div class="col-sm-6"></div>
							</div>
							<br />
							<div class="form-group">
								<div class="col-sm-1"></div>
								<label class="col-sm-2 control-label" style="padding-left:25px;font-size:18px">票价：</label>
								<div class="col-sm-2">
									<input id="price" type="text" class="form-control" value="">
								</div>
								<label class="col-sm-1 control-label" style="font-size:18px">￥</label>
								<div class="col-sm-6"></div>
							</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" style="font-size:18px" onclick="modifyAjax()">提交更改</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>	
			
			<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" 
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<br />
							<div class="form-group">
								<div class="col-sm-1"></div>
								<label id="messageLabel" class="col-sm-8 control-label" style="padding-left:25px;font-size:18px"></label>
							</div>
							<br />
							<div class="form-group">
								<div class="col-sm-9"></div>
								<button type="button" class="btn btn-primary" style="font-size:18px" onclick="window.location.href='manager_approve.action'">确定</button>
							</div>
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function modify(ID){
		//alert(ID);
		document.getElementById("ID").innerHTML = ID;
		//document.getElementById("time").value = time;
		//document.getElementById("price").value = price;
		var params = {
		   	ID:ID,
		};
		$.ajax({
		    type: "POST",
		    url: "showModifyAjax.action",
		    data: params,
		    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
		    success: function(json){ 
		    	var obj = $.parseJSON(json);  //使用这个方法解析json
		    	var plan = obj.plan;
		    	document.getElementById("time").value = plan.time;
				document.getElementById("price").value = plan.price;
				$('#myModal').modal({
	    			backdrop:'static'
	    		});
				$('#myModal').modal('show');
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
	
	function modifyAjax(){
		//alert(ID);
		var ID = document.getElementById("ID").innerHTML;
		var time = $("#time").val();
		var price = $("#price").val();
		var params = {
		   	ID:ID,
		   	time:time,
		   	price:price,
		};
		$.ajax({
		    type: "POST",
		    url: "manager_modifyAjax.action",
		    data: params,
		    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
		    success: function(json){ 
		    	//var obj = $.parseJSON(json);  //使用这个方法解析json
		    	//var plan = obj.plan;
		    	window.location.href='manager_approve.action';
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
	
	function removeAjax(ID){
		var params = {
			   	ID:ID,
			};
			$.ajax({
			    type: "POST",
			    url: "removeAjax.action",
			    data: params,
			    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
			    success: function(json){ 
			    	var obj = $.parseJSON(json);  //使用这个方法解析json
			    	var message = obj.message;
			    	document.getElementById("messageLabel").innerHTML = message;
			    	$('#messageModal').modal({
		    			backdrop:'static'
		    		});
			    	$('#messageModal').modal('show');
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
	
	function submitAjax(){
		$.ajax({
		    type: "POST",
		    url: "checkAjax.action",
		   	dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
		    success: function(json){ 
		    	//var obj = $.parseJSON(json);  //使用这个方法解析json
		    	//var plan = obj.plan;
		    	window.location.href='manager_approve.action';
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
</script>
</body>
		
</html>