<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

 	$(function(){
		goPages(1);
	})
	
 	function goPages(pages){
 		$.ajax({
 		      type:'POST',
 					url:"house_list.action",
 					data:"pages="+pages+"&pagesize=10",
 					dataType:"html",
 					success:function(data){
 						$("#houseArea").html(data);
 					}
 				});
 	}
	

</script>

<c:if test="${user!=null}">


<script>
			function add(){
				document.location="user/house_toAdd.action";
			}
</script> 
  
<div style="background-color:yellow; ">
	<div class="search">
				 
				<label class="ui-green" style="float:right;margin:0px 20px 0px 0px; ">
					<input type="button" name="search" value="退       出" 
					       onclick='document.location="/user_logout.action"' />
				</label>
				
				<label class="ui-green" style="float:right;margin:0px 20px 0px 0px; ">
					<input onclick="add()" type="button" name="search" value="发布房屋信息" />
				</label>
	</div>
	
	<div style="float:right;margin:10px 20px 0px 0px;font-size:20px; ">
					<a href="#">${user.uname }</a>
									<
				 <a href="house_dingdan.action/${house.hid }">订单管理${house.hid }</a>
	</div>
	
</div>	
</c:if>


<div class="main wrap">
		<div id="houseArea">
		
		</div>
</div>



<%@ include file="bottom.jsp" %>  