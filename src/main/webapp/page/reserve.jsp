<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</head>
<style>
body{
	background-image: url(../images/background.jpg);
}
</style>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="regLogin" class="wrap" onload="pageInit()" >
	<div class="dialog">
			<dt>订单</dt>
			<dt class="past">查询订单信息</dt>

		
		<div class="box">
			<form id="order" name="order" method="post">
				<input type="hidden" name="hid" value="${hid }" /> <input
					type="hidden" name="uid" value="${user.uid }" /> <input
					type="hidden" name="ocondition" value="已提交订单" />

				<div class="infos">
					

						<tr>
							<td class="field"><h2>房源信息:</h2></td>
						</tr>


						<tr>
							<td class="field"><h3>用户名：${user.uname }</h3></td></br>
						</tr>

						<tr>
							<td class="field"><h3>房子名：${house.hname}</h3></td></br>
						</tr>
						<tr>
							<td class="field"><h3>房子价格：${house.hprice}</h3></td></br>
						</tr>
						<tr>
							<td class="field"><h3>你应付：<input id="a" class="field" name="money" readonly="readonly" style="width:50px;"/></h3></td></br>
							
						</tr>
						
						<tr>
							<td class="field"><h2>选择时间</h2></td>
						</tr>
						<tr>
						<c:if test="${dates==null || dates=='' || dates==[] }">
							<td class="field"><h3>入住时间：</h3></td>
						
								<td class="input_content">
								<input type="text"
									name="hindateString" onfocus="WdatePicker({lang:'en',minDate:'%y-%M-%d'})"
									class="Wdate" onchange="refreshpaymoney(${hid })"/></td>
						</c:if>
						<c:if test="${dates!=null && dates!='' &&dates!=[] }">
							<td class="field"><h3>入住时间：</h3></td>
								<td class="input_content">
								<input type="text"
									name="hindateString" onfocus="WdatePicker({lang:'en',minDate:'%y-%M-%d',disabledDates:${dates}})"
									class="Wdate" onchange="refreshpaymoney(${hid })"/></td>
						</c:if>
							
						</tr>
						
						<tr>
							<td class="field"><h3>退房时间:</h3></td>
							
						
							<td class="input_content"><input type="text"
								id="houtdateString" name="houtdateString" onfocus="WdatePicker({lang:'en',minDate:'%y-%M-%d',maxDate:'${din}'})"
								class="Wdate" onclick="refreshpaymoney(${hid })" /></td>
							
						
						</tr>

					<br />
					<br />
					<div class="buttons" style="margin-left:650px;">
						<input type="button" style=" width:100px;height:30px;font-size: 18px;margin:0 auto;" value="提交订单" onclick="javascript:doReserve()" />

					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<script type="text/javascript">
	/*自动提交日期，回传回paymoney*/
	function refreshpaymoney(hid) {
		
		var hindateString = document.getElementsByName("hindateString")[0].value;
		if(hindateString==null || hindateString==""){
			alert("请先选择入住日期");
			location.href = "house_reserve.action?hid="+hid;
		}
		var houtdateString = document.getElementsByName("houtdateString")[0].value;
		var data = {};
		if(houtdateString==null || houtdateString=="") {
			data = {hindateString:hindateString,hid:hid};
		} else {
			data = {hindateString:hindateString,hid:hid,houtdateString:houtdateString};
		}
		
		$.ajax({
			type : "post",
			url : "reserve1.action",
			data:data,
			dataType : "JSON",
			success : function(data) {
				if(data.code==1){
					 //<td id="a" class="field">你应付：${jsonModel.obj.money}</td>
					 var p=data.msg;
					 var beg=data.beginDate;
					//alert(p);
					if(p!=null){
						$("#houtdateString").attr("onfocus","WdatePicker({lang:'en',minDate:'"+beg+"',maxDate:'"+p+"'})");
					}else{
						$("#houtdateString").attr("onfocus","WdatePicker({lang:'en',minDate:'"+beg+"'})");
					}
					
					if(data.obj!=null){
					var str =data.obj.money;
					$("#a").val(str) ;
					}
				} else {

					alert("输入的日期有误，请重新输入");

				}
			}

		});
	}
	/* } */
	/* } */

	function doReserve() {
		$.ajax({
			type : "post",
			url : "reserve.action",
			data : $("#order").serialize(),
			dataType : "JSON",

			success : function(data) {

				if ($.trim(data) == "true") {

					alert("提交成功");
					location.href = "orderdetail.action";
				} else {

					alert("输入的日期有误，请重新输入");

				}
			}
		});
	}
</script>


<%@ include file="bottom.jsp"%>