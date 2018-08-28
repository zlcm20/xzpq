<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({
			url:'shenhe.action',
			pagination:true,
			pageSize:5,
			pageList:[5,10,15,20,25,30],
			title:'房屋未审核',
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
			     {field:'hconditions',title:'审核',width:150,align:'center',formatter:function(val,row,index){
			    	 return '<a href="javascript:void(0)" onclick="showReorderDetail('+row.hid+')">已审核</a>  <a href="javascript:void(0)" onclick="showReorder('+row.hid+')">未通过</a>';
	        	  }
	          }
			]]
		});
	});
	
	
	//显示订单详情
	function showReorderDetail(hid,hcondition){
		alert('确定？'+hid);
		 var hcondition='已审核';
		$.ajax({
			url:"zhuangtai.action?hid="+hid+"&hcondition="+hcondition,
			dataType:'JSON',
			success:function(data){
				if(data.code==1){
					alert('已审核');
				}else{
					alert('审核失败');
				}
			}
		});
		
	}
	function showReorder(hid,hcondition){
		alert('确定？'+hid);
		var hcondition='未通过';
		$.ajax({
			url:"zhuangtai.action?hid="+hid+"&hcondition="+hcondition,
			dataType:'JSON',
			success:function(data){
				if(data.code==1){
					alert('未通过');
				}else{
					alert('未通过错误');
				}
			}
		});
		
	}
	
	
</script>

</head>
<body>

<table id="dg"></table>

<%@ include file="../bottom.jsp" %>