<%@include file="/WEB-INF/views/fragment/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url var="firstUrl" value="/user" />
<c:url var="lastUrl" value="/user/${deploymentLog.totalPages}" />
<c:url var="prevUrl" value="/user/${currentIndex - 1}" />
<c:url var="nextUrl" value="/user/${currentIndex + 1}" />

<div class="container custom-container">
	<form:form method="get" modelAttribute="usersearch"
		class="form-horizontal"
		action="${pageContext.request.contextPath}/search">
		<div class="form-group">

			<div class="col-md-1">
				<form:label path="searchText" class="col-sm-2 control-label">Search</form:label>
			</div>

			<div class="col-md-6">
				<form:input path="searchText" name="searchText" class="form-control"
					placeholder="Enter value to search"></form:input>
			</div>

			<div class=" col-md-5 pull-right">
				<a href="<c:url value = "/userform"/>">
					<button type="button" class="btn btn-success btn-md custom-padding">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						Add User
					</button> &nbsp;
				</a> <a href="<c:url value = "/user"/>">
					<button type="button" class="btn btn-warning btn-md">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						Reload
					</button>
				</a> <a href="<c:url value = "/userapi"/>">
					<button type="button" class="btn btn-info btn-md">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						Display Json
					</button>
				</a>
			</div>
		</div>
	</form:form>
	<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">User Information</div>
				<div class="panel-body">
					<table class="table table-bordered table-responsive" id = "tblData">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Contact No</th>
								<th>Address</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="userinfo" items="${userinfo}">
								<tr>
									<td><c:out value="${userinfo.fname}" /></td>
									<td><c:out value="${userinfo.lname}" /></td>
									<td><c:out value="${userinfo.contact}" /></td>
									<td><c:out value="${userinfo.address}" /></td>
									<td width="18%"><a
										href="<c:url value = "/edit/${userinfo.userId}"/>"
										class="btn btn-fill btn-primary"> <span
											class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
											Edit
									</a> <a href="<c:url value = "/delete/${userinfo.userId}"/>"
										class="btn btn-fill btn-danger btn-md"
										onclick="if (!confirm('Are you sure you want to delete?'))
                                                               return false;">
											<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
											Delete
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
	</div>

	<ul class="pagination">
		<c:choose>
			<c:when test="${currentIndex == 1}">
				<li class="disabled"><a href="#">First</a></li>
				<li class="disabled"><a href="#">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${firstUrl}">First</a></li>
				<li><a href="${prevUrl}">Previous</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
			<c:url var="pageUrl" value="/user/${i}" />
			<c:choose>
				<c:when test="${i == currentIndex}">
					<li class="active"><a href="${pageUrl}"><c:out
								value="${i}" /></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${currentIndex == deploymentLog.totalPages}">
				<li class="disabled"><a href="#">Next</a></li>
				<li class="disabled"><a href="#">Last</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${nextUrl}">Next</a></li>
				<li><a href="${lastUrl}">Last</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<%@include file="/WEB-INF/views/fragment/footer.jsp"%>
<%@include file="/WEB-INF/views/fragment/respagination.jsp"%>
<%@include file="/WEB-INF/views/fragment/datatable.jsp"%>