<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="header.jsp"%>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>


<div id="regLogin" class="wrap" onload="pageInit()">
	<div class="dialog">
		<dl class="clearfix">
			<dt>预定房间</dt>
			<dd class="past">填写订单信息</dd>

		</dl>
		<div class="box">
			<form id="order" name="order" method="post">
				<input type="hidden" name="hid" value="${hid }" /> <input
					type="hidden" name="uid" value="${user.uid }" /> <input
					type="hidden" name="ocondition" value="已提交订单" />

				<div class="infos">
					<table class="field">

						<tr>
							<td class="field">房源信息</td>
						</tr>


						<tr>
							<td class="field">房主名：${user.uname }</td>
						</tr>

						<tr>
							<td class="field">房子名：${house.hname}</td>
						</tr>
						<tr>
							<td class="field">房子价格：${house.hprice}</td>
						</tr>
						<tr>
							<td id="a" class="field" name="money">你应付：${jsonModel.obj.money}</td>
						</tr>


						<tr>
							<td class="field">入住时间：</td>
							<td class="input_content"><input type="text"
								name="hindateString" onfocus="WdatePicker({lang:'en'})"
								class="Wdate" onchange="refreshpaymoney()"/></td>
						</tr>
						<tr>
							<td class="field">退房时间:</td>
							<td class="input_content"><input type="text"
								name="houtdateString" onfocus="WdatePicker({lang:'en'})"
								class="Wdate" onchange="refreshpaymoney()" /></td>
						</tr>

					</table>
					<div class="buttons">
						<input type="button" value="提交订单" onclick="javascript:doReserve()" />

					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<script type="text/javascript">
	/*自动提交日期，回传回paymoney*/
	function refreshpaymoney() {
		
		var hindateString = document.getElementsByName("hindateString")[0].value;
		var houtdateString = document.getElementsByName("houtdateString")[0].value;
		$.ajax({
			type : "post",
			url : "reserve1.action?hindateString=" + hindateString
					+ "&houtdateString=" + houtdateString,
			dataType : "JSON",
			success : function(data) {
				if(data.code==1){
					 //<td id="a" class="field">你应付：${jsonModel.obj.money}</td>
					var str = "你应付："+data.obj.money;
					$("#a").text(str) ;
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
					location.href = "order_back.action";
				} else {

					alert("输入的日期有误，请重新输入");

				}
			}
		});
	}
</script>


<%@ include file="bottom.jsp"%>