<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ page import="com.yc.utils.*,java.util.*,com.yc.bean.*" %>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">

function update(hid,pages){
	alert("修改？");
	location.href="user/house_toUpdate.action?hid="+hid;
}

function del(hid,pages){
	var r=window.confirm("您确定要删除编号为："+hid+"的记录吗?");
	//alert(r);
	if(r==true){
		alert("aaa");
		$.ajax({
		      type:'POST',
					url:"user/house_del.action",
					data:"hid="+hid,
					dataType:"json",
					success:function(data){
						alert(data);
						goPages(pages);
					}
				});
	}
	
} 

</script>

		<table class="house-list">

			 <c:forEach items="${ jsonModel.rows}"  var="v">
			 	<c:if test="${ v.hcondition=='已审核'}">
				<tr>
					<td class="house-thumb">
						<span>
							 <a  href="page/show.jsp?hid=15"> 
							  <img src="images/thumb_house.gif" />
							 </a>
						</span>
					</td>
					
					<td>
						<dl>
							<dt>
								<a href="house_detail.action/${v.hid }">${v.hname }</a>
							</dt>
							<dd>
							 ${v.addr.province}${v.addr.city}${v.addr.town}${v.addr.xxaddr}
							</dd>
							<dd>
							 ${v.peizhi.rent }/${v.peizhi.shi }室 ${v.peizhi.ting }厅/宜住${v.peizhi.ting }人
							</dd>
						</dl>
					</td>
					
					<c:if test="${user.uid==v.uid}"> 
							<td class="house-type">
								<label class="ui-green">
									<input type="button" onclick='update(${v.hid},${jsonModel.pages })' value="修    改" />
								</label>
					    </td>
							<td class="house-price">
								<label class="ui-green">
										<input	type="button" onclick='del(${v.hid},${jsonModel.pages })' value="删    除" />
								</label>
							</td>
				 	</c:if> 
						<c:if test="${ user.uid != v.uid}">
								<td class="house-type" colspan="2"></td>
						</c:if>
					
					
					
				</tr>
			</c:if>
			
			</c:forEach>
	</table>		





<div class="pager">
	<ul>
		<li class="current">
				<a href="javascript:goPages(1)" >首页</a>
		</li>
		<%
	    JsonModel jsonModel=(JsonModel)request.getAttribute("jsonModel");
	    int pages=jsonModel.getPages();
	    int total=jsonModel.getTotal();
	    int pagesize=jsonModel.getPagesize();
	    int totalPages=   total%pagesize==0?total/pagesize:total/pagesize+1;
	    int prepage=pages;
	    if(pages>1){
	    	prepage=pages-1;
	    }
	    int nextpage=totalPages;
	    if( pages<totalPages){
	    	nextpage=pages+1;
	    }
		%>
		<li class="current">
		    <a href="javascript:goPages(<%=prepage %>)" >上一页</a> 
		</li>
		<li class="current">
		   <a href="javascript:goPages(<%=nextpage %>)" >下一页</a> 
		</li>
		<li class="current">
		    <a href="javascript:goPages(<%=totalPages %>)" >尾页</a> 
		</li>
	</ul>
	<span class="total">第<%=pages %>页/共<%=totalPages %>頁 记录总数：<%=total%>条 每页显示<%=pagesize %>条</span>
</div>

