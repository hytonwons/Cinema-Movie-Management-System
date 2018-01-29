<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 活动</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" media="all">
	<script src="js/jquery-1.7.2.min.js"></script>	
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	function check_and_ajax(){
    		var movieName = document.getElementById("movieName").value;
    		var q1 = document.getElementById("q1_select").value;
    		var q1_A = $("#q1_A").val();
    		var q1_B = $("#q1_B").val();
    		var q1_C = $("#q1_C").val();
    		var q2 = document.getElementById("q2_select").value;
    		var q2_A = $("#q2_A").val();
    		var q2_B = $("#q2_B").val();
    		var q2_C = $("#q2_C").val();
    		var flag = true;
    		
    		if(q1==q2){
    			document.getElementById("waringLabel").innerHTML='问题重复！';
    			$('#warningModal').modal({
        			backdrop:'static'
        		});
    			$('#warningModal').modal('show');
    			//alert("问题重复！");
    			flag = false;
    			return 0;
    		}
    		if(q1_A==""||q1_A==null||q1_B==""||q1_B==null||q1_C==""||q1_C==null
    			||q2_A==""||q2_A==null||q2_B==""||q2_B==null||q2_C==""||q2_C==null){
    			document.getElementById("waringLabel").innerHTML='未填写完整！';
    			$('#warningModal').modal({
        			backdrop:'static'
        		});
    			$('#warningModal').modal('show');
    			//alert("未填写完整！");
    			flag = false;
    			return 0;
    		}
    		if(flag==true){
    			ajax(movieName,q1,q1_A,q1_B,q1_C,q2,q2_A,q2_B,q2_C);
    		}
    	}
    	
    	function ajax(movieName,q1,q1_A,q1_B,q1_C,q2,q2_A,q2_B,q2_C){
    	    //提交的参数是和struts action中对应的接收变量
    	    var params = {
    	    	 movieName :movieName,
    	         q1:q1,
    	         q1_A:q1_A,
    	         q1_B:q1_B,
    	         q1_C:q1_C,
    	         q2:q2,
    	         q2_A:q2_A,
    	         q2_B:q2_B,
    	         q2_C:q2_C,
    	    };
    	    $.ajax({
    	    type: "POST",
    	    url: "activityAjax.action",
    	    data: params,
    	    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    	    success: function(json){ 
    	    	var obj = $.parseJSON(json);  //使用这个方法解析json
    	    	var message = obj.message;
    	    	if(message!=""){
    	    		document.getElementById("waringLabel").innerHTML=message;
        			$('#warningModal').modal({
            			backdrop:'static'
            		});
        			$('#warningModal').modal('show');
    	    		//alert(message);
    	    	}else{
    	    		$('#myModal').modal({
		    			backdrop:'static'
		    		});
    	    		$('#myModal').modal('show');
    	    	}
    	    },
    	    error: function(json){
    	    	document.getElementById("waringLabel").innerHTML="系统繁忙！";
    			$('#warningModal').modal({
        			backdrop:'static'
        		});
    			$('#warningModal').modal('show');
    	    	//alert("系统繁忙！");
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
		<li><a href="planactivity_plan" style="font-size:18px">排片</a></li>
        <li class="active"><a href="planactivity_activity" style="font-size:18px">制定活动</a></li>
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
<div class="container" id="makeActivity">
	<label style="font-size:20px;font-weight:bold">制定会员互动活动</label>
	<br></br>
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label" style="font-size:18px">相关影片：</label>
			<div class="col-sm-2" style="padding-top:5px">
				<select id="movieName" class="form-control">
					<s:iterator value="ma" id="m">
						<option value="<s:property value="#m.name"/>"><s:property value="#m.name" /></option>
					</s:iterator>
				</select> 
			</div>
			<div class="col-sm-9"></div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label" style="font-size:18px">题目1：</label>
			<div class="col-sm-5" style="padding-top:5px">
				<select id="q1_select" class="form-control">
					<option value="1">您怎样评价这部影片？</option>
					<option value="2">您觉得未来几天应该对这部影片的排片做怎样的调整？</option>
					<option value="3">您觉得这部影片适合什么时段排映？</option>
				</select> 
			</div>
			<div class="col-sm-9"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<label class="col-sm-1 control-label" style="font-size:18px">A：</label>
			<div class="col-sm-2" style="padding-top:5px">
				<input id="q1_A" type="text" class="form-control">
			</div>
			<div class="col-sm-7"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<label class="col-sm-1 control-label" style="font-size:18px">B：</label>
			<div class="col-sm-2" style="padding-top:5px">
				<input id="q1_B" type="text" class="form-control">
			</div>
			<div class="col-sm-7"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<label class="col-sm-1 control-label" style="font-size:18px">C：</label>
			<div class="col-sm-2" style="padding-top:5px">
				<input id="q1_C" type="text" class="form-control">
			</div>
			<div class="col-sm-7"></div>
		</div>
		
		<br />
		<div class="form-group">
			<label class="col-sm-2 control-label" style="font-size:18px">题目2：</label>
			<div class="col-sm-5" style="padding-top:5px">
				<select id="q2_select" class="form-control">
					<option value="1">您怎样评价这部影片？</option>
					<option value="2">您觉得未来几天应该对这部影片的排片做怎样的调整？</option>
					<option value="3">您觉得这部影片适合什么时段排映？</option>
				</select> 
			</div>
			<div class="col-sm-9"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<label class="col-sm-1 control-label" style="font-size:18px">A：</label>
			<div class="col-sm-2" style="padding-top:5px">
				<input id="q2_A" type="text" class="form-control">
			</div>
			<div class="col-sm-7"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<label class="col-sm-1 control-label" style="font-size:18px">B：</label>
			<div class="col-sm-2" style="padding-top:5px">
				<input id="q2_B" type="text" class="form-control">
			</div>
			<div class="col-sm-7"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-2"></div>
			<label class="col-sm-1 control-label" style="font-size:18px">C：</label>
			<div class="col-sm-2" style="padding-top:5px">
				<input id="q2_C" type="text" class="form-control">
			</div>
			<div class="col-sm-7"></div>
		</div>
		
		<br />
		<div class="form-group">
		<div class="col-sm-1"></div>
		<div class="col-sm-2">
			<button type="button" class="btn btn-danger" style="width:80px" onclick="check_and_ajax()">提&nbsp;交</button>
		</div>
		<div class="col-sm-9"></div>
   </div>
	</form>
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
					<label class="control-label" style="font-weight:normal;font-size:20px">&nbsp;&nbsp;&nbsp;您已成功地为该影片制定了活动！</label>
				</div>
				<br />
				<div class="form-group">
					<div class="col-sm-offset-8 col-sm-4">
						<button type="button" class="btn btn-primary" style="width:80px" onclick="window.location.href='planactivity_activity'">确&nbsp;认</button>
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
</body>
</html>