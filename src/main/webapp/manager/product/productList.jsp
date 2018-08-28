<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript">
	$(function(){
		var editor = CKEDITOR.replace('product_explain');
		
		$('#saveProduct').click(function(){
			var explain= editor.getData();
			explain = encodeURIComponent(escape(explain));
			var product = {
					"product_name":$("#product_name").val(),
					"product_class":$("#product_class").val(),
					"product_in":$("#product_in").val(),
					"product_explain":explain
			};
			$.ajaxFileUpload({
				type:"POST",
				fileElementId:["product_picture"],
				secureuri:true,
				url:"backlogin/uploadFile.action",
				data:product,
				dataType:"JSON",
				success:function(data){
					if(data.code==1){
						
					}
				}
			});
			$('#dlg').dialog('close');
			alert("添加产品成功");
		});
		
		$('#dg').datagrid({
			url:'backlogin/product.action?op=list',
			pagination:true,
			pageSize:100,
			pageList:[20,50,100,150,200,400],
			title:'产品列表',
			idField:"id",
			rownumbers:true,
			fit:true,
			nowrap:true,
			sortName:"id",
			sortOrder:"desc",
			singleSelect:true,
			columns:[[
			     {field:'id',title:'编号',width:100},
			     {field:'Product_name',title:'产品名',width:100}, 
			     {field:'Product_class',title:'类别',width:100,align:'right'}, 
			     {field:'Product_spec',title:'规格',width:100,align:'right'} 
			]],
			toolbar:[{
					iconCls:'icon-add',
					handler:function(){
						$.ajax({
							url:'backlogin/product.action?op=getAlllProductClass',
							dataType:'JSON',
							type:'post',
							success:function(data){
								$("#product_class").html('');
								var selectString="";
								if(data.code==1){
									for(var i=0;i<data.obj.length;i++){
										var item = data.obj[i];
										selectString+='<option value="'+item.protype +'">'+ item.protype +'</option>';
									}
									$("#product_class").html(selectString);
								}
							}
						});
						
						$("#dlg").dialog('open').dialog('center').dialog('setTitle','新产品上架');
					}
				},'-',{
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

<div id="dlg" class="easyui-dialog" style="width:800px;height:450px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true" closed='true' buttons="#dlg-buttons">
	<form id="fm" method="post" novalidate enctype="mutipart/form-data">
		<div>
			<label>产品名:</label>
			<input id="product_name" name="product_name" class="easyui-textbox" required="true" />
		</div>
		<div>
			<label>类别:</label>
			<select id="product_class" name="product_class" ></select>
		</div>
		<div>
			<label>来源:</label>
			<input id="product_in" name="product_in" class="easyui-textbox" required="true" />
		</div>
		<div class="product_picture">
			<label>图片:</label>
			<input id="product_picture" name="product_picture" type="file" />
		</div>
		<div>
			<label>详情:</label>
			<textarea class="ckeditor" id="product_explain" name="product_explain"></textarea>
		</div>
		
	</form>
</div>
<div id="dlg-buttons">
	<a href="javascript:void(0)" id="saveProduct" class="easyui-linkbutton c6" iconCls="icon-ok" style="width:90px">save</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">cancel</a>
</div>

</body>
</html>