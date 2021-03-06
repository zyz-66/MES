<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>绩效管理参数配置</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<!-- tab头部 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/kpi/performType/">绩效列表</a></li>
		<li><a href="${ctx}/kpi/performType/form">绩效添加</a></li>
	</ul>
	<!-- 查询部分 -->
	<form:form id="searchForm" modelAttribute="performType" action="${ctx}/kpi/performType/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<label>绩效名称 ：</label>
		<form:input path="performTypeName" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<sys:message content="${message}"/>
	<!-- 列表 -->
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>绩效名称</th><th>单价（分）</th><th>单位</th><th>操作</th></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="performType">
			<tr>
				<td>${performType.performTypeName}</td>
				<td>${performType.performTypeNum}</td>
				<td>${performType.performTypeUnit}</td>
				
				<td>
    				<a href="${ctx}/kpi/performType/form?id=${performType.id}">修改</a>
					<a href="${ctx}/kpi/performType/delete?id=${performType.id}" onclick="return confirmx('确认要删除该绩效信息吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<!-- 分页 -->
		<div class="pagination">${page}</div>
	</table>
</body>
</html>