/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import CMS.NoticeBoard;
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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Matheus
 */
@WebServlet(name = "noticeBoardPost", urlPatterns = {"/noticeBoardPost"})
public class noticeBoardPost extends HttpServlet {
    private NoticeBoard posts;
    private ArrayList<Post> postList;
    private Post post;

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
            DbCon dbCon = new DbCon();
            String userId = session.getAttribute("memberId").toString();
            String data =  request.getParameter("data");
            String requestType = request.getMethod();
            
              
                       
            
            
            if(requestType.equals("GET")){                 
            
               
                
            posts = dbCon.getallPosts();            
            postList = posts.getnoticeBoardList();
            JSONArray ja = new JSONArray();
            JSONObject mainObj = new JSONObject();
            
             for (Post p : postList) {
                 
             JSONObject jo = new JSONObject();
                
               jo.put("postId", p.getBoard_id());
               jo.put("firstName", p.getFirstName());
               jo.put("surname", p.getSurname());
               jo.put("PostContent", p.getContent());
               jo.put("PostDate", p.getDateStamp()); 
               jo.put("imgSrc", p.getImgSrc()); 
               jo.put("memberId", p.getMemberId());
               
            ja.add(jo);            
                               
            
            }
             
            mainObj.put("posts", ja);
            mainObj.put("count", postList.size());
            mainObj.put("memberId", userId);
            response.setContentType("application/json");
            response.getWriter().print(mainObj);
            response.getWriter().flush();
                   
                    
            
            }else{
                
            String postId = dbCon.addPost(data, userId); 
            post = dbCon.getPostsAtId(postId);
            
            JSONObject jOb = new JSONObject();
                
               jOb.put("postId",postId );
               jOb.put("firstName", post.getFirstName());
               jOb.put("surname", post.getSurname());
               jOb.put("PostContent", post.getContent());
               jOb.put("PostDate", post.getDateStamp()); 
               jOb.put("imgSrc", post.getImgSrc()); 
               jOb.put("memberId",userId ); 
               jOb.put("postMemberId", post.getMemberId());
               
                response.setContentType("application/json");
            response.getWriter().print(jOb);
            response.getWriter().flush();
            
          
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
            Logger.getLogger(noticeBoardPost.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(noticeBoardPost.class.getName()).log(Level.SEVERE, null, ex);
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
