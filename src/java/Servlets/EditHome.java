/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import CMS.NewsArticle;
import DBCon.DbCon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Decoder;
import org.json.simple.JSONObject;



/**
 *
 * @author Matheus
 */
@WebServlet(name = "EditHome", urlPatterns = {"/EditHome"})
public class EditHome extends HttpServlet {
    private NewsArticle newsArticle;

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
        try (PrintWriter out = response.getWriter()) {
             HttpSession session = request.getSession();
             DbCon dbCon = new DbCon();
             String opId =  request.getParameter("opId");      
             String date =  request.getParameter("date");             
             String imgData = request.getParameter("imgData");
             String userId = session.getAttribute("memberId").toString();
             String slideId = request.getParameter("slideId");
             String imgType = request.getParameter("imgType");
             String fixtureId = request.getParameter("fixId");
             String fixtureDate = request.getParameter("fixDate");
             String homeScore = request.getParameter("homescore");
             String opScore = request.getParameter("opScore");
             String team = request.getParameter("team"); 
             String title = request.getParameter("newsTitle"); 
             String content =  request.getParameter("newsContent"); 
             
             String NewSlideId;
             
             String fileName = "slide"+date+"."+imgType;
             String finalFileName = fileName.replace(" ", "");
             
            switch (opId) {         
                
                case "1":
                    NewSlideId = dbCon.addSlide(userId, finalFileName);
                    
                     response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
                     response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
                     response.getWriter().write(NewSlideId);
                    
                    byte[] imageByteArray;
                    BASE64Decoder decoder = new BASE64Decoder();
                    String imgBase = imgData.replace("data:image/"+imgType+";base64,", "");
                    
                    imageByteArray = decoder.decodeBuffer(imgBase);
                    //String relativeWebPath = "img";
                    String absoluteFilePath = "C:/Users/Matheus/Documents/NetBeansProjects/blitzWeb/web/img/";//getServletContext().getRealPath(relativeWebPath);
                    try (FileOutputStream imageOutFile = new FileOutputStream(
                                 absoluteFilePath +  finalFileName)) {
                        imageOutFile.write(imageByteArray);
                        imageOutFile.close();
                   
                    }
                    break;
                case "2":
                    dbCon.removeSlide(slideId, userId );
                    break;
               case "3":
                    dbCon.updateFixture(fixtureDate, team, homeScore, opScore, userId, fixtureId);
                    break; 
               case "4":
                  
                   newsArticle = dbCon.addNewsArticle(userId, content, title);
                                     
                   JSONObject json = new JSONObject();
                   json.put("name", newsArticle.getMemberName());
                   json.put("date", newsArticle.getDateStamp());
                   json.put("id", newsArticle.getNewsID());
                   
                    response.setContentType("application/json");
                    response.getWriter().print(json);
                    response.getWriter().flush();
                    break;                    
                   
            }
           
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
            Logger.getLogger(EditHome.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EditHome.class.getName()).log(Level.SEVERE, null, ex);
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
