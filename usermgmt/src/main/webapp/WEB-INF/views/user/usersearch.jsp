
<%@include file="/WEB-INF/views/fragment/header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					</button>

				</a> <a href="<c:url value = "/userapi"/>">
					<button type="button" class="btn btn-info btn-md">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						Display Json
					</button>
				</a> <a href="<c:url value = "/user"/>">
					<button type="button" class="btn btn-warning btn-md">
						<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
						Reload
					</button>
				</a>
			</div>
		</div>
	</form:form>
	<div class="row">
		<div class="panel panel-primary">
			<div class="panel-heading">User Information</div>
			<div class="panel-body">
				<table class="table table-bordered">
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
						<c:forEach var="userinfo" items="${userSearch}">
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
</div>
<%@include file="/WEB-INF/views/fragment/footer.jsp"%>