<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%! 
public class Footer {
    public void renFoot(jakarta.servlet.jsp.JspWriter out) throws java.io.IOException {
        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"en\">");
        out.println("<head>");
        out.println("    <meta charset=\"UTF-8\">");
        out.println("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        out.println("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\">");
        out.println("    <link rel=\"stylesheet\" href=\"./CSS/footer.css\">");
        out.println("</head>");
        out.println("<body>");
        out.println("    <footer class=\"footer\">");
        out.println("        <div class=\"container-fluid\">");
        out.println("            <div class=\"row\">");
        out.println("                <div class=\"col-md-8 d-flex flex-column align-items-start\">");
        out.println("                    <div class=\"d-flex align-items-start mb-4\">");
        out.println("                        <img src=\"./Images/Logo.png\" alt=\"Silent Cinemas Logo\" class=\"footer-logo\">");
        out.println("                        <div class=\"cinema-info ms-3\">");
        out.println("                            <p class=\"cinema-name\">SILENT CINEMAS THEATER</p>");
        out.println("                            <p>PITIPANA NORTH, HOMAGAMA.</p>");
        out.println("                        </div>");
        out.println("                    </div>");
        out.println("                    <div class=\"row w-100\">");
        out.println("                        <div class=\"col-md-6 nav-links\">");
        out.println("                            <a href=\"./index.jsp\">HOME</a>");
        out.println("                            <a href=\"./Movies.jsp\">MOVIES</a>");
        out.println("                            <a href=\"./Offers.jsp\">DEALS AND EXCLUSIVES</a>");
        out.println("                            <a href=\"./Buytickets.jsp\">BUY TICKETS</a>");
        out.println("                            <a href=\"./AboutUs.jsp\">ABOUT US</a>");
        out.println("                            <p class=\"footer-email mt-3\">silentcinemas2024@gmail.com</p>");
        out.println("                        </div>");
        out.println("                        <div class=\"col-md-6 nav-links\">");
        out.println("                            <a href=\"#\">CAREERS</a>");
        out.println("                            <a href=\"./Disclaimer.jsp\">DISCLAIMER</a>");
        out.println("                            <a href=\"./Events.jsp\">EVENTS</a>");
        out.println("                            <a href=\"./TC.jsp\">TERMS AND CONDITIONS</a>");
        out.println("                            <a href=\"./ContactUS.jsp\">CONTACT US</a>");
        out.println("                            <div class=\"social-icons mt-3 d-flex align-items-center\">");
        out.println("                                <a href=\"#\" class=\"me-3\"><img src=\"./Images/Footer/facebook.svg\" alt=\"Facebook\"></a>");
        out.println("                                <a href=\"#\" class=\"me-3\"><img src=\"./Images/Footer/instagram.svg\" alt=\"Instagram\"></a>");
        out.println("                                <a href=\"#\"><img src=\"./Images/Footer/whatsapp.svg\" alt=\"Phone\"></a>");
        out.println("                            </div>");
        out.println("                        </div>");
        out.println("                    </div>");
        out.println("                </div>");
        out.println("                <div class=\"col-md-4 text-center find-us-section mt-3\">");
        out.println("                    <p>Find us on app store and google play</p>");
        out.println("                    <div class=\"app-buttons d-flex flex-column align-items-center\">");
        out.println("                        <div class=\"app-button mb-2\"></div>");
        out.println("                        <div class=\"app-button\"></div>");
        out.println("                    </div>");
        out.println("                </div>");
        out.println("            </div>");
        out.println("        </div>");
        out.println("    </footer>");
        out.println("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\"></script>");
        out.println("</body>");
        out.println("</html>");
    }
}
%>
<%
    Footer footer = new Footer();
    footer.renFoot(out);
%>
 