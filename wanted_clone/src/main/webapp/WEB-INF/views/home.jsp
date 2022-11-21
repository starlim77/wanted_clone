<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  db test. </P>

<input type="text" id="name" name="name">
<input type="button" id="test" value="test"></input>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$("#test").click(function(){
	$.ajax({
		method : "get",
		url : "/controller/views/test",
		data: "name="+ $("#name").val(),
		success : function(){
			alert("haha");
		},error: function(err){
			console.log(err);
		}
		
	});
});

</script>
</body>
</html>
