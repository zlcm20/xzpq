<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({
			url:'showfdorder.action',
			pagination:true,
			pageSize:5,
			pageList:[5,10,15,20,30],
			title:'订单列表',
			idField:"oaid",
			rownumbers:true,
			fit:true,
			nowrap:true,
			sortName:"oaid",
			sortOrder:"desc",
			singleSelect:true,
			columns:[[
			     {field:'oaid',title:'订单编号',width:60},
			     {field:'user.uid',title:'房东id',width:60,formatter:function(value,row,index){
	                    return row.user.uid;
				  		}},
			     {field:'user.uname',title:'房东姓名',width:60,formatter:function(value,row,index){
	                    return row.user.uname;
				  		}},
				 {field:'user.usex',title:'性别',width:30,formatter:function(value,row,index){
		                    return row.user.usex;
					  		}},
				 {field:'user.uidcard',title:'身份证号',width:60,formatter:function(value,row,index){
			                return row.user.uidcard;
						  	}},
				 {field:'user.utel',title:'电话',width:60,formatter:function(value,row,index){
				            return row.user.utel;
							}},
				 {field:'user.uaccount',title:'账户',width:60,formatter:function(value,row,index){
			                return row.user.uaccount;
						  	}},
				 {field:'user.regdate',title:'注册时间',width:60,formatter:function(value,row,index){
				            return row.user.regdate;
							}},
			     {field:'hid',title:'房子id',width:60}, 
			  	 {field:'addrid',title:'地址id',width:60,formatter:function(value,row,index){
	                    return row.house.addrid;
				  		}},
				 {field:'hname',title:'房间名称',width:60,formatter:function(value,row,index){
		                return row.house.hname;
					  	}},
				 {field:'hprice',title:'价格',width:30,formatter:function(value,row,index){
			            return row.house.hprice;
						}},
				 {field:'hdescription',title:'描述',width:60,formatter:function(value,row,index){
					    return row.house.hdescription;
						}},
				 {field:'hfloorage',title:'面积',width:30,formatter:function(value,row,index){
						return row.house.hfloorage;
						}},
				 {field:'hsum',title:'可住人数',width:60,formatter:function(value,row,index){
						return row.house.hsum;
						}},
			     {field:'hindate',title:'入住时间',width:60}, 
			     {field:'houtdate',title:'退房日期',width:60}, 
			     {field:'ocondition',title:'状态',width:30,align:'left'} 
			]]
		});
	});
</script>

</head>
<body>

<table id="dg"></table>

</body>
</html>