<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#regbtn").click(function(){
		$.ajax({
			url:'adminreg.action',
			type:'POST',
			datatype:'JSON',
			data: $("#myform").serialize(),
			success:function(data){
				//data  -> 一个json 对象  -> {code:1/0  ,msg:'' , obj:[]}
				if(data.code==1){
					alert('注册成功');
					clearAll();
				}else{
					alert('注册失败,原因：'+data.msg);
				}
			}
			
		});
	});
	
	function clearAll(){
		$("#aname").val('');
		$("#apassword").val('');
	}
});
</script>

</head>
<body align="center">
	<a href="manager/admin/adminlogin.jsp">登录</a>/注册
	<FORM id="myform" action="adminreg.action" method="post">
		<br />管理员名 &nbsp;
		<INPUT   type="text" name="aname" id="aname"> <br />
			密 码 &nbsp;<INPUT type="password" name="apassword" id="apassword"> <br />
		<INPUT  type="button" value="注册" id="regbtn">
	</FORM>

</body>
</html>