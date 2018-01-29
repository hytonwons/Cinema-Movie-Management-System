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
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/site.js"></script>
	<script type="text/javascript">
		function load(){
			//$('#myModal').modal('show');
			<s:iterator value="ticketList" id="t">
				var seatID = "row"+"<s:property value="#t.row"/>"+"col"+"<s:property value="#t.column"/>";
				document.getElementById(seatID).className="btn btn-warning btn-lg disabled";
			</s:iterator>
		}
		
		function takeSeat(id){
			var perPrice = parseInt(document.getElementById("per").innerHTML);
			//alert(perPrice);
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
					whetherNeedRecharge();
				}else if(document.getElementById("ticket2").innerHTML==""||document.getElementById("ticket2").innerHTML==null){
					document.getElementById(id).className="btn btn-success btn-lg";
					document.getElementById("ticket2").innerHTML=seatID;
					document.getElementById("ticket2").style.display="inline";
					addTotalPrice(perPrice);
					whetherNeedRecharge();
				}else if(document.getElementById("ticket3").innerHTML==""||document.getElementById("ticket3").innerHTML==null){
					document.getElementById(id).className="btn btn-success btn-lg";
					document.getElementById("ticket3").innerHTML=seatID;
					document.getElementById("ticket3").style.display="inline";
					addTotalPrice(perPrice);
					whetherNeedRecharge();
				}else{
					document.getElementById("waringLabel").innerHTML="最多只能购买3张电影票";
					$('#warningModal').modal({
		    			backdrop:'static'
		    		});
					//alert("最多只能购买3张电影票");
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
					whetherNeedRecharge();
				}else if(document.getElementById("ticket2").innerHTML==seatID){
					document.getElementById("ticket2").innerHTML="";
					document.getElementById("ticket2").style.display="none";
					subTotalPrice(perPrice);
					whetherNeedRecharge();
				}else {
					document.getElementById("ticket3").innerHTML="";
					document.getElementById("ticket3").style.display="none";
					subTotalPrice(perPrice);
					whetherNeedRecharge();
				}
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
		
		function whetherNeedRecharge(){
			var currentTotal = parseInt(document.getElementById("total").innerHTML);
			var remainder = ${remainder};
			if(currentTotal>remainder){
				document.getElementById("recharge").style.display="inline";
			}else{
				document.getElementById("recharge").style.display="none";
			}
		}
		
		function ajaxTicket(){
		    //提交的参数是和struts action中对应的接收变量
		    var sessionID = ${ms.ID};
		    var leftMoney = ${remainder};
		    var movieName = "${ms.movieName}";
		    var params = {
		    	 sessionID: sessionID,
		         ticket1: document.getElementById("ticket1").innerHTML,
		         ticket2: document.getElementById("ticket2").innerHTML,
		         ticket3: document.getElementById("ticket3").innerHTML,
		         leftMoney: leftMoney,
		         per:parseInt(document.getElementById("per").innerHTML),
		         total:parseInt(document.getElementById("total").innerHTML),
		         movieName:movieName,
		    };
		    $.ajax({
		    type: "POST",
		    url: "buyAjax.action",
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
		    		//alert(message);
		    	}else{
		    		if(obj.ticket1ID!=0){
		    			document.getElementById("t1").innerHTML = obj.ticket1ID;
		    		}else{
		    			document.getElementById("t1").innerHTML ='';
		    		}
		    		if(obj.ticket2ID!=0){
		    		document.getElementById("t2").innerHTML = obj.ticket2ID;
		    		}else{
		    			document.getElementById("t2").innerHTML ='';
		    		}
		    		if(obj.ticket3ID!=0){
		    			document.getElementById("t3").innerHTML = obj.ticket3ID;
		    		}else{
		    			document.getElementById("t3").innerHTML ='';
		    		}
		    		$('#myModal').modal({
		    			backdrop:'static'
		    		});
		    		$('#myModal').modal('show');
		    	}
		    },
		    error: function(json){
		    	document.getElementById("waringLabel").innerHTML="系统繁忙，请稍后";
				$('#warningModal').modal({
	    			backdrop:'static'
	    		});
		    	//alert("系统繁忙，请稍后再试！");
		    }
		    });
		   }
	</script>
</head>
<body onload="load()">
		<div class="container">
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<div class="nav-collapse">
							<ul class="nav" style="height:40px">
								<li>
									<img src="image/logo_sm.png" style="padding:5px 30px 0 18px"></img>
								</li>
								<li class="active">
									<a href="member_buy.action" style="font-size:18px;padding-top:15px">购票</a>
								</li>
								<li>
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
				<div class="span10"></div>
				<div class="span2">
					<div id="a">
						<script>setInterval("a.innerHTML=new Date().toLocaleString()+'<br>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+' 星期'+'日一二三四五六'.charAt(new Date().getDay())",500)
						</script>
						</div>
				</div>
			</div>
			<div class="row">
				<div class="span1"></div>
				<div class="span6">
					<h5 style="font-family:微软雅黑;font-size:15px">
						<span>使用向导：</span>
						<span style="font-weight:normal"><strong>1.</strong>选座&nbsp;&nbsp;</span>
						<span style="font-weight:normal"><strong>2.</strong>支付，获得<strong>兑换码</strong>&nbsp;&nbsp;</span>
						<span style="font-weight:normal"><strong>3.</strong>凭<strong>兑换码</strong>在影院取票观影</span>
					</h5>
					<h5 style="font-family:微软雅黑;font-size:15px">
						<span>选座说明：</span>
						<span id="seatInfo" style="font-weight:normal"><strong>1.</strong>点击蓝色图标选座，再次点击取消</span>
					</h5>
					<h5 style="font-family:微软雅黑;font-size:15px">
						<span id="seatInfo" style="font-weight:normal;padding-left:14%"><strong>2.</strong>每笔订单最多可选择<strong>3</strong>张电影票</span>
					</h5>
					<br />
					<div id="seat">
					<p id="screen">
	<button type="button" class="btn btn-info btn-lg btn-block disabled" style="font-size:18px">银幕</button>
  </p>
  <br />
  <p id="row1" style="padding-left:75px">
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
  <p id="row2" style="padding-left:75px">
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
  <p id="row3" style="padding-left:75px">
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
  <p id="row4" style="padding-left:75px">
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
  <p id="row5" style="padding-left:75px">
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
  <p id="row6" style="padding-left:75px">
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
  <p id="row7" style="padding-left:75px">
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
  <p id="row8" style="padding-left:75px">
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
  <p id="eg" style="padding-left:175px">
	<button type="button" class="btn btn-primary disabled" id="eg1">&nbsp;&nbsp;&nbsp;</button>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-success disabled" id="eg2">&nbsp;&nbsp;&nbsp;</button>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<button type="button" class="btn btn-warning disabled" id="eg3">&nbsp;&nbsp;&nbsp;</button>
  </p>
    <p id="egExplanation" style="padding-left:168px;font-family:微软雅黑">
		<span>可选座位</span>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span>已选座位</span>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span>已售座位</span>
  </p>
  </div>
				</div>
				<div class="span4">
					<br /><br /><br /><br /><br /><br />
					<div class="well">
						<div id="movieInfo">
							<h5 style="font-family:微软雅黑;font-size:15px">
								<span>影片：</span>
								<span id="movieName" style="font-weight:normal">${ms.movieName}</span>
							</h5>
							<h5 style="font-family:微软雅黑;font-size:15px">
								<span>时间：</span>
								<span id="movieTime" style="font-weight:normal">${ms.date} ${ms.startTime}</span>
							</h5>
							<h5 style="font-family:微软雅黑;font-size:15px">
								<span>厅号：</span>
								<span id="hallNum" style="font-weight:normal">${ms.hallNum}号厅</span>
							</h5>
						</div>
						<div id="yourSeatInfo" style="padding-top:5px">
							<h5 style="font-family:微软雅黑;font-size:15px"><span>座位：</span></h5>
							<h5 style="font-family:微软雅黑;font-size:15px;font-weight:normal">
								<span class="label label-success" id="ticket1" style="display:none"></span>
								<span class="label label-success" id="ticket2" style="display:none"></span>
								<span class="label label-success" id="ticket3" style="display:none"></span>
							</h5>
						</div>
						<div id="memberInfo" style="padding-top:5px">
							<h5 style="font-family:微软雅黑;font-size:15px">
								<span>卡内余额：</span>
								<span id="leftMoney" style="font-weight:normal">${remainder}</span>
								<span style="font-weight:normal">￥</span>
								<span id="recharge" style="padding-left:15px;display:none"><a href="member_handle.action">余额不足，去充值</a></span>
							</h5>
						</div>
						<div id="priceInfo" style="padding-top:5px">
							<h5 style="font-family:微软雅黑;font-size:15px">
								<span>单价：</span>
								<span id="per" style="font-weight:normal">${per}</span>
								<span style="font-weight:normal">￥</span>
							</h5>
							<h5 style="font-family:微软雅黑;font-size:15px">
								<span>总计：</span>
								<span id="total" style="font-weight:normal">0</span>
								<span style="font-weight:normal">￥</span>
							</h5>
						</div>
						<div id="confirmPurchase" style="padding-top:5px">
							<button type="button" class="btn btn-danger" style="width:80px;font-family:微软雅黑" onclick="ajaxTicket()">确&nbsp;认</button>
						</div>
					</div>
				</div>
				<div class="span1"></div>
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
					<label class="col-sm-offset-1 control-label" style="font-weight:normal;font-size:20px">您已购票成功!</label>
				</div>
				<br></br> 
				<div class="form-group">
					<div style="padding-left:35px;font-family:微软雅黑">
						<span>兑换码为：</span>
						<span id="t1"></span>
						<span id="t2"></span>
						<span id="t3"></span>
					</div>
				</div>
				</br>
				<div class="form-group">
					<div style="padding-left:35px">
						<label style="font-weight:normal;font-size:18px">请到影院取票机取票!</label>
						</div>
				</div>
				<br></br> 
				<div class="form-group">
					<div style="padding-left:160px">
						<button type="button" class="btn btn-primary" style="width:70px;font-family:微软雅黑" onclick="window.location.href='member_buy.action'">确&nbsp;认</button>
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
</body>
</html>