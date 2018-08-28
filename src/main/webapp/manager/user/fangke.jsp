<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({
			url:'fangke.action',
			pagination:true,
			pageSize:20,
			pageList:[20,50,100,150,200,400],
			title:'房客列表',
			idField:"uid",
			rownumbers:true,
			fit:true,
			nowrap:true,
			sortName:"uid",
			sortOrder:"desc",
			singleSelect:true,
			columns:[[
			     {field:'uid',title:'编号',width:80},
			     {field:'uname',title:'房客姓名',width:100}, 
			     {field:'usex',title:'房客性别',width:80,align:'right'}, 
			     {field:'uidcard',title:'房客身份证号',width:150,align:'right'},
			     {field:'utel',title:'房客手机号',width:100,align:'right'},
			     {field:'uaccount',title:'房客账号',width:100,align:'right'},
			     {field:'regdateString',title:'房客注册时间',width:120,align:'right'} 
			]]
		});
	});
</script>

</head>
<body>

<table id="dg"></table>

<%@ include file="../bottom.jsp" %>