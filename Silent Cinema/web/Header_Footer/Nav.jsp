<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    public class Navigation {
        public void renderNavigation(jakarta.servlet.jsp.JspWriter out, jakarta.servlet.http.HttpServletRequest request) throws java.io.IOException {
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("    <meta charset=\"UTF-8\">");
            out.println("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("    <title>Silent Cinemas</title>");
            out.println("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">");
            out.println("    <link rel=\"stylesheet\" href=\"" + request.getContextPath() + "/CSS/Nav.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("    <header>");
            out.println("        <nav class=\"navbar navbar-expand-lg navbar-dark\" style=\"background-color: #002c44;\">");
            out.println("            <div class=\"container-fluid\">");
            out.println("<img id=\"logo\" src=\"" + request.getContextPath() + "/Images/Logo.png\" alt=\"Silent Cinemas Logo\" style=\"width: 50px; height: auto;\" onclick=\"window.location.href='" + request.getContextPath() + "/index.jsp'\">");
            out.println("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">");
            out.println("                    <span class=\"navbar-toggler-icon\"></span>");
            out.println("                </button>");
            out.println("                <div class=\"collapse navbar-collapse\" id=\"navbarNav\">");
            out.println("                    <ul class=\"navbar-nav ms-auto\">");
            out.println("                        <li class=\"nav-item\"><a class=\"nav-link text-white\" href=\"" + request.getContextPath() + "/index.jsp\">HOME</a></li>");
            out.println("                        <li class=\"nav-item\"><a class=\"nav-link text-white\" href=\"" + request.getContextPath() + "/Movies.jsp\">MOVIES</a></li>");
            out.println("                        <li class=\"nav-item\"><a class=\"nav-link text-white\" href=\"" + request.getContextPath() + "/Offers.jsp\">DEALS AND EXCLUSIVES</a></li>");
            out.println("                        <li class=\"nav-item highlight\"><a class=\"nav-link text-white\" href=\"" + request.getContextPath() + "/Buytickets.jsp\">BUY TICKETS</a></li>");
            //Checkin whether user is logged in
            HttpSession name = request.getSession(false);
            if (name != null && name.getAttribute("uname") != null){
               out.println("                        <li class=\"nav-item\"><a class=\"nav-link text-white\" href=\"./MyProfile.jsp\">MY PROFILE</a></li>");
            }else{
               out.println("                        <li class=\"nav-item\"><a class=\"nav-link text-white\" href=\"" + request.getContextPath() + "/Logemail.jsp\">LOGIN</a></li>");
            }

            out.println("                    </ul>");
            out.println("                </div>");
            out.println("            </div>");
            out.println("        </nav>");
            out.println("    </header>");
            out.println("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js\"></script>");
            out.println("</body>");
            out.println("</html>");
        }
    }
%>

<%
    Navigation navigation = new Navigation();
    navigation.renderNavigation(out, request);
%>
