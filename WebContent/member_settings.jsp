<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 设置</title>
	<link href="css/bootstrap.min_member.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min_member.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
	<link rel="stylesheet" href="css/dataTables.bootstrap2.css" />
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/site.js"></script>
	<script src="js/register.js"></script>
	<script src="js/jquery.dataTables.js"></script>
	<script src="js/dataTables.bootstrap2.js"></script>
	<script>
		    $(document).ready(function() {
				$("#pay_table").dataTable( {
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
	<script type="text/javascript">
			function exchange(){
				var currentPoint = ${ri.point};
				var point = $("#pointchange").val();
				
				var temp = parseInt(point/10);
				//alert(point);
				//alert(temp);
				if(point==temp*10&&currentPoint>=point){
					var params = {
					    	 point:point,
					    	 money:temp,
					    };
					    $.ajax({
					    type: "POST",
					    url: "exchangeAjax.action",
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
					    	document.getElementById("waringLabel").innerHTML="系统繁忙，请稍后";
							$('#warningModal').modal({
				    			backdrop:'static'
				    		});
			    			$('#warningModal').modal('show');
					    	//alert("系统繁忙，请稍后");
					    }
					    });
				}else{
					if(currentPoint<point){
						document.getElementById("waringLabel").innerHTML="积分不足！";
						$('#warningModal').modal({
			    			backdrop:'static'
			    		});
		    			$('#warningModal').modal('show');
						//alert("积分不足！");
					}else{
						document.getElementById("waringLabel").innerHTML="兑换的积分必须是10的倍数！";
						$('#warningModal').modal({
			    			backdrop:'static'
			    		});
		    			$('#warningModal').modal('show');
						//alert("兑换的积分必须是10的倍数！");
					}
				}
			}
		</script>
</head>
<body>
		<div class="container">
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<div class="nav-collapse collapse">
							<ul class="nav navbar-nav" style="height:40px">
								<li>
									<img src="image/logo_sm.png" style="padding:5px 30px 0 18px"></img>
								</li>
								<li>
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
							<li style="height:30px;">
								<a href="member_handle.action" style="padding-left:40px;font-family:微软雅黑">充值/激活/取消</a>
							</li>
							<li class="active" style="height:30px;">
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
						<div class="span8">
							<ul id="myTab" class="nav nav-tabs" style="font-size:18px;font-weight:bold">
								<li class="active">
									<a href="#profile" data-toggle="tab">个人资料</a>
								</li>
								<li><a href="#pay" data-toggle="tab">我的缴费记录</a></li>
								<li><a href="#consume" data-toggle="tab">我的消费记录</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-content">
									<div class="tab-pane fade in active" id="profile" style="font-family:微软雅黑">
										<form id="edit-profile" class="form-horizontal">
											<fieldset>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">卡号：</label>
													<div class="controls" style="margin-top:5px">
														<label id="cardID">${ri.ID}</label>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">卡类型：</label>
													<div class="controls" style="margin-top:5px">
														<label id="cardType">${cardType}</label>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">密码：</label>
													<div class="controls">
														<input type="text" class="input-xlarge" id="password" value="${ri.password}" onchange="passwdOnChange()" onfocus="passwsOnfocus()"/>
														<p class="help-block" style="color:red;display:none" id="passwordWarning"></p>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">姓名：</label>
													<div class="controls" style="margin-top:5px">
														<label id="name">${ri.familyName}${gender}</label>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">年龄：</label>
													<div class="controls" style="margin-top:5px">
														<label id="age">${age}</label>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">手机号：</label>
													<div class="controls">
														<input type="text" class="input-xlarge" id="phoneNum" value="${ri.telephone}" onchange="telphoneValidate()"/>
														<p class="help-block" style="color:red;display:none" id="phoneWarning"></p>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">已绑定的银行卡卡号：</label>
													<div class="controls">
														<input type="text" class="input-xlarge" id="bankCard" value="${ri.bankCardNum}" onchange="bankCardValidate()"/>
														<p class="help-block" style="color:red;display:none" id="bankCardWarning"></p>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" style="font-weight:bold">积分：</label>
													<div class="controls" style="margin-top:5px">
														<label id="point">${ri.point}  （10分可兑换1元）</label>
													</div>
													<div class="controls" style="margin-top:5px">
														<input type="text" style="width:50px" id="pointchange" value="" />
														<button type="button" class="btn btn-primary" style="font-family:微软雅黑" onclick="exchange()">兑换</button>
													</div>
												</div>
												<div class="form-actions">
													<button type="button" class="btn btn-primary" style="font-family:微软雅黑" onclick="ModifyValidate()">保存修改</button>
												</div>
											</fieldset>
										</form>
									</div>
									<div class="tab-pane fade" id="pay" style="font-family:微软雅黑">
										<table id="pay_table" class="table table-bordered table-striped">
											<thead>
												<tr>
													<th>金额</th>
													<th>日期</th>
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
									<div class="tab-pane fade" id="consume" style="font-family:微软雅黑">
										<table id="consume_table" class="table table-bordered table-striped">
											<thead>
												<tr style="text-align:center">
													<th>兑换码</th>
													<th>金额</th>
													<th>观看电影</th>
													<th>日期</th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="c" id="c">
												<tr>
													<td><s:property value="#c.ID"/></td>
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
						<div class="span2">
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
						<button type="button" class="btn btn-primary" style="width:70px;font-family:微软雅黑" onclick="window.location.href='member_settings.action'">确&nbsp;认</button>
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