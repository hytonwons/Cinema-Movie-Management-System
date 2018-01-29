<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//在head中<base href>指定basePath
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 售票</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" media="all">
	<script src="js/jquery-1.7.2.min.js"></script>	
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function load(){
		<s:iterator value="ticketList" id="t">
			var seatID = "row"+"<s:property value="#t.row"/>"+"col"+"<s:property value="#t.column"/>";
			document.getElementById(seatID).className="btn btn-warning btn-lg disabled";
		</s:iterator>
	}
	
	function takeSeat(id){
		var perPrice = parseInt(document.getElementById("per").innerHTML);
		if(document.getElementById(id).className=="btn btn-primary btn-lg"){		
			var seatNum = document.getElementById(id).name;
			//alert(seatNum);
			var list = seatNum.split("-");
			var seatID = list[0]+"排"+list[1]+"座";
			//alert(seatID);
			if(document.getElementById("ticket1").innerHTML==""||document.getElementById("ticket1").innerHTML==null){
				document.getElementById(id).className="btn btn-success btn-lg";
				document.getElementById("ticket1").innerHTML=seatID;
				document.getElementById("ticket1").style.display="inline";
				addTotalPrice(perPrice);
			}else if(document.getElementById("ticket2").innerHTML==""||document.getElementById("ticket2").innerHTML==null){
				document.getElementById(id).className="btn btn-success btn-lg";
				document.getElementById("ticket2").innerHTML=seatID;
				document.getElementById("ticket2").style.display="inline";
				addTotalPrice(perPrice);
			}else if(document.getElementById("ticket3").innerHTML==""||document.getElementById("ticket3").innerHTML==null){
				document.getElementById(id).className="btn btn-success btn-lg";
				document.getElementById("ticket3").innerHTML=seatID;
				document.getElementById("ticket3").style.display="inline";
				addTotalPrice(perPrice);
			}else{
				document.getElementById("waringLabel").innerHTML='最多只能购买3张电影票！';
				$('#warningModal').modal({
	    			backdrop:'static'
	    		});
    			$('#warningModal').modal('show');
				//alert("最多只能购买3张票");
			}
		}else if(document.getElementById(id).className=="btn btn-warning btn-lg disabled"){
		
		}else{
			document.getElementById(id).className="btn btn-primary btn-lg";
			var seatNum = document.getElementById(id).name;
			//alert(seatNum);
			var list = seatNum.split("-");
			var seatID = list[0]+"排"+list[1]+"座";
			//alert(seatID);
			if(document.getElementById("ticket1").innerHTML==seatID){
				document.getElementById("ticket1").innerHTML="";
				document.getElementById("ticket1").style.display="none";
				subTotalPrice(perPrice);
			}else if(document.getElementById("ticket2").innerHTML==seatID){
				document.getElementById("ticket2").innerHTML="";
				document.getElementById("ticket2").style.display="none";
				subTotalPrice(perPrice);
			}else {
				document.getElementById("ticket3").innerHTML="";
				document.getElementById("ticket3").style.display="none";
				subTotalPrice(perPrice);
			}
		}
	}
	
	function membership(obj){
		if(obj.value=="vip"){
			document.getElementById("memberInfo").style.display = "block";
		}else{
			var discount = parseInt(document.getElementById("per").innerHTML)/${ms.price};
			document.getElementById("per").innerHTML=${ms.price};
			var total = parseInt(document.getElementById("total").innerHTML)/discount;
			document.getElementById("total").innerHTML=total;
			$("#userID").attr("value","");
			document.getElementById("leftMoney").innerHTML="";
			document.getElementById("memberInfo").style.display = "none";
		}
	}
	
	function addTotalPrice(price){
		var currentPrice = parseInt(document.getElementById("total").innerHTML);
		document.getElementById("total").innerHTML=currentPrice+price;
	}
	
	function subTotalPrice(price){
		var currentPrice = document.getElementById("total").innerHTML;
		document.getElementById("total").innerHTML=currentPrice-price;
	}
		 
	function ajaxVIP(){
	    //提交的参数，ID是和struts action中对应的接收变量
	    var params = {
	         ID :$("#userID").val(), 
	    };
	    $.ajax({
	    type: "POST",
	    url: "sellAjax.action",
	    data: params,
	    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	    success: function(json){ 
	    	var obj = $.parseJSON(json);  //使用这个方法解析json
            var discount = obj.discount;  //ub是和action中定义的变量的get方法对应的
            var remainder = obj.remainder;
            document.getElementById("leftMoney").innerHTML=remainder;
            var currentPrice = ${ms.price};
            document.getElementById("per").innerHTML = parseInt(currentPrice*discount);
            var currentTotal = parseInt(document.getElementById("total").innerHTML);
            if(currentTotal!=0){
            	document.getElementById("total").innerHTML=currentTotal*discount;
            }
	    },
	    error: function(json){
	    	document.getElementById("waringLabel").innerHTML='您输入的卡号有误！';
			$('#warningModal').modal({
    			backdrop:'static'
    		});
			$('#warningModal').modal('show');
	    	//alert("您输入的卡号有误！");
	    }
	    });
	   }
	
	function ajaxTicket(){
	    //提交的参数是和struts action中对应的接收变量
	    	 //alert("here");
	   		 var movieName = "${ms.movieName}";
	    	 var sessionID =${ms.ID};
	    	 var whetherHidden = document.getElementById("memberInfo").style.display;
	    	 var ID = $("#userID").val();
	    	 var leftMoney = parseInt(document.getElementById("leftMoney").innerHTML);
	    	 if(whetherHidden=="none"||ID==""){
	    		 leftMoney = 0;
	    	 }
	    	 //下拉列表选择了会员卡，但是没有输入会员卡号
	    	 if(whetherHidden!="none"&&ID==""){
	    		leftMoney = 1;
	    	 }
	    	
	    var params = {
	    	 sessionID:sessionID,
	    	 //userID
	         ID :ID, 
	         ticket1:document.getElementById("ticket1").innerHTML,
	         ticket2:document.getElementById("ticket2").innerHTML,
	         ticket3:document.getElementById("ticket3").innerHTML,
	         leftMoney:leftMoney,
	         per:parseInt(document.getElementById("per").innerHTML),
	         total:parseInt(document.getElementById("total").innerHTML),
	         movieName:movieName,
	    };
	    $.ajax({
	    type: "POST",
	    url: "ticketAjax.action",
	    data: params,
	    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	    success: function(json){ 
	    	var obj = $.parseJSON(json);  //使用这个方法解析json
	    	var message = obj.message;
	    	if(message!=""){
	    		alert(message);
	    	}else{
	    		//alert("success");
	    		$('#myModal').modal({
		    			backdrop:'static'
		    	});
	    		$('#myModal').modal('show');
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
	</script>
</head>
<body onload="load()">
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
		<div id="time"><script>setInterval("time.innerHTML=new Date().toLocaleString()+'<br>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay())",500)</script></div>
	</div>
	<div class="col-md-1"></div>
</div>

<br />
<div class="container" id="sessionInfo">
  <div class="col-md-1"></div>
  <div class="col-md-11">
    <span id="movieName" style="font-size:22px;font-weight:bold">${ms.movieName}</span>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <span id="movieTime" style="font-size:18px">${ms.startTime}</span>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <span id="hallNum" style="font-size:18px">${ms.hallNum}号厅</span>
  </div>
</div>

<br />
<div class="container" id="seatInfo">
  <div class="col-md-1"></div>
  <div class="col-md-7">
  <p id="screen">
	<button type="button" class="btn btn-info btn-lg btn-block disabled">银幕</button>
  </p>
  <br />
  <p id="row1">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row1col1" name="1-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col2" name="1-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col3" name="1-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col4" name="1-4" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col5" name="1-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col6" name="1-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col7" name="1-7" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col8" name="1-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col9" name="1-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row1col10" name="1-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <p id="row2">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row2col1" name="2-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col2" name="2-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col3" name="2-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col4" name="2-4" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col5" name="2-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col6" name="2-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col7" name="2-7" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col8" name="2-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col9" name="2-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row2col10" name="2-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <p id="row3">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row3col1" name="3-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col2" name="3-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col3" name="3-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col4" name="3-4"onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col5" name="3-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col6" name="3-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col7" name="3-7"onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col8" name="3-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col9" name="3-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row3col10" name="3-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <p id="row4">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row4col1" name="4-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col2" name="4-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col3" name="4-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col4" name="4-4" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col5" name="4-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col6" name="4-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col7" name="4-7" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col8" name="4-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col9" name="4-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row4col10" name="4-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <p id="row5">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row5col1" name="5-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col2" name="5-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col3" name="5-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col4" name="5-4" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col5" name="5-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col6" name="5-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col7" name="5-7" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col8" name="5-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col9" name="5-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row5col10" name="5-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <p id="row6">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row6col1" name="6-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col2" name="6-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col3" name="6-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col4" name="6-4" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col5" name="6-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col6" name="6-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col7" name="6-7" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col8" name="6-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col9" name="6-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row6col10" name="6-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <p id="row7">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row7col1" name="7-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col2" name="7-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col3" name="7-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col4" name="7-4" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col5" name="7-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col6" name="7-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col7" name="7-7" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col8" name="7-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col9" name="7-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row7col10" name="7-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <p id="row8">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary btn-lg" id="row8col1" name="8-1" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col2" name="8-2" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col3" name="8-3" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col4" name="8-4" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col5" name="8-5" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col6" name="8-6" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col7" name="8-7" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col8" name="8-8" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col9" name="8-9" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
	<button type="button" class="btn btn-primary btn-lg" id="row8col10" name="8-10" onclick="takeSeat(this.id)">&nbsp;&nbsp;&nbsp;</button>
  </p>
  <br />
  <p id="eg">
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-primary disabled" id="eg1">&nbsp;&nbsp;&nbsp;</button>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-success disabled" id="eg2">&nbsp;&nbsp;&nbsp;</button>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-warning disabled" id="eg3">&nbsp;&nbsp;&nbsp;</button>
  </p>
    <p id="egExplanation">
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<label>可选座位</label>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<label>已选座位</label>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<label>已售座位</label>
  </p>
  </div>
  <div class="col-md-4">
	<br /><br /><br /><br />
	<div class="panel panel-info">
		<div class="panel-body">
			<div id="yourSeatInfo">
				<h4><label>座位：</label></h4>
				<h4>
					<span class="label label-success" id="ticket1" style="display:none"></span>
					<span class="label label-success" id="ticket2" style="display:none"></span>
					<span class="label label-success" id="ticket3" style="display:none"></span>
				</h4>
			</div>
			<div id="purchaseInfo" style="padding-top:5px">
				<h4>
					<label>购票方式：</label>
					<select class="form-control" onchange="membership(this)">
						<option>现金</option>
						<option value="vip">会员卡</option>
					</select>
				</h4>
			</div>
			<div id="memberInfo" style="display:none;padding-top:5px">
				<h4>
					<label>会员卡号：</label>
					<input id="userID" type="text" class="form-control" onchange="ajaxVIP()"></input>
				</h4>
				<h4>
					<label>卡内余额：</label>
					<label id="leftMoney"></label>
					<label>￥</label>
				</h4>
			</div>
			<div id="priceInfo" style="padding-top:5px">
				<h4>
					<label>单价：</label>
					<label id="per">${ms.price}</label>
					<label>￥</label>
				</h4>
				<h4>
					<label>总计：</label>
					<label id="total">0</label>
					<label>￥</label>
				</h4>
			</div>
			<div id="confirmPurchase" style="padding-top:5px">
				<button type="button" class="btn btn-danger" style="width:80px" onclick="ajaxTicket()">确&nbsp;认</button>
			</div>
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
					<label class="col-sm-offset-2 control-label" style="font-weight:normal;font-size:20px">出票成功！</label>
				</div>
				<br />
				<div class="form-group">
					<div class="col-sm-offset-8 col-sm-4">
						<button type="button" class="btn btn-primary" style="width:80px" onclick="window.location.href='<%=basePath %>salesman_session.action'">确&nbsp;认</button>
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