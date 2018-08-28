<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ include file="../header.jsp"%>

<script type="text/javascript">
	$(function() {
		var adminTreeData=[
			  				{
			  					"id":1,
			  					"text":"管理员列表",
			  					"attributes":{
			  						"url":"<iframe width='100%' height='100%' src='manager/admin/showAdmin.jsp' />"
			  					}
			  				},
			  				{
			  					"id":2,
			  					"text":"管理员注册",
			  					"attributes":{
			  						"url":"<iframe width='100%' height='100%' src='manager/admin/adminReg.jsp' />"
			  					}
			  				}
			  			];
			
			var orderTreeData=[
			   				{
			   					"id":1,
			   					"text":"订单列表",
			   					"attributes":{
			   						"url":"<iframe width='100%' height='100%' src='manager/order/showorder.jsp' />"
			   					}
			   				},
			   				{
			   					"id":2,
			   					"text":"房东订单列表",
			   					"attributes":{
			   						"url":"<iframe width='100%' height='100%' src='manager/order/fdorder.jsp' />"
			   					}
			   				},
			   				{
			   					"id":3,
			   					"text":"房客订单列表",
			   					"attributes":{
			   						"url":"<iframe width='100%' height='100%' src='manager/order/fkorder.jsp' />"
			   					}
			   				}
			   			];
			var userTreeData = [
			    				{
			    					"id" : 1,
			    					"text" : "房东浏览",
			    					"attributes" : {
			    						"url" : "<iframe width='100%' height='100%' src='manager/user/fangdong.jsp' />"
			    					}
			    				},
			    				{
			    					"id" : 2,
			    					"text" : "房客浏览",
			    					"attributes" : {
			    						"url" : "<iframe width='100%' height='100%' src='manager/user/fangke.jsp' />"
			    					}
			    				},
			    				{
			    					"id" : 3,
			    					"text" : "推荐",
			    					"attributes" : {
			    						"url" : "<iframe width='100%' height='100%' src='manager/product/productList.jsp' />"
			    					}
			    				} ];
			    		var houseTreeData = [
			    				{
			    					"id" : 1,
			    					"text" : "房屋待审核",
			    					"attributes" : {
			    						"url" : "<iframe width='100%' height='100%' src='manager/house/shenhe.jsp' />"
			    					}
			    				},
			    				{
			    					"id" : 2,
			    					"text" : "房屋浏览",
			    					"attributes" : {
			    						"url" : "<iframe width='100%' height='100%' src='manager/house/liulan.jsp' />"
			    					}
			    				},
			    				{
			    					"id" : 3,
			    					"text" : "评分排行",
			    					"attributes" : {
			    						"url" : "<iframe width='100%' height='100%' src='manager/house/pingfen.jsp' />"
			    					}
			    				} ];
		showTree("adminTree", adminTreeData);
		showTree("orderTree", orderTreeData);
		showTree("userTree", userTreeData);
		showTree("houseTree", houseTreeData);

	});

	function showTree(treeId, treeData) {
		$("#" + treeId).tree({
			data : treeData,
			onClick : function(node) {
				if (node && node.attributes) {
					openTab(node);
				}

			}
		});
	}

	function openTab(node) {
		if ($("#mainTabs").tabs("exists", node.text)) {
			$("#mainTabs").tabs("select", node.text);
		} else {
			$("#mainTabs").tabs("add", {
				title : node.text,
				closable : true,
				selected : true,
				content : node.attributes.url
			});
		}

	}
</script>

</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 50px">N</div>
	<div data-options="region:'south',split:true" style="height: 50px;">S</div>
	<div data-options="region:'east',split:true" title="East"
		style="width: 150px;">E</div>
	<div data-options="region:'west',split:true" title="West"
		style="width: 150px;">


		<div class="easyui-accordion" style="width: 150px; height: 300px;">

			<div title="管理员管理" data-options="iconCls:'icon-ok'"
				style="overflow: auto; padding: 10px;">
				<ul id="adminTree" class="easyui-tree">

				</ul>
			</div>
			
			<div title="订单管理" data-options="iconCls:'icon-ok'"
				style="overflow: auto; padding: 10px;">
				<ul id="orderTree" class="easyui-tree">

				</ul>
			</div>
			
			<div title="用户管理" data-options="iconCls:'icon-ok'"
				style="overflow: auto; padding: 10px;">
				<ul id="userTree" class="easyui-tree">

				</ul>
			</div>

			<div title="房屋管理" data-options="iconCls:'icon-ok'"
				style="overflow: auto; padding: 10px;">
				<ul id="houseTree" class="easyui-tree">

				</ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
		<div class="easyui-tabs" id="mainTabs"
			style="width: 100%; height: 100%;">
			<div title="欢迎面板" style="padding: 10px">
				源辰信息欢迎您，今天是：
				<%
				Date d = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
			%>
				<%=sdf.format(d)%>
			</div>
		</div>
<%@ include file="../bottom.jsp"%>