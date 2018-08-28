<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({
			url:'showadmin.action',
			pagination:true,
			pageSize:5,
			pageList:[1,3,5,7,9],
			title:'管理员列表',
			idField:"aid",
			rownumbers:true,
			fit:true,
			nowrap:true,
			sortName:"aid",
			sortOrder:"desc",
			singleSelect:true,
			columns:[[
			     {field:'aid',title:'编号',width:100},
			     {field:'aname',title:'管理员名',width:100}, 
			     {field:'apassword',title:'管理员密码',width:100,align:'right'}
			]],
			toolbar:[{
					iconCls:'icon-help',
					handler:function(){
						alert('help');
					}
				} 
			]
		});
	});
</script>

</head>
<body>

<table id="dg"></table>

</body>
</html>