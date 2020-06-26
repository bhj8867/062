<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객정보등록</title>
<link type="text/css" rel="stylesheet" href="style.css">

<script type="text/javascript">
function checkwrite(){
	if(document.cstinsertform.id.value==""){
		alert("아이디를 입력하세요.");
		document.cstinsertform.id.focus();
	}
	else if(document.cstinsertform.name.value==""){
		alert("이름을 입력하세요.");
		document.cstinsertform.name.focus();
	}
	else if(document.cstinsertform.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		document.cstinsertform.passwd.focus();
	}
	else if(document.cstinsertform.passwd1.value==""){
		alert("확인 비밀번호를 입력하세요.");
		document.cstinsertform.passwd1.focus();
	}else
		document.cstinsertform.submit();
}
</script>
</head>
<body>
<header>
<jsp:include page="header.jsp" />
<%@ include file="DBconn.jsp" %>
</header>

<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>

<section>
<div class="section">

<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
int seq=0;

try{
	String sql="select id_seq.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		seq=rs.getInt(1);
		
		}
	}
catch(SQLException e){
	out.println("테이블 호출 실패 "+e.getMessage());
	
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}%>


<form action="insert_custom_process.jsp" name=cstinsertform>
<h2>고객 정보 등록 화면</h2><hr>
<table>
<tr>
<th>아이디</th>
<td align="left"><input type="text" name="id" size="15" value="<%=seq%>">
<!-- <input type="button" value="중복체크" onclick="id_chk()"> --><!-- javascrip 함수 생성 -->
</td>
</tr>

<tr align=center>
<th>이름 </th> 
<td align="left"><input type="text" name="name" size="15" value="" ></td>
</tr>

<tr align=center>
<th>비밀번호 </th>
<td align="left"><input type="password" name="passwd" size="15" value=""></td>
</tr>

<tr align=center>
<th>비밀번호확인</th>
<td align="left"><input type="password" name="passwd1" size="15" value=""></td>
</tr>

<tr align=center>
<th>성별</th>
<td align="left">
<input type="radio" name="gender" value="f" checked>여
<input type="radio" name="gender" value="m">남</td>
</tr>

<tr align=center>
<th>이메일</th>
<td align="left">
<input type="text" name="id2" size="15" value="" >
@<select name="domain"> 
        <option value="korea.com" selected>korea.com</option>
        <option value="naver.com" >naver.com</option>
        <option value="daum.net" >daum.net</option>
        <option value="gmail.com">gmail.com</option>
        <option value="nate.com">nate.com</option></select></td>
</tr>

<tr align=center>
<th>핸드폰</th>
<td align="left">
		<select name="ph1" > 
        <option value="010">010</option> 
        <option value="011">011</option>
        <option value="016">016</option>
        <option value="019">019</option>
        </select>
        -<input type="tel" name="ph2" size="10" value="" >
        -<input type="tel" name="ph3" size="10" value="" >
</td>
</tr>

<tr align=center>
<th>전화번호</th>
<td align="left">
	  <input type="tel" name="tel1" size="10" value="" >
     -<input type="tel" name="tel2" size="10" value="" >
     -<input type="tel" name="tel3" size="10" value="" ></td>
</tr>

<tr align=center>
<th>주소</th>
<td align="left"><input type="text" name="address" size="100" value="" ></td>
</tr>

<tr align=center>
<th>차량번호</th>
<td align="left"><input type="text" name="carnumber" size="15" value="" ></td>
</tr>

<tr align=center>
<th>차량종류</th>
<td align="left"><input type="text" name="cartype" size="15" value="" ></td>
</tr>

<tr align=center>
<td colspan="2">
<input type="button" value="고객등록" onclick="javascript:checkwrite()">
<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>


</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>
