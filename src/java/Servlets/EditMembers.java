/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DBCon.DbCon;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Decoder;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "EditMembers", urlPatterns = {"/EditMembers"})
public class EditMembers extends HttpServlet {

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
         
             DbCon dbCon = new DbCon();        
             String opId =  request.getParameter("opId");      
             String date =  request.getParameter("date");             
             String imgData = request.getParameter("imgData");
             String userId =  request.getParameter("memberId");
             String imgType = request.getParameter("imgType");
             
             String pos = request.getParameter("pos");
             String role= request.getParameter("role");
             String firstName= request.getParameter("firstName");
             String surname= request.getParameter("Surname");
             String email= request.getParameter("email");
             String contact= request.getParameter("contact");
             
         
             String statId = request.getParameter("statId");
             String RushYds = request.getParameter("RushYds");
             String PasYds = request.getParameter("PasYds");
             String RecYds = request.getParameter("RecYds");
             String Tds = request.getParameter("Tds");
             String Sck = request.getParameter("Sck");
             String Tckl = request.getParameter("Tckl");
             
             String desc = request.getParameter("desc");
             
              String row =  request.getParameter("row"); 
              String val = request.getParameter("val");
              
              String fileName = userId+date+"."+imgType;
             String finalFileName = fileName.replace(" ", "");
             
      switch (opId) {         
                
                case "1":
                                 
                  if(dbCon.updateMemberImg(finalFileName, userId)){
                    
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
                        
                     response.setContentType("text/plain"); 
                     response.setCharacterEncoding("UTF-8"); 
                     response.getWriter().write("The image was uploaded sucssesfuly");
                   
                    }
                  }else{
                  
                       response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8"); 
                     response.getWriter().write("We are sorry there was a problem Image not uploaded");
                  
                  }
                    break;
                  case "2":
                      
                      if(dbCon.editMemberDetail(userId, pos, role, firstName, surname, email, contact)){
                          
                      response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8"); 
                     response.getWriter().write("Content Updated ");
                      }else{
                       response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8");
                     response.getWriter().write("we are sorry content not updated");
                      }
                      
                       break;
                  case "3":
                       if(dbCon.editStats(statId,RushYds,PasYds,RecYds,Tds,Sck,Tckl)){
                       
                     response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8"); 
                     response.getWriter().write("Content Updated");
                       }else{
                       response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8");
                     response.getWriter().write("we are sorry content not updated");
                      }
                      break;
                      case "4":
                          if(dbCon.editmemberDesc(userId,desc)){
                          response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8"); 
                     response.getWriter().write("Content Updated");
                          
                          }
                          else{
                       response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8");
                     response.getWriter().write("we are sorry content not updated");
                      }
                          break;
                          case "5":
                              if(dbCon.editFee(userId,row,val)){
                                  
                                 response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8"); 
                     response.getWriter().write("Content Updated");
                            
                              }
                              else{
                               response.setContentType("text/plain");  
                     response.setCharacterEncoding("UTF-8");
                     response.getWriter().write("we are sorry content not updated");
                              
                              }
                              break;
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
            Logger.getLogger(EditMembers.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EditMembers.class.getName()).log(Level.SEVERE, null, ex);
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
