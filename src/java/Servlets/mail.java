/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import CMS.Post;
import DBCon.DbCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import memberInfo.MemberIndex;
import memberInfo.member;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "mail", urlPatterns = {"/mail"})
public class mail extends HttpServlet {
    private ArrayList<member> list;

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
          HttpSession session = request.getSession();
          MemberIndex members;
          
            DbCon dbCon = new DbCon();
            String opId = request.getParameter("opId");
            String val =  request.getParameter("val");
            String requestType = request.getMethod();
                   
                       
            
            
            if(requestType.equals("GET")){                 
             
             members = dbCon.getMemberAtVal(val);
             list = members.getAllMembers();
            JSONArray ja = new JSONArray();
            JSONObject mainObj = new JSONObject();
            
             for (member m : list) {
                 
             JSONObject jo = new JSONObject();
                
               jo.put("memberId", m.getMember_id());
               jo.put("firstName", m.getFirstName());
               jo.put("surname", m.getSurname());
               jo.put("email", m.getEmail());
               jo.put("imgSrc", m.getImgSrc());             
            ja.add(jo); 
                               
            
            }
             
            mainObj.put("members", ja);
            mainObj.put("count", list.size());                        
            response.setContentType("application/json");
            response.getWriter().print(mainObj);
            response.getWriter().flush();
                   
                    
            
            }else{
                
            
            
          
            }
            
        } finally {            
            out.close();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(mail.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(mail.class.getName()).log(Level.SEVERE, null, ex);
        }
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
