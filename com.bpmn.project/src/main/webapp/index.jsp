<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Start Modeler</title>
</head>


<% String path = request.getContextPath(); %>
<body>

<p> LG CNS Prcess Modeler index.jsp </p> 
    
    <div>
        <form action="/viewer.bgn" method="post">
            <button onclick="submit">Viewer!</button>
        </form>
    </div>
    
     <div>
        <form action="/modeler.bgn" method="post">
            <button onclick="submit">modeler!</button>
        </form>
    </div>
    
</body>
</html>