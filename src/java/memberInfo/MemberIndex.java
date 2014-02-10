/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package memberInfo;

import DBCon.DbCon;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Matheus
 */
public class MemberIndex {
    
    private ArrayList<member> memberArrayList = new ArrayList<>();    
    private member Member;
    private DbCon dbCon = new DbCon();
    
    
    public MemberIndex() {
    }

    public MemberIndex(ResultSet rs) {
        
        try {
                while (rs.next()) {
                    this.Member = new member(
                          Integer.parseInt(rs.getString(1)),
                          rs.getString(2),
                          rs.getString(3), 
                          rs.getString(4),
                          rs.getString(5),
                          rs.getString(6),  
                          rs.getString(7),
                          rs.getString(8),
                          rs.getString(9),
                          rs.getString(10) );       
                    
                   if(!rs.getString(2).equals("coach")){                    
                   this.Member.setFees(dbCon.getMemberFees(rs.getString(1)));
                   this.Member.setStats(dbCon.getMemberStats(rs.getString(1)));
                   this.Member.setLet(dbCon.getMemberLet(rs.getString(1)));
                   }
                   
                   this.Member.setInbox(dbCon.getAllInboxMessages(rs.getString(1)));
                   this.Member.setSent(dbCon.getAllSentMessages(rs.getString(1)));
                   this.memberArrayList.add(this.Member);
                   
                }
            }
            catch (SQLException e) {
                
            }
        }

    public ArrayList<member> getMemberList() {
        return this.memberArrayList;
    }
    
}
