<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 影片管理</title>
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
        <li><a href="manager_approve.action">批准放映计划</a></li>
		<li><a href="manager_chart.action">逐月统计</a></li>
		<li class="active"><a href="">影片管理</a></li>
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
		<div class="col-md-1"></div>
		<div class="col-md-7">
			<div class="row" id="">
				<form class="form-horizontal" action="" method="post">
					<fieldset>
					<legend style="font-family:宋体;font-weight:bold">影片上线</legend>
						<div class="form-group">
      						<label class="col-sm-2 control-label" style="font-size:18px">片名：</label>
     						 <div class="col-sm-4">
        						 <input type="text" class="form-control" id="name">
      						</div>
   						</div>
   						<div class="form-group">
      						<label class="col-sm-2 control-label" style="font-size:18px">导演：</label>
     						 <div class="col-sm-4">
        						 <input type="text" class="form-control" id="director">
      						</div>
   						</div>
   						<div class="form-group">
      						<label class="col-sm-2 control-label" style="font-size:18px">主演：</label>
     						 <div class="col-sm-4">
        						 <input type="text" class="form-control" id="actor">
      						</div>
   						</div>
   						<div class="form-group">
      						<label class="col-sm-2 control-label" style="font-size:18px">类型：</label>
     						 <div class="col-sm-4">
        						 <input type="text" class="form-control" id="type">
      						</div>
   						</div>
   						<div class="form-group">
      						<label class="col-sm-2 control-label" style="font-size:18px">时长：</label>
     						 <div class="col-sm-2">
        						 <input type="text" class="form-control" id="length">
      						</div>
   						</div>
   						<div class="form-group">
      						<div class="col-sm-offset-7 col-sm-5">
        						 <button type="button" class="btn btn-primary" onclick="addMovie()">确&nbsp;定</button>
     						 </div>
  						 </div>
					</fieldset>
				</form>
			</div>
			<div class="row" id="">
				<form class="form-horizontal">
					<fieldset>
					<legend style="font-family:宋体;font-weight:bold">影片下线</legend>
						<div class="form-group">
      						<label class="col-sm-3 control-label" style="font-size:18px">选择影片：</label>
     						 <div class="col-sm-3">
        						 <select class="form-control" id="removeMovieName">
        						 	<s:iterator value="m" id="m">
        								<option value="<s:property value="#m.ID"/>"><s:property value="#m.name"/></option>
      								</s:iterator>
      							</select>
      						</div>
   						</div>
   						<div class="form-group">
      						<div class="col-sm-offset-7 col-sm-5">
        						 <button type="button" class="btn btn-primary" onclick="removeMovie()">下&nbsp;线</button>
     						 </div>
  						 </div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
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
								<button type="button" class="btn btn-primary" style="font-size:18px" onclick="window.location.href='manager_movie.action'">确定</button>
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
	function removeMovie(){
		var movieID = document.getElementById("removeMovieName").value;
		var params = {
			   	ID:movieID,
		};
		$.ajax({
			    type: "POST",
			    url: "removeMovieAjax.action",
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
	
	function addMovie(){
		var name=$("#name").val();
		var director=$("#director").val();
		var actor=$("#actor").val();
		var type=$("#type").val();
		var length=$("#length").val();
		var params = {
				name:name,
				director:director,
				actor:actor,
				type:type,
				length:length,
		};
		$.ajax({
			    type: "POST",
			    url: "addMovieAjax.action",
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
</script>
</body>
</html>