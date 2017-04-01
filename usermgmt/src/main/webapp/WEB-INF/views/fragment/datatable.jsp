
<script type="text/javascript"
	src="<c:url value = "/resources/datatables/jquery.dataTables.min.js"/>"></script>
<link
	href="<c:url value = "/resources/datatables/dataTables.bootstrap4.min.css"/>"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value = "/resources/datatables/dataTables.bootstrap4.min.js"/>"></script>

<script type="text/javascript">
	$('#tblData').DataTable({
		"bPaginate" : false,
		"searching" : true,
		"bLengthChange" : false,
		"responsive" : true,
		"bInfo" : false
	})
</script>