<%-- 
    Document   : registration
    Created on : Nov 22, 2024, 4:21:35 PM
    Author     : Dhanuja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Functionality.RegisterServlet.GlobalVariables"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link rel="stylesheet" href="./CSS/Registration.css">
    <script src="./JS/password.js"></script>
     <script src="./JS/regvalidation.js"></script>
    <script src="./JS/existregvalidation.js"></script>
</head>
<body onload="exist()">
     <script>
            //Email
            <% if(GlobalVariables.emaildb != null ){ %> 
                  var emailres;
                  emailres = '<%= GlobalVariables.emaildb %>';
            <% } %>  
            //Telephone
            <% if(GlobalVariables.teldb != null){ %>
                  var telres;
                  telres = '<%= GlobalVariables.teldb %>';
            <% } %> 
            //NIC     
            <% if(GlobalVariables.nicdb != null){ %>
                  var nicres;
                  nicres = '<%= GlobalVariables.nicdb %>';
            <% } %>      
        </script>
        <div>
            <span id="errors" style="display: none;">
            </span>
       </div>
    <div class="container">
        <div class="logo">
            <a href="./index.html"><img src="./Images/Logo.png" alt="Logo"></a>
        </div>
        <h1>CREATE ACCOUNT</h1>
             <form action = "RegisterServlet" method="post" name="reg" onsubmit="return validate()">
            <input type="text" name = "fname" id = "fname" placeholder="FIRST NAME" <% if (GlobalVariables.data[0] != null) { %> value="<%= GlobalVariables.data[0] %>" <% } %>>
            <input type="text" name = "lname" id = "lname" placeholder="LAST NAME" <% if (GlobalVariables.data[1] != null) { %> value="<%= GlobalVariables.data[1] %>" <% } %>>
            <input type="email" name = "email" id = "email" placeholder="EMAIL" <% if (GlobalVariables.data[2] != null) { %> value="<%= GlobalVariables.data[2] %>" <% } %>>
            <input type="text" name = "tel" id = "tel" placeholder="TELEPHONE NUMBER" <% if (GlobalVariables.data[3] != null) { %> value="<%= GlobalVariables.data[3] %>" <% } %>>
            <input type="password" name = "pass" id = "pass" placeholder="PASSWORD" <% if (GlobalVariables.data[4] != null) { %> value="<%= GlobalVariables.data[4] %>" <% } %>>
           <dl>
               <dd>*Length 8-24</dd>
               <dd>*Uppercase needed(A-Z)</dd>
               <dd>*Lowercase needed(a-z)</dd>
               <dd>*Digits needed(0-9)</dd>
               <dd>*Special Character(@,#,$,%,^,&,ect)</dd>
           </dl>
            <input type="password" name = "cpass" id = "cpass" placeholder="CONFIRM PASSWORD" <% if (GlobalVariables.data[5] != null) { %> value="<%= GlobalVariables.data[5] %>" <% } %>>
            <select name = "gen" id = "gen">
                <option value="" selected hidden>GENDER</option>
                <option value="Male" <%= (GlobalVariables.data[6] != null && "Male".equals(GlobalVariables.data[6])) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= (GlobalVariables.data[6] != null && "Female".equals(GlobalVariables.data[6])) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= (GlobalVariables.data[6] != null && "Other".equals(GlobalVariables.data[6])) ? "selected" : "" %>>Other</option>
            </select>
            <input type="text" name = "nic" id = "nic" placeholder="NIC" <% if (GlobalVariables.data[7] != null) { %> value="<%= GlobalVariables.data[7] %>" <% } %>>
            
            <label onclick="shpass()">Show password</label>    
            <button type="submit">REGISTER</button>
        </form>
    </div>
</body>
</html>

