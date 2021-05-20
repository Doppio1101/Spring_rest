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
	         data :{"userId":id},
		     success:function (data,textStatus){
		    	 //아이디 중복 파악 여부
		    	 //alert(data);
		    	 var obj = JSON.parse(data);
		    	 alert("data => "data);//data가 {"result":true}형식으로 들어온다.
		    	 //var obj = JSON.parse(data); 이렇게 하면
		    	 //var obj = {"result":true}; 형태로 제이쿼리의 형식이 되나보다.
		    	 alert("obj.result => "+obj.result);//obj.result로 접근하여 ture/false가 나온다.
		    	 alert("obj => "+obj);//obj는 오브젝트 형식이다. 데이터 접근을 명확히 해야한다.

		    	 if(obj.result){
		    		 $('#message').text(id+"중복되는 아이디 사용불가능");	 
		    	 }else{
		    		 $('#message').text(id+"사용가능");
		    	 }
		    	 
		     },
		     error:function(data,textStatus){
		        alert("에러");
		        
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