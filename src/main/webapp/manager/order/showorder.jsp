<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	
	 #oconditionType{
		margin-top:30px;
		margin-left:250px;
		margin-bottom:30px;
		width:125px;
		height:35px;
		border-radius:8px;
		
	}
</style>
<script type="text/javascript">
	$( abc = function(){
		  	$('#dg').datagrid({
			url:'showorder.action',
			pagination:true,
			pageSize:5,
			pageList:[5,10,15,20,30],
			title:'订单列表',
			idField:"oaid",
			rownumbers:true,
			fit:false,
			nowrap:true,
			sortName:"oaid",
			sortOrder:"desc",
			singleSelect:true,
			queryParams:{
				ocondition:  $("#oconditionType").find("option:selected").text()
			},
			columns:[[
			     {field:'oaid',title:'订单编号',width:100},
			     {field:'uid',title:'房客id',width:100}, 
			     {field:'hid',title:'房子id',width:100}, 
			     {field:'hindate',title:'入住时间',width:100}, 
			     {field:'houtdate',title:'退房日期',width:100}, 
			     {field:'ocondition',title:'状态',width:100,align:'right'} 
			]]
		});
	});
</script>

</head>
<body>
<div class="xz">
	<select id="oconditionType" name="ocondition" onchange="abc()" >
			<option selected="selected">全部</option>
			<option>待付款</option>
			<option>已成交</option>
	</select> 
</div>
<div class="dg">
	<table id="dg"></table>
</div>
</body>
</html>