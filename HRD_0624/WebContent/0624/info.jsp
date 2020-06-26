<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회사 소개</title>
<link type="text/css" rel="stylesheet" href="style.css">
<style type="text/css">
/* h2{
color : blue;
} */
</style>


</head>
<body>
<header>
<jsp:include page="header.jsp" />
</header>

<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>

<section>
<div class="section">

<h3>반갑습니다.<br>카센터 붕붕이나라입니다.</h3><hr>
<img src=puppy.png align=left width= height= >
<p>안녕하십니까?<br>
카센터 붕붕이나라는 부산시 부산진구 양정동에 위치하고 있습니다.<br>
저희 붕붕이나라는 고개의 다양한 요구에 부합하는 최고의 서비스와 경댕력 있는 가격으로 고개 만족을  실현하기 위해 모든 임직원이 다함께 도력할 것을 약속드립니다.<br>
항상 한발 앞서가는 고객만족의 경영을 실천하며, 고객과의 약속을 가장 중요시 하겠습니다. 
<br>고객 여러분의 끊임없는 격려와 관심으로 성원해 주시길 부탁드립니다.</p><br>
<h2 style="color:blue">감사합니다.</h2>

</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>

