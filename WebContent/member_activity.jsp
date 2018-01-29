<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 参加活动</title>
	<link href="css/bootstrap.min_member.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min_member.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
</head>
<body>
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
								<li>
									<a href="member_buy.action" style="font-size:18px;padding-top:15px">购票</a>
								</li>
								<li class="active">
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
							<li style="height:30px;">
								<a href="member_buy.action" style="padding-left:40px;font-family:微软雅黑">选座购票</a>
							</li>
							<li class="active" style="height:30px;">
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
					<h4>
						<span>通知：</span>
						<span style="font-weight:normal">您可以通过参加活动获得积分，积分可以兑换成卡内金额。</span>
					</h4>
					<h4>
						<span style="font-weight:normal;padding-left:62px">您可以从已观看的影片中选择一部参与活动。</span>
					</h4>
					<div class="row">
						<div class="span6">
							<h5 style="padding-left:15px;font-family:微软雅黑">
								<span style="padding-left:8px">影片：</span>
								<!--<span style="font-weight:normal;margin-top:100px">-->
								<select class="form-control" id="movieName" onchange="changeMovie()">
									<s:iterator value="movieName" id="m"> 
										<option value="<s:property value="#m"/>"><s:property value="#m"/></option>
									</s:iterator>
								</select>
								<!--</span>-->
							</h5>
						</div>
						<div class="span3">
						</div>
					</div>
					<div class="row" id="warningRow" style="display:none">
						<div class="span6">
							<h5 style="padding-left:15px;font-family:微软雅黑">
								<span style="padding-left:8px" id="warningMessage"></span>
							</h5>
						</div>
						<div class="span3">
						</div>
					</div>
					<div class="row" id="q1Row" style="display:block">
						<div class="span6">
							<h5 style="padding-left:15px;font-family:微软雅黑">
								<span>问题1：</span>
								<span style="font-weight:normal" id="question1">${a.q1}</span>
							</h5>
							<ul class="tasks zebra-list" style="padding-left:65px">
								<li>
									<input type="radio" value="1" name="optionsRadio1" checked="checked"/><span id="question1_A" class="title" style="padding-left:5px;font-family:微软雅黑">${a.q1_A}</span>
								</li>
								<li>
									<input type="radio" value="2" name="optionsRadio1"/><span id="question1_B" class="title" style="padding-left:5px;font-family:微软雅黑">${a.q1_B}</span>
								</li>
								<li>
									<input type="radio" value="3" name="optionsRadio1"/><span id="question1_C" class="title" style="padding-left:5px;font-family:微软雅黑">${a.q1_C}</span>
								</li>
							</ul>
						</div>
						<div class="span3">
						</div>
					</div>
					<div class="row" id="q2Row" style="display:block">
						<div class="span6">
							<h5 style="padding-left:15px;font-family:微软雅黑">
								<span>问题2：</span>
								<span style="font-weight:normal" id="question2">${a.q2}</span>
							</h5>
							<ul class="tasks zebra-list" style="padding-left:65px">
								<li>
									<input type="radio" value="1" name="optionsRadio2" checked="checked"/><span id="question2_A" class="title" style="padding-left:5px;font-family:微软雅黑">${a.q2_A}</span>
								</li>
								<li>
									<input type="radio" value="2" name="optionsRadio2"/><span id="question2_B" class="title" style="padding-left:5px;font-family:微软雅黑">${a.q2_B}</span>
								</li>
								<li>
									<input type="radio" value="3" name="optionsRadio2"/><span id="question2_C" class="title" style="padding-left:5px;font-family:微软雅黑">${a.q2_C}</span>
								</li>
							</ul>
						</div>
						<div class="span3">
						</div>
					</div>
					<br />
					<div class="row" id="buttonRow" style="display:block">
						<div class="span5"></div>
						<div class="span4">
							<button type="button" class="btn btn-danger" style="font-family:微软雅黑" onclick="submitAjax()">提&nbsp;交</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:300px">
	<div class="modal-dialog"> 
		<div class="modal-content">
			<div class="modal-header">
				<h4></h4>
			</div>
			<div class="modal-body">
				<br />
				<form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-offset-2 control-label" style="font-weight:normal;font-size:20px">本活动参加成功!</label>
				</div>
				<br></br> 
				<div class="form-group">
					<div style="padding-left:160px">
						<button type="button" class="btn btn-primary" style="width:70px;font-family:微软雅黑" onclick="window.location.href='member_activity.action'">确&nbsp;认</button>
					</div>
				</div>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>	
		<div class="modal fade" id="warningModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:250px">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4></h4>
			</div>
			<div class="modal-body" style="width:230px">
				<br />
				<div class="form-group">
					<label id="waringLabel" class="col-sm-offset-1" style="font-weight:normal;font-size:15px;width=220px;"></label>
				</div>
				<br />
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
		</div>
		<%@include file="footer.jsp"%> 
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/site.js"></script>
		<script type="text/javascript">
		function changeMovie(){
			var movieName = $("#movieName").val();
			var params = {
			    	 movieName:movieName,
			    };
			    $.ajax({
			    type: "POST",
			    url: "changeActivityAjax.action",
			    data: params,
			    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
			    success: function(json){ 
			    	var obj = $.parseJSON(json);  //使用这个方法解析json
			    	var message = obj.message;
			    	if(message!=""){
			    		document.getElementById("warningMessage").innerHTML = message;
			    		document.getElementById("warningRow").style.display="block";
			    		document.getElementById("q1Row").style.display="none";
			    		document.getElementById("q2Row").style.display="none";
			    		document.getElementById("buttonRow").style.display="none";
			    	}else{
			    		document.getElementById("warningRow").style.display="none";
			    		var a = obj.a;
			    		document.getElementById("question1").innerHTML = a.q1;
			    		document.getElementById("question1_A").innerHTML = a.q1_A;
			    		document.getElementById("question1_B").innerHTML = a.q1_B;
			    		document.getElementById("question1_C").innerHTML = a.q1_C;
			    		document.getElementById("question2").innerHTML = a.q2;
			    		document.getElementById("question2_A").innerHTML = a.q2_A;
			    		document.getElementById("question2_B").innerHTML = a.q2_B;
			    		document.getElementById("question2_C").innerHTML = a.q2_C;
			    		document.getElementById("q1Row").style.display="block";
			    		document.getElementById("q2Row").style.display="block";
			    		document.getElementById("buttonRow").style.display="block";
			    	}
			    },
			    error: function(json){
			    	document.getElementById("waringLabel").innerHTML="系统繁忙，请稍后";
					$('#warningModal').modal({
		    			backdrop:'static'
		    		});
	    			$('#warningModal').modal('show');
			    	//alert("系统繁忙，请稍后再试！");
			    }
			    });
		}
		
		function getRadioValue(temp){
		  for(var i=0;i<temp.length;i++){
		     if(temp[i].checked)
		           var intHot = temp[i].value;
		 }
			return intHot; 
		} 
		
		function submitAjax(){
			var movieName = $("#movieName").val();
			var q1_Radio = document.getElementsByName("optionsRadio1");
			var q1_Answer = getRadioValue(q1_Radio);
			var q2_Radio = document.getElementsByName("optionsRadio2");
			var q2_Answer = getRadioValue(q2_Radio);
			var params = {
			    	 movieName:movieName,
			    	 q1_Answer:q1_Answer,
			    	 q2_Answer:q2_Answer,
			    };
			    $.ajax({
			    type: "POST",
			    url: "ActivityAnswerAjax.action",
			    data: params,
			    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
			    success: function(json){ 
			    	//var obj = $.parseJSON(json);  //使用这个方法解析json
			    	$('#myModal').modal({
		    			backdrop:'static'
		    		});
			    	$('#myModal').modal('show');
			    },
			    error: function(json){
			    	document.getElementById("waringLabel").innerHTML="系统繁忙，请稍后";
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