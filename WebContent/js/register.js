function telphoneValidate(){
	var phoneNum = document.getElementById("phoneNum").value;
	if(phoneNum.length!=11){
		document.getElementById("phoneWarning").innerHTML="手机号码长度应为11位！";
		document.getElementById("phoneWarning").style.display="block";
	}else{
			var params = {
				phoneNum :phoneNum,
		    };
		    $.ajax({
		    type: "POST",
		    url: "registerAjax.action",
		    data: params,
		    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
		    success: function(json){ 
		    	var obj = $.parseJSON(json);  //使用这个方法解析json
		    	var flag = obj.flag;
		    	//alert(flag);
		    	if(flag){
		    		document.getElementById("phoneWarning").innerHTML="该号码已被注册！";
		    		document.getElementById("phoneWarning").style.display="block";
		    	}else{
		    		document.getElementById("phoneWarning").innerHTML="";
		    		document.getElementById("phoneWarning").style.display="none";
		    	}
		    },
		    error: function(json){
		    }
		    });
		
	}
}

function passwdValidate(){
	var passwd = document.getElementById("password").value;
	var comfirmPasswd = document.getElementById("comfirmpassword").value;
	if(passwd==""){
		document.getElementById("passwordWarning").innerHTML="请输入密码！";
		document.getElementById("passwordWarning").style.display="block";
		return false;
	}else if(passwd!=comfirmPasswd){
		document.getElementById("passwordWarning").innerHTML="两次输入的密码不一致！";
		document.getElementById("passwordWarning").style.display="block";
		return false;
	}else{
		document.getElementById("passwordWarning").innerHTML="";
		document.getElementById("passwordWarning").style.display="none";
		return true;
	}
}

function passwsOnfocus(){
	document.getElementById("password").type="password";
}

function passwdOnChange(){
	var passwd = document.getElementById("password").value;
	if(passwd==""){
		document.getElementById("passwordWarning").innerHTML="请输入密码！";
		document.getElementById("passwordWarning").style.display="block";
		return false;
	}else{
		document.getElementById("passwordWarning").innerHTML="";
		document.getElementById("passwordWarning").style.display="none";
		return true;
	}
}

function bankCardValidate(){
	var phoneNum = document.getElementById("bankCard").value;
	if(phoneNum.length!=19){
		document.getElementById("bankCardWarning").innerHTML="银行卡号应为19位！";
		document.getElementById("bankCardWarning").style.display="block";
		return false;
	}else{
		document.getElementById("bankCardWarning").innerHTML="";
		document.getElementById("bankCardWarning").style.display="none";
		return true;
	}
}

function nameValidate(){
	var name = document.getElementById("famliyName").value;
	if(name.length==0){
		document.getElementById("nameWarning").innerHTML="请填写姓氏！";
		document.getElementById("nameWarning").style.display="block";
		return false;
	}else{
		document.getElementById("nameWarning").innerHTML="";
		document.getElementById("nameWarning").style.display="none";
		return true;
	}
}

function telephoneSubmit(){
	var phoneNum = document.getElementById("phoneNum").value;
	var condition = document.getElementById("phoneWarning").style.display;
	if(phoneNum.length!=0 && condition=="none"){
		return true;
	}else{
		return false;
	}
}

function Validate(){
	if(passwdValidate()==true && telephoneSubmit()==true && nameValidate()==true && bankCardValidate()==true){
		return true;
	}else{
		return false;
	}
}


function ModifyValidate(){
	if(passwdOnChange()==true && telephoneSubmit()==true && bankCardValidate()==true){
		var phoneNum = $("#phoneNum").val();
		var passwd = $("#password").val();
		var bankCard = $("#bankCard").val();
		var params = {
				phoneNum :phoneNum,
				passwd :passwd,
				bankCard:bankCard,
		    };
		    $.ajax({
		    type: "POST",
		    url: "modifyAjax.action",
		    data: params,
		    dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
		    success: function(json){ 
		    	var obj = $.parseJSON(json);  //使用这个方法解析json
		    	var message = obj.message;
			    document.getElementById("modalTip").innerHTML = message;
			    $('#myModal').modal('show');
		    },
		    error: function(json){
		    	alert("网络故障，请稍后");
		    }
		    });
	}else{
		
	}
}