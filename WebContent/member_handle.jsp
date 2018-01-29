<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 会员管理</title>
		<link href="css/bootstrap.min_member.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.min_member.css" rel="stylesheet">
		<link href="css/site.css" rel="stylesheet">
		<script type="text/javascript">
			function load(){
				//alert("i am here");
				//var state = <s:property value="state"/>;
				//el表达式需要加引号
				var state = "${state}";
				//alert(state);
				if(state=="未激活"){
					document.getElementById("remainderRow").style.display="none";
					document.getElementById("validRow").style.display="none";
				}
				if(state=="已激活"){
					document.getElementById("gotoActive").style.display="none";
					var valid = ${valid};
					if(valid){
						document.getElementById("gotoPay").style.display="none";
					}
				}
				if(state=="已取消"){
					//alert("i am here");
					document.getElementById("c").style.display="none";
					document.getElementById("gotoActive").style.display="none";
					document.getElementById("remainderRow").style.display="none";
					document.getElementById("validRow").style.display="none";
				}
			}
			
			function showActive(){
				document.getElementById("activeRow").style.display="block";
			}
			
			function showPay(){
				document.getElementById("pay").style.display="block";
			}
			
			function cancelAjax(){
				  $.ajax({
				  type: "POST",
				  url: "cancelAjax.action",
				  dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
				  success: function(json){ 
				    var obj = $.parseJSON(json);  //使用这个方法解析json
				    var message = obj.message;
				    document.getElementById("modalTip").innerHTML = message;
				    $('#myModal').modal({
		    			backdrop:'static'
		    		});
				    $('#myModal').modal('show');
				  },
				  error: function(json){
				    alert("系统繁忙，请稍后再试！");
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
			
			function activeAjax(){
				//alert("here");
				var radio = document.getElementsByName("optionsRadio1");
				var price = getRadioValue(radio);
				//alert(price);
				var params = {
				    	 price:price,
				    };
				    $.ajax({
				    type: "POST",
				    url: "activeAjax.action",
				    data: params,
				    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
				    success: function(json){ 
				    	var obj = $.parseJSON(json);  //使用这个方法解析json
				    	var message = obj.message;
					    document.getElementById("modalTip").innerHTML = message;
					    $('#myModal').modal({
			    			backdrop:'static'
			    		});
					    $('#myModal').modal('show');
				    },
				    error: function(json){
				    	document.getElementById("waringLabel").innerHTML="系统繁忙，请稍后再试！";
						$('#warningModal').modal({
			    			backdrop:'static'
			    		});
		    			$('#warningModal').modal('show');
				    	//alert("系统繁忙，请稍后再试！");
				    }
				    });
			}
			
			function PayAjax(){
				//alert("here");
				var radio = document.getElementsByName("optionsRadio2");
				var price = getRadioValue(radio);
				//alert(price);
				var params = {
				    	 price:price,
				    };
				    $.ajax({
				    type: "POST",
				    url: "payAjax.action",
				    data: params,
				    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
				    success: function(json){ 
				    	var obj = $.parseJSON(json);  //使用这个方法解析json
				    	var message = obj.message;
					    document.getElementById("modalTip").innerHTML = message;
					    $('#myModal').modal({
			    			backdrop:'static'
			    		});
					    $('#myModal').modal('show');
				    },
				    error: function(json){
				    	document.getElementById("waringLabel").innerHTML="系统繁忙，请稍后再试！";
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
								<li>
									<a href="member_activity.action" style="font-size:18px;padding-top:15px">参加活动</a>
								</li>
								<li class="active">
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
							<li style="height:30px;">
								<a href="member_activity.action" style="padding-left:40px;font-family:微软雅黑">参加活动</a>
							</li>
							<li class="nav-header" style="height:30px;font-size:18px">
								个人账号
							</li>
							<li class="active" style="height:30px;">
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
					<br />
					<div class="row">
						<div class="span6">
							<div class="well">
								<div class="row">
									<div class="span4" style="padding-left:15px">
										<h3 style="font-size:22px">
											<span>会员卡信息：</span>
										</h3>
									</div>
									<div class="span2"></div>
								</div>
								<div class="row">
									<div class="span4" style="padding-left:35px">
										<h5 style="font-family:微软雅黑">
											<span>卡号：</span>
											<span style="font-weight:normal">${userID}</span>
											<span style="padding-left:15px;font-weight:normal;display:inline" id="c"><a href="javascript:void(0)" onclick="cancelAjax()">取消会员身份（注：不可恢复）</a></span>
										</h5>
									</div>
									<div class="span2"></div>
								</div>
								<div class="row">
									<div class="span4" style="padding-left:35px">
										<h5 style="font-family:微软雅黑">
											<span>状态：</span>
											<span style="font-weight:normal">${state}</span>
											<span style="padding-left:15px;font-weight:normal;display:inline" id="gotoActive"><a href="javascript:void(0)" onclick="showActive()">去激活</a></span>
										</h5>
									</div>
									<div class="span2"></div>
								</div>
								<div class="row" id="remainderRow" style="display:block">
									<div class="span4" style="padding-left:35px">
										<h5 style="font-family:微软雅黑">
											<span>余额：</span>
											<span style="font-weight:normal">${remainder}￥</span>
											<span style="padding-left:15px;font-weight:normal"><a href="javascript:void(0)" onclick="showPay()">去充值</a></span>
										</h5>
									</div>
									<div class="span2"></div>
								</div>
								<div class="row" id="validRow" style="display:block">
									<div class="span4" style="padding-left:35px">
										<h5 style="font-family:微软雅黑">
											<span>有效期至：</span>
											<span style="font-weight:normal">${validDate}</span>
											<span style="padding-left:15px;font-weight:normal;display:inline" id="gotoPay"><a href="javascript:void(0)" onclick="showPay()">去缴费</a></span>
										</h5>
									</div>
									<div class="span2"></div>
								</div>
							</div>
						</div>
						<div class="span3"></div>
					</div>	
					<br />
					<div class="row" id="activeRow" style="display:none">
						<div class="span6">
							<form id="edit-profile" class="form-horizontal" style="font-family:微软雅黑">
								<fieldset>
									<legend style="font-family:宋体;font-weight:bold">激活</legend>
									<div class="control-group">
										<label class="control-label" style="font-weight:bold">已绑定的银行卡：</label>
										<div class="controls">
											<label class="control-label">${cardNum}</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" style="font-weight:bold">金额：</label>
										<div class="controls" style="padding-left:8px">
											<label class="radio">
												<input type="radio" name="optionsRadio1" value="200" checked="checked" />
												200￥
											</label>
											<label class="radio">
												<input type="radio" name="optionsRadio1" value="500" />
												500￥
											</label>
											<label class="radio">
												<input type="radio" name="optionsRadio1" value="1000" />
												1000￥
											</label>
											<p class="help-block" style="padding-top:8px"><strong>说明：</strong>一次充值/缴纳200￥成为银卡会员，充值/缴纳500￥成为金卡会员，充值/缴纳200￥成为钻石卡会员。</p>
										</div>
									</div>
									<div class="form-actions">
										<button type="button" class="btn btn-primary" style="font-family:微软雅黑" onclick="activeAjax()">确&nbsp;定</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
					
					<div class="row" id="pay" style="display:none">
						<div class="span6">
							<form id="edit-profile" class="form-horizontal" style="font-family:微软雅黑">
								<fieldset>
									<legend style="font-family:宋体;font-weight:bold">充值/缴费</legend>
									<div class="control-group">
										<label class="control-label" style="font-weight:bold">已绑定的银行卡：</label>
										<div class="controls">
											<label class="control-label">${cardNum}</label>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" style="font-weight:bold">金额：</label>
										<div class="controls" style="padding-left:8px">
											<label class="radio">
												<input type="radio" name="optionsRadio2" value="200" checked="checked" />
												200￥
											</label>
											<label class="radio">
												<input type="radio" name="optionsRadio2" value="500" />
												500￥
											</label>
											<label class="radio">
												<input type="radio" name="optionsRadio2" value="1000" />
												1000￥
											</label>
											<p class="help-block" style="padding-top:8px"><strong>说明：</strong>一次充值/缴纳200￥成为银卡会员，充值/缴纳500￥成为金卡会员，充值/缴纳200￥成为钻石卡会员。</p>
										</div>
									</div>
									<div class="form-actions">
										<button type="button" class="btn btn-primary" style="font-family:微软雅黑" onclick="PayAjax()">确&nbsp;定</button>
									</div>
								</fieldset>
							</form>
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
					<label class="col-sm-offset-2 control-label" style="font-weight:normal;font-size:20px" id="modalTip"></label>
				</div>
				<br></br> 
				<div class="form-group">
					<div style="padding-left:160px">
						<button type="button" class="btn btn-primary" style="width:70px;font-family:微软雅黑" onclick="window.location.href='member_handle.action'">确&nbsp;认</button>
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
		
	</body>
</html>