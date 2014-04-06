/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Matheus
 */
public class NoticeBoard {
    
     private ArrayList<Post> noticeBoardArrayList = new ArrayList<>();    
    private Post noticeBoard;

    public NoticeBoard() {
    }

    public NoticeBoard(ResultSet rs) {
        
        try {
                while (rs.next()) {
                    this.noticeBoard = new Post(
                          Integer.parseInt(rs.getString(1)),
                          rs.getString(2),
                          rs.getString(3),
                          rs.getString(4), 
                          rs.getString(5),
                          rs.getString(6),
                          rs.getString(7)  
                            );
                   this.noticeBoardArrayList.add(this.noticeBoard);
                   
                }
            }
            catch (SQLException e) {
                
            }
        }

    public ArrayList<Post> getnoticeBoardList() {
        return this.noticeBoardArrayList;
    }
    
    
}
