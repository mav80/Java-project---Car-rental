<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<footer>
<a href="<%out.print(request.getContextPath());%>/">powrót do strony głównej</a>
<button onclick="topFunction()" id="myBtn" title="Powrót na górę strony">Do góry</button>

<div class="row">
		<p class="col-sm-4">&copy; 2018 Mav</p>
		<ul class="col-sm-8">
	<!-- 		<li class="col-sm-1">...</li>  -->
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/twitter.svg"></li>
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/facebook.svg"></li>
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/instagram.svg"></li>
			<li class="col-sm-1"><img
				src="https://s3.amazonaws.com/codecademy-content/projects/make-a-website/lesson-4/medium.svg"></li>
		</ul>
	</div>
	
</footer>
</body>
</html>