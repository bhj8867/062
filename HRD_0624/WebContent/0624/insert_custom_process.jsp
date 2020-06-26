<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객정보 등록 process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

try{
	String sql="insert into custom_member values(?,?,?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("passwd"));
	pstmt.setString(4, request.getParameter("gender"));
	pstmt.setString(5, request.getParameter("id2")+"@"+request.getParameter("domain"));
	
	pstmt.setString(6,request.getParameter("ph1")+"-"+request.getParameter("ph2")+"-"+request.getParameter("ph3"));
	pstmt.setString(7,request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));	
	
	pstmt.setString(8, request.getParameter("address"));//""안에는 input name이 들어온다.
	pstmt.setString(9, request.getParameter("carnumber"));
	pstmt.setString(10, request.getParameter("cartype"));
	
	
	pstmt.executeUpdate();
	
	System.out.println("테이블 삽입 성공 ");
	%>
	<script type="text/javascript">
	alert("입력되었습니다.");
	location.href="select_custom.jsp";
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