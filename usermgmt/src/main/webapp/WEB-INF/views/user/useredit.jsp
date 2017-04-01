<%@include file="/WEB-INF/views/fragment/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container custom-container">
	<form:form method="post" modelAttribute="userEdit"
		class="form-horizontal"
		action="${pageContext.request.contextPath}/update">
		<div class="form-group">
			<form:label path="fname" class="col-sm-2 control-label">First Name</form:label>
			<div class="col-sm-5">
				<form:input path="fname" name="fname" class="form-control"
					placeholder="Enter First Name" value="${userEdit.fname}"></form:input>
			</div>
		</div>
		<div class="form-group">
			<form:label path="lname" class="col-sm-2 control-label">Last
				Name</form:label>
			<div class="col-sm-5">
				<form:input path="lname" name="lname" type="text"
					class="form-control" placeholder="Enter Last Name"
					value="${userEdit.lname}"></form:input>
			</div>
		</div>
		<div class="form-group">
			<form:label path="address" class="col-sm-2 control-label">Address</form:label>
			<div class="col-sm-5">
				<form:input path="address" name="address" type="text"
					class="form-control" placeholder="Enter Address"
					value="${userEdit.address}"></form:input>
			</div>
		</div>
		<div class="form-group">
			<form:label path="contact" class="col-sm-2 control-label">Contact No</form:label>
			<div class="col-sm-5">
				<form:input path="contact" name="contact" type="text"
					class="form-control" placeholder="Enter Contact No"
					value="${userEdit.contact}"></form:input>
			</div>
		</div>
		<form:hidden path="userId" />
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<form:button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
				Update</form:button>
			</div>
		</div>

	</form:form>
</div>
<%@include file="/WEB-INF/views/fragment/footer.jsp"%>