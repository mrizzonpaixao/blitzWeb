/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DBCon.DbCon;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import memberInfo.member;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        DbCon dbCon = new DbCon();
        
        String firstName = request.getParameter("firstName");
        String surname = request.getParameter("surname");
        String usermail = request.getParameter("mail");
        String contactNum = request.getParameter("contactNum");
        String password = request.getParameter("password");
        
        if(dbCon.checkEmail(usermail)){
         request.setAttribute("feedBack", "Sorry, email alredy registerd with an existing account"); 
        request.setAttribute("firstName", firstName);
        request.setAttribute("surname", surname);
        request.setAttribute("email", usermail);
        request.setAttribute("number", contactNum);
        request.getRequestDispatcher("register.jsp").forward(request, response);        
        }        
        
        //hashes password
            MessageDigest mdAlgorithm = null;
        try {
            mdAlgorithm = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(password);
            mdAlgorithm.update(baos.toByteArray());
            
            byte[] digest = mdAlgorithm.digest();
            StringBuilder hexString = new StringBuilder();

            for (int i = 0; i < digest.length; i++) {
                String x = Integer.toHexString(0xFF & digest[i]);
                if (x.length() < 2) {
                    x = "0" + x;
                }
                hexString.append(x);
            }
        
        if(dbCon.addMember(firstName, surname, usermail, contactNum,
                hexString.toString())){
         HttpSession session = request.getSession();
         session.setAttribute("firstTime", "true");
        response.sendRedirect(response.encodeRedirectURL("home.jsp"));
               
        }else{
        request.setAttribute("feedBack", "Unable to complete registration, please try again"); 
        request.setAttribute("firstName", firstName);
        request.setAttribute("surname", surname);
        request.setAttribute("email", usermail);
        request.setAttribute("number", contactNum);
        request.setAttribute("fail", "fail");
        request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        
        
    
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
