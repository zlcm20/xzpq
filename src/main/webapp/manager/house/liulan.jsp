<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({
			url:'liulan.action',
			pagination:true,
			pageSize:5,
			pageList:[5,10,15,20,25,30],
			title:'房屋已审核',
			idField:"hid",
			rownumbers:true,
			nowrap:true,
			fit:true,
			sortName:"hid",
			sortOrder:"desc",
			singleSelect:true,
			columns:[[
			     {field:'hid',title:'编号',width:90},
			     {field:'hname',title:'房屋名字',width:90,align:'right'},				   
			     {field:'hprice',title:'房屋价格',width:90,align:'right'},
			     {field:'hpubdateString',title:'房屋注册时间',width:90,align:'right'}, 
			     {field:'hdescription',title:'房屋描述',width:130,align:'right'},
			     {field:'hfloorage',title:'房屋面积',width:90,align:'right'},
			     {field:'hsum',title:'适宜居住人数',width:90,align:'right'}, 
			     {field:'uid',title:'房东编号',width:90,align:'right'},
			     {field:'addrid',title:'地址编号',width:90,align:'right'},
			     {field:'province',title:'省',width:90,align:'right',formatter:function(value,row,index){
                     return row.addr.province;
			        }},
			     {field:'city',title:'市',width:90,align:'right',formatter:function(value,row,index){
	                     return row.addr.city;
				        }},
				 {field:'town',title:'县/区',width:90,align:'right',formatter:function(value,row,index){
		                     return row.addr.town;
					  }},
				{field:'xxaddr',title:'详细地址',width:90,align:'right',formatter:function(value,row,index){
		                     return row.addr.xxaddr;
					  }},
				{field:'doornumber',title:'门牌号',width:90,align:'right',formatter:function(value,row,index){
		                     return row.addr.doornumber;
					  }},
				{field:'pzid',title:'配置编号',width:90,align:'right'},
				{field:'bed',title:'床型信息',width:90,align:'right',formatter:function(value,row,index){
                    		return row.peizhi.bed;
			  			}},
			     {field:'rent',title:'出租类型',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.rent;
					  }},
			    
				{field:'shi',title:'室',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.shi;
					  }},	
				{field:'ting',title:'厅',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.ting;
				      }},	
				{field:'chu',title:'厨',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.chu;
					  }},	
				{field:'yangtai',title:'阳台',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.yangtai;
					  }},	
				{field:'toilet',title:'卫',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.toilet;
					  }},	
				{field:'floor',title:'楼层',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.floor;
					  }},	
				{field:'towards',title:'朝向',width:90,align:'right',formatter:function(value,row,index){
		                     return row.peizhi.towards;
					  }},	  
			     {field:'hcondition',title:'状态',width:90,align:'right'},
			  
			]]
		});
	});
	
	
	
	
	
</script>

</head>
<body>

<table id="dg"></table>

<%@ include file="../bottom.jsp" %>