<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CiNEPLeX 注册</title>
	<link href="css/bootstrap.min_member.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min_member.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
	<link href="css/register.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span1"></div>
			<div class="span11">
				<a href=""><img src="image/logo_md.png" style="padding:5px 30px 0 0"></img></a>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="span2"></div>
			<div class="span8">
				<div class="steps">
					<ol>
						<li class="active">
							<i>1</i>
							<span>填写注册信息</span>
						</li>
						<li class="active">
							<i>2</i>
							<span>充值激活</span>
						</li>
						<li>
							<i>√</i>
							<span>注册成功</span>
						</li>
					</ol>
				</div>
			</div>
			<div class="span2"></div>
		</div>
		<div class="row">
			<div class="span2"></div>
			<div class="span8" style="font-family:微软雅黑">
				<br></br>
				<form id="edit-profile" class="form-horizontal" method="post" action="register_step2" style="padding-left:50px">
					<fieldset>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">申请到的卡号：</label>
							<div class="controls">
								<label class="control-label" style="text-align:left" id="cardID">${ID}</label>
								<input type="text" name="ID" style="display:none" value="${ID}"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">已绑定的银行卡：</label>
							<div class="controls">
								<label class="control-label" style="text-align:left">${bankNum}</label>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">金额：</label>
							<div class="controls" style="padding-left:8px">
								<label class="radio">
									<input type="radio" name="optionsRadios" value="200" checked="checked" />
									200￥
								</label>
								<label class="radio">
									<input type="radio" name="optionsRadios" value="500" />
									500￥
								</label>
								<label class="radio">
									<input type="radio" name="optionsRadios" value="1000" />
									1000￥
								</label>
								<p class="help-block" style="padding-top:8px"><strong>说明：</strong>一次充值/缴纳200￥成为银卡会员，充值/缴纳500￥成为金卡会员，充值/缴纳1000￥成为钻石卡会员。</p>
							</div>
						</div>
						<br />
						<div class="form-actions">
								<button type="submit" class="btn btn-danger" style="font-family:微软雅黑">下一步</button>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="span2"></div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min_member.js"></script>
	<script src="js/site.js"></script>
</body>
</html>