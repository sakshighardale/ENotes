<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.PostDAO1, com.user.post,java.util.List"%>
    
    <%
UserDetails user = (UserDetails) session.getAttribute("userD");

if (user == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login...");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<%
String updateMsg=(String)session.getAttribute("updateMsg");
if(updateMsg!=null)
{
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<% 

}
session.removeAttribute("updateMsg");
%>

<%
String noDelete=(String) session.getAttribute("NotdeleteMsg");
if(noDelete!=null)
{
	%>
		<div class="alert alert-danger" role="alert"><%=noDelete%></div>
	<%
}
session.removeAttribute("NotdeleteMsg");

%>

<div class="container">
<h2 class="text-center">All Notes:</h2>
<div class="row">
<div class="col-12">

<%
if(user!=null)
{
	PostDAO1 ob=new PostDAO1();
	List<post> pos=ob.getData(user.getId());
	for(post po:pos){
		%>
		<div class="card mt-3">
<img alt="" src="img/home_Enotes.png" class="card-img-top mt-2 mx-auto" style="max-width:100px">
<div class="card-body p-4">

<h5 class="card-title"><%=po.getTitle() %></h5>
<p><%=po.getContent() %></p>
<p>
<b>Published By:<%=user.getName() %></b><br>
<b class="text-primary"></b>
</p>
<b>Published Date:<%= po.getPdate() %></b><br>
<b class="text-primary"></b>

<div class="container text-center mt-2">
<a href="DeleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete</a>

<a href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>

</div>


</div>

</div>
		<%	
	}
}
%>

</div>
</div>
</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>