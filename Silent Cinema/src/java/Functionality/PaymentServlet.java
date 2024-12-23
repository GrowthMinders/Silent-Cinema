package Functionality;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {
    public class emailgrab {
        public static String selemail = "";
        public static String seldate;
        public static String seltime;
        public static String selmovie;
        public static String selseats;
        public static int selseatsno = 0;
        public static int seatprice = 0; 
    }
    
    private static final String CLIENT_ID = "AY4arn0ueXTF5Daoe9KG2upOh6ziRLLzFQUUl2Q3Ha76Km9se96rPGbH-DdeGSdhFnlMfdcjFFuIlwkk"; 
    private static final String CLIENT_SECRET = "ECQwlaV7quHuUrepzunO06a4TD84VbiU-ckHIhYkezYxqSPGEijv71uhQXlNTx-a2-ecOuKOM_W4jHGk"; 
    private static final String MODE = "sandbox"; // Using PayPal sandbox for testing
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             emailgrab.seldate = request.getParameter("seldate");
             emailgrab.seltime = request.getParameter("seltime");
             emailgrab.selmovie = request.getParameter("selmovie");
             emailgrab.selseats = request.getParameter("selseats");
             emailgrab.selseatsno = Integer.parseInt(request.getParameter("seatno"));                ;
             emailgrab.seatprice = Integer.parseInt(request.getParameter("seatprice"));
             emailgrab.selemail = request.getParameter("email");
        // Simplified payment processing (no confirmation, return URL, etc.)
        try {
            // Prepare payment details
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(emailgrab.selmovie, emailgrab.seatprice, emailgrab.selseatsno);

            // Redirect to PayPal for approval
            response.sendRedirect(approvalLink);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            response.getWriter().println("Error during payment authorization: " + e.getMessage());
        }
    }

    public class PaymentServices {
        
        public String authorizePayment(String movieName, int seatprice, int selseatsno) throws PayPalRESTException {
            Payer payer = getPayerInformation();  // Simplified payer info for testing
            List<Transaction> listTransaction = getTransactionInformation(movieName, seatprice, selseatsno);

            // Create payment request
            Payment requestPayment = new Payment();
            requestPayment.setTransactions(listTransaction)
                          .setIntent("sale")
                          .setPayer(payer);

            // Set redirect URLs
            RedirectUrls redirectUrls = new RedirectUrls();
            redirectUrls.setReturnUrl("http://localhost:8080/Silent_Cinema/ConfirmPayMail")
                        .setCancelUrl("http://localhost:8080/Silent_Cinema/incorrect.jsp");
            requestPayment.setRedirectUrls(redirectUrls);

            APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
            Payment approvedPayment = requestPayment.create(apiContext);

            // Extract the approval link for the user to approve the payment
            return getApprovalLink(approvedPayment);  
        }

        private String getApprovalLink(Payment approvedPayment) {
            for (Links link : approvedPayment.getLinks()) {
                if (link.getRel().equalsIgnoreCase("approval_url")) {
                    return link.getHref();
                }
            }
            return null;
        }

        private List<Transaction> getTransactionInformation(String movieName, int seatprice, int selseatsno) {
            Amount amount = new Amount();
            amount.setCurrency("USD");
            amount.setTotal(String.format("%d", seatprice * selseatsno));  // Total amount for the movie seat(s)

            // Create transaction
            Transaction transaction = new Transaction();
            transaction.setAmount(amount);
            transaction.setDescription("Payment for " + movieName);

            // Add transaction to the list
            List<Transaction> listTransaction = new ArrayList<>();
            listTransaction.add(transaction);
            return listTransaction;
        }

        private Payer getPayerInformation() {
            Payer payer = new Payer();
            payer.setPaymentMethod("paypal");

            PayerInfo payerInfo = new PayerInfo();
            payerInfo.setFirstName("John")
                     .setLastName("Doe")
                     .setEmail("john.doe@example.com");  // Sample email, for testing purposes
            
            return payer.setPayerInfo(payerInfo);
        }
    }
}

