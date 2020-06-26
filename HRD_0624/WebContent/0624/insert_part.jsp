<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부품정보등록</title>
<link type="text/css" rel="stylesheet" href="style.css">


<script type="text/javascript">
function checkwrite(){
	if(document.cstinsertform.id.value==""){
		alert("부품코드를 입력하세요.");
		document.cstinsertform.id.focus();
	}
	else if(document.cstinsertform.name.value==""){
		alert("부품명을 입력하세요.");
		document.cstinsertform.name.focus();
	}
	else
		document.cstinsertform.submit();
}
</script>

</head>
<body>
<header>
<jsp:include page="header.jsp" />
<%@ include file="DBconn.jsp" %>
</header>

<%-- <%//시퀀스를 이용하여 아이디에 증가값 넣기위해 디비를 불러온다
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
}%> input value에 시퀀스 --%>

<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav><section>
<div class="section">

<form action="insert_part_process.jsp" name=cstinsertform>
<h2>부품 정보 등록 화면</h2><hr>

<table >
<tr>
<th width=20%>부품번호</th>
<td align="left" width=80% colspan=3><input type="text" name="partcode" size="80" value="">
<!-- <input type="button" value="중복체크" onclick="id_chk()"> --><!-- javascrip 함수 생성 -->
</td>
</tr>

<tr align=center>
<th>부품명 </th> 
<td align="left" colspan=3><input type="text" name="partname" size="80" value="" ></td>
</tr>

<tr align=center>
<th>모델명 </th>
<td align="left" colspan=3><input type="text" name="model" size="80" value=""></td>
</tr>

<tr align=center>
<th>규격</th>
<td align="left" colspan=3><input type="text" name="standard" size="80" value=""></td>
</tr>

<tr align=center>
<th>단위</th>
<td align="left" colspan=3><input type="text" name="unit" size="80" value=""></td>
</tr>

<tr align=center>
<th>매입가</th>
<td align="left">
<input type="text" name="purchase" size="30" value="">
</td>
<th width=20%>매출가</th>
<td align="left">
<input type="text" name="sale" size="30" value="">	
</td>
</tr>

<tr align=center>
<th>메모</th>
<td align="left" colspan=3>
	  <textarea cols=82 rows=8></textarea>

</tr>

<tr align=center>
<td colspan="4">
<input type="button" value="부품등록" onclick="javascript:checkwrite()">
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