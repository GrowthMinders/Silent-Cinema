<%-- 
    Document   : CVUpload
    Created on : Dec 15, 2024, 12:51:28 PM
    Author     : Supun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Functionality.InterviewServlet.servecv"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="./CVServlet" method="post" enctype="multipart/form-data">
             <div class="mb-3">
                <label for="cv" class="form-label">Upload CV</label>
                <input type="file" class="form-control" id="file" name="file" required>
             </div>
                <input type="text" class="form-control" id="email" name="email" value = "<%= servecv.email %>" hidden>
                            
             <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit Application</button>
             </div>
        </form>
    </body>
</html>
