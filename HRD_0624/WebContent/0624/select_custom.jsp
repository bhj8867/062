<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객정보조회</title>
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
<h2>고객 정보 조회</h2>
<table>
<tr>
<th>id</th>
<th>성명</th>
<th>패스워드</th>
<th>성별</th>
<th>이메일</th>
<th>휴대폰</th>
<th>전화번호</th>
<th>주 소</th>
<th>차량번호</th>
<th>자량종류</th>
</tr>

<%
ResultSet rs=null;
PreparedStatement pstmt=null;
//int cnt=0;//인덱스no

try{
	String sql="select id,name,passwd,gender,email,phone,tel,address, carnumber,cartype from custom_member order by id";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		/* cnt++;
		int idx=rs.getInt("id"); */
		System.out.println(sql);
		
		int id=rs.getInt("id");
		String name=rs.getString("name");//DB에있는 데이터 불러옴
		String passwd=rs.getString("passwd");
		
		String gender=rs.getString("gender");
		if(gender.equals("f")){
			gender="여";
		}else{
			gender="남";
		}
		
		String email=rs.getString("email");
		String phone=rs.getString("phone");
		String tel=rs.getString("tel");
		String address=rs.getString("address");
		String carnumber=rs.getString("carnumber");
		String cartype=rs.getString("cartype");
		
%>
<tr >
<td align=center><%=id %></td>
<td align=center><%=name %></td>
<td align=center><%=passwd%></td>
<td align=center><%=gender %></td>
<td align=center><%=email %></td>
<td align=center><%=phone %></td>
<td align=center><%=tel %></td>
<td align=center><%=address %></td>
<td align=center><%=carnumber %></td>
<td align=center><%=cartype %></td>
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