package Functionality;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name = "CVServlet", urlPatterns = {"/CVServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class CVServlet extends HttpServlet {

    private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "uploads"; // Dynamic upload directory

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();  // Create directory if doesn't exist
        }

        String uploadedFileName = null;
        try {
            for (Part part : req.getParts()) {
                String fileName = extractFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    uploadedFileName = sanitizeFileName(fileName);
                    String filePath = UPLOAD_DIR + File.separator + uploadedFileName;
                    part.write(filePath); // Save file to disk
                }
            }
        } catch (Exception e) {
            log("File upload failed: " + e.getMessage(), e);
            res.getWriter().println("File upload failed due to server error.");
            return;
        }

        String email = req.getParameter("email");
        if (email == null || email.isEmpty()) {
            res.getWriter().println("Email is required.");
            return;
        }

        try {
            updateDatabaseWithFileName(uploadedFileName, email);
            res.sendRedirect("./index.jsp?status=success");
        } catch (SQLException ex) {
            log("Database error: " + ex.getMessage(), ex);
            res.getWriter().println("Database error. Please try again later.");
        }
    }

    private void updateDatabaseWithFileName(String uploadedFileName, String email) throws SQLException {
        String url = "jdbc:sqlserver://192.168.121.250\\DATABASESERVER:1433;databaseName=Silent;encrypt=true;trustServerCertificate=true";
        String username = "Supun"; // Consider using environment variables
        String password = "Rulz@2002"; // Consider using environment variables

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement("UPDATE vacancy SET flname = ? WHERE email = ?")) {
            stmt.setString(1, uploadedFileName);
            stmt.setString(2, email);
            stmt.executeUpdate();
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    private String sanitizeFileName(String fileName) {
        return fileName.replaceAll("[^a-zA-Z0-9._-]", "_");
    }
}