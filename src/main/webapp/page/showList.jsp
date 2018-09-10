<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ page import="com.yc.utils.*,java.util.*,com.yc.bean.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.house-list img {
	width: 400px;
	height: 400px;
}

.imgtext {
	width: 200px;
	height: 60px;
	position: absolute;
	bottom: 10px;
	left: 0;
	float: left;
	text-align: left;
}

.xiugai {
	width: 130px;
	height: 30px;
	position: absolute;
	bottom: 10px;
	right: 30px;
	float: right;
}

.xiugai input {
	
}
</style>


<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.3&services=true"></script>
    <!-- 页面地图js方法 -->
    <script type="text/javascript">
        // 在指定容器创建地图实例并设置最大最小缩放级别
        var map = new BMap.Map("allmap", {
            minZoom: 5,
            maxZoom: 19
        });

        // 初始化地图，设置中心点和显示级别
        map.centerAndZoom(new BMap.Point(121.36564, 31.22611), 19);

        // 开启鼠标滚轮缩放功能，仅对PC上有效
        map.enableScrollWheelZoom(true);

        // 将控件（平移缩放控件）添加到地图上
        map.addControl(new BMap.NavigationControl());

        // 为地图增加点击事件，为input赋值
        map.addEventListener("click", function(e) {
            document.getElementById('lat').value = e.point.lat;
            document.getElementById('lng').value = e.point.lng;

        });

        // 创建位置检索、周边检索和范围检索
        var local = new BMap.LocalSearch(map, {
            renderOptions: {
                map: map
            }
        });

        // 发起检索
       
        function theLocation(i) {
            	var city = document.getElementsByClassName("cityName")[i].value;
            if (city != "") {
                local.search(city);
            }
           
        };
        function outLocation() {
            var city ="";
        };

    </script>

<script type="text/javascript">


function update(hid,pages){
	alert("修改？");
	location.href="user/house_toUpdate.action?hid="+hid;
}

function del(hid,pages){
	var r=window.confirm("您确定要删除编号为："+hid+"的记录吗?");
	//alert(r);
	if(r==true){
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
 										


			 <div id="allmap" style="width:600px;height:100%;left:10px;top:5px;float: left;" ></div>
									    <!-- 搜索显示框 -->
	<table style="width: 700px; margin-left: 630px; ">		
	<div style="float: right;">
		<c:forEach items="${ jsonModel.rows}" var="v" varStatus="vs">
		
			<c:if test="${ v.hcondition=='已审核'}">
				<tr style="display: block;">
					<td style="width: 345px; height: 295px; margin-top: 8px; float: left; text-align: center;">
						 <img src="${v.hpic }" onmouseover="theLocation(${vs.index})" onmouseout="outLocation()" style="width: 340px; height: 230px; float: left;" />
							
						<input  class="cityName" value="${v.addr.province }${v.addr.city}${v.addr.town}" style="display:none; " />     
									   
						<dl>
							<dt>
								<a href="house_detail.action/${v.hid }"> ${v.hname } </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${user!=null && user!=''}">
									<c:if test="${user.uid==v.uid}">

										<input type="button"
											style="background: rgba(0, 0, 0, 0); border: none;"
											onclick='update(${v.hid},${jsonModel.pages })' value="修    改" />
											&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button"
											style="background: rgba(0, 0, 0, 0); border: none;"
											onclick='del(${v.hid},${jsonModel.pages })' value="删    除" />

									</c:if>
								</c:if>
							</dt>
							<dd>
								${v.addr.province}${v.addr.city}${v.addr.town}${v.addr.xxaddr}</dd>
							<dd>${v.peizhi.rent }/${v.peizhi.shi }室${v.peizhi.ting }厅/宜住${v.peizhi.ting }人
							</dd>
						</dl>
					</td>


				</tr>
			</c:if>
		</c:forEach>
	</div>





</table>


<div class="pager">
	<ul>
		<li class="current"><a href="javascript:goPages(1)">首页</a></li>
		<%
			JsonModel jsonModel = (JsonModel) request.getAttribute("jsonModel");
			int pages = jsonModel.getPages();
			int total = jsonModel.getTotal();
			int pagesize = jsonModel.getPagesize();
			int totalPages = total % pagesize == 0 ? total / pagesize : total
					/ pagesize + 1;
			int prepage = pages;
			if (pages > 1) {
				prepage = pages - 1;
			}
			int nextpage = totalPages;
			if (pages < totalPages) {
				nextpage = pages + 1;
			}
		%>
		<li class="current"><a href="javascript:goPages(<%=prepage%>)">上一页</a>
		</li>
		<li class="current"><a href="javascript:goPages(<%=nextpage%>)">下一页</a>
		</li>
		<li class="current"><a href="javascript:goPages(<%=totalPages%>)">尾页</a></li>
	</ul>
	<span class="total">第<%=pages%>页/共<%=totalPages%>頁 记录总数：<%=total%>条
		每页显示<%=pagesize%>条
	</span>
</div>
