<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부품 정보 등록 process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

try{
	String sql="insert into parttbl values(?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("partcode"));
	pstmt.setString(2, request.getParameter("partname"));
	pstmt.setString(3, request.getParameter("model"));
	pstmt.setString(4, request.getParameter("standard"));
	pstmt.setString(5, request.getParameter("unit"));
	pstmt.setString(6, request.getParameter("purchase"));
	pstmt.setString(7, request.getParameter("sale"));//""안에는 input name이 들어온다.
	pstmt.setString(8, request.getParameter("memo"));
	
	pstmt.executeUpdate();
	
	System.out.println("테이블 삽입 성공 ");
	%>
	<script type="text/javascript">
	alert("입력되었습니다.");
	location.href="select_part.jsp";
	</script>
	<%
	
}catch(SQLException e){
	out.print("데이터 삽입 실패 "+e.getMessage());
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}
%>

</body>
</html>