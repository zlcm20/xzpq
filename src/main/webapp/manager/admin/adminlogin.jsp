<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script type="text/javascript">
	function changeImage() {
		document.getElementById("image01").src = "../../image.jsp?" + new Date();
	}
</script>

登录/<a href="manager/admin/adminReg.jsp">注册</a>
<FORM name="loginForm" action="adminlogin.action" method="post">
		用户名 &nbsp;
		 <INPUT class="input" tabIndex="1" type="text" maxLength="20" placeholder="请输入管理员账号" size="35" name="aname"> <br />
		 密 码 &nbsp;<INPUT class="input" tabIndex="2" type="password"  placeholder="请输入密码" maxLength="20" size="40" name="apassword">
			<br />
		 验证码： <input type="text" name="zccode" placeholder="请输入验证码"/> 
		 <img id="image01" src="image.jsp" /> 
		 <a href="javascript:void(0)" onclick="changeImage()">看不清</a> <br /> 
		 <INPUT class="btn" tabIndex="6" type="submit" value="登 录">
</FORM>


<%@ include file="../bottom.jsp"%>