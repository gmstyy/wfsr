<%@ include file="../header.jsp"%>
<div class="content">
	<div class="meeu_mian">
		<div class="masonry" style="position: relative; height: 668px;"
			id="container">
			<c:forEach var="food" items="${foodList}" varStatus="status">
				<div class="item masonry-brick" style="top: 0px; left: 0px;">
					<dl>
						<dt>
							<a href="${ctx}/foodList/detail?id=${food.id}"></a> <img
								src="${ctx}/images/foodList/list/${food.id}.jpg"
								alt="${food.remark}" width="234">
						</dt>
						<dd class="radius_5_hb">
							<a href="javascript:;">${food.name}</a>
						</dd>
					</dl>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="side_nav">
		<ul>
			<c:forEach var="menu" items="${menuList}" varStatus="status">
				<li><a <c:if test="${menu.id==cMenuId}"> class ="hover"</c:if>
					href="${pageContext.request.contextPath}/${menu.url}">${menu.name}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>


