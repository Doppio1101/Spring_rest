<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function checkID(){
		var id = $("#userId").val();
		alert('check '+$("#userId").val());
		$.ajax(
			{
	         type:"get",
	         url:"/rest/member/checkId.do",
	         contentType: "application/json",
	         data :{"userId":$("#userId").val()},
		     success:function (data,textStatus){
		    	 //아이디 중복 파악 여부
		    	 //alert(data);
		    	 var obj = JSON.parse(data);
		    	 alert(obj.result);
		    	 if(obj){
		    		 $('#message').text(id+"중복되는 아이디 사용불가능");	 
		    	 }else{
		    		 $('#message').text(id+"사용가능");
		    	 }
		    	 
		     },
		     error:function(data,textStatus){
		        alert("사용가능한 아이디입니다.");
		        $('#message').text(id+"사용가능");
		     },
		     complete:function(data,textStatus){
		    	 
		     }
		  }	
		);
		return false;
	}
</script>
</head>
<body>
	<form action="" method="">
		<input type="text" name="userId" id="userId">
		<input type="button" value="확인" onclick="checkID()"><br>
		<span id="message"></span><br>
		<input type="password" name="pwd" id="pwd">
		<input type="submit" value="login">
	</form>
</body>
</html>