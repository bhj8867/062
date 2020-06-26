<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부품정보조회</title>
<link type="text/css" rel="stylesheet" href="style.css">

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
<%@ include file="DBconn.jsp" %>
<%request.setCharacterEncoding("utf-8");%>

<form name="cstselectform" method="post">
<h2>부품 정보 조회</h2>
<table>
<tr>
<th>no</th>
<th>부품번호</th>
<th>부품명</th>
<th>모델명</th>
<th>규격</th>
<th>단위</th>
<th>매입가격</th>
<th>매출가격</th>
<th>메모</th>
</tr>

<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;//인덱스no

try{
	String sql="select partcode, partname, model, standard, unit, purchase, sale, memo from parttbl";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		
		/*int idx=rs.getInt("id"); */
		//System.out.println(sql);
		cnt++;
		String partcode=rs.getString(1);
		String partname=rs.getString(2);//DB에있는 데이터 불러옴
		String model=rs.getString(3);
		String standard=rs.getString(4);
		String unit=rs.getString(5);
		String purchase=rs.getString(6);
		String sale=rs.getString(7);
		String memo=rs.getString(8);
		
%>
<tr >
<td align=center><%=cnt %></td>
<td align=center><%=partcode %></td>
<td align=center><%=partname %></td>
<td align=center><%=model %></td>
<td align=center><%=standard %></td>
<td align=center><%=unit %></td>
<td align=center><%=purchase %></td>
<td align=center><%=sale %></td>
<td align=center><%=memo %></td>
</tr>
<%			
	}
}catch(SQLException e){
	System.out.println("테이블 조회 실패ㅠㅠ "+e.getMessage());
	
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}

%>
</table>
</form>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>