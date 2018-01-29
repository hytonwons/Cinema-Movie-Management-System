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
						<li>
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
				</br>
				<label class="control-label" style="font-weight:bold;margin-left:10%"><a href="index.jsp">已有账号，去登录</a></label>
				</br>
				<form id="edit-profile" action="register_step1" method="post" class="form-horizontal" style="padding-left:50px" onsubmit="return Validate();">
					<fieldset>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">手机号：</label>
							<div class="controls">
								<input type="text" name="info.telephone" id="phoneNum" placeholder="请输入11位手机号码" onchange="telphoneValidate()"/>
								<p class="help-block" style="color:red;display:none" id="phoneWarning"></p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">密码：</label>
							<div class="controls">
								<input type="password" name="info.password" id="password"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">确认密码：</label>
							<div class="controls">
								<input type="password"  id="comfirmpassword" onchange="passwdValidate()"/>
								<p class="help-block" style="color:red;display:none" id="passwordWarning"></p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">姓氏：</label>
							<div class="controls">
								<input type="text" id="famliyName" name="info.familyName" onchange="nameValidate()"/>
								<p class="help-block" style="color:red;display:none" id="nameWarning"></p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">性别：</label>
							<div class="controls">
								<select class="form-control" name="info.gender" style="width:70px">
									<option value="1">男</option>
									<option value="2">女</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">年龄：</label>
							<div class="controls">
								<select class="form-control" name="info.age" style="width:100px">
									<option value="1">10~20岁</option>
									<option value="2">20~30岁</option>
									<option value="3">30~40岁</option>
									<option value="4">40~50岁</option>
									<option value="5">50~60岁</option>
									<option value="6">60岁以上</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" style="font-weight:bold">银行卡卡号：</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="info.bankCardNum" id="bankCard" placeholder="请输入19位银行卡号" onchange="bankCardValidate()"/>
								<p class="help-block" style="color:red;display:none" id="bankCardWarning"></p>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-danger" style="font-family:微软雅黑">下一步</button>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="span2">
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min_member.js"></script>
	<script src="js/site.js"></script>
	<script src="js/register.js"></script>
</body>
</html>