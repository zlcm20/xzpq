<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({
			url:'fangdong.action',
			pagination:true,
			pageSize:100,
			pageList:[20,50,100,150,200,400],
			title:'房东列表',
			idField:"uid",
			rownumbers:true,
			fit:true,
			nowrap:true,
			sortName:"uid",
			sortOrder:"desc",
			singleSelect:true,
			columns:[[
			     {field:'uid',title:'编号',width:80},
			     {field:'uname',title:'房东姓名',width:100}, 
			     {field:'usex',title:'房东性别',width:80,align:'right'}, 
			     {field:'uidcard',title:'房东身份证号',width:150,align:'right'},
			     {field:'utel',title:'房东手机号',width:100,align:'right'},
			     {field:'uaccount',title:'房东账号',width:100,align:'right'},
			     {field:'regdateString',title:'房东注册时间',width:120,align:'right'} 
			]]
		});
	});
</script>

</head>
<body>

<table id="dg"></table>

<%@ include file="../bottom.jsp" %>