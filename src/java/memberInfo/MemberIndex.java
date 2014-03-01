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
    
    private ArrayList<member> PlayerList = new ArrayList<>();
    private ArrayList<member> RecruitList = new ArrayList<>();
    private ArrayList<member> CoachList = new ArrayList<>();
    private ArrayList<member> CommitteeList = new ArrayList<>();
    private member member;
    private DbCon dbCon = new DbCon();
    
    
    public MemberIndex() {
    }

    public MemberIndex(ResultSet rs) {
        
        try {
                while (rs.next()) {
                    this.member = new member(
                          Integer.parseInt(rs.getString(1)),
                          rs.getString(2),
                          rs.getString(3), 
                          rs.getString(4),
                          rs.getString(5),
                          rs.getString(6),  
                          rs.getString(7),
                           rs.getString(8), 
                         dbCon.getPosAsString(rs.getString(9))
                           );       
                    
                   if(!rs.getString(2).equals("1")||!rs.getString(2).equals("2")){                    
                   this.member.setFees(dbCon.getMemberFees(rs.getString(1)));
                   this.member.setStats(dbCon.getMemberStats(rs.getString(1)));
                   this.member.setLet(dbCon.getMemberLet(rs.getString(1)));
                   }
                   
                   this.member.setInbox(dbCon.getAllInboxMessages(rs.getString(1)));
                   this.member.setSent(dbCon.getAllSentMessages(rs.getString(1)));
                   
                  
       
                    switch (rs.getString(2)) {
                        case "1":this.RecruitList.add(member); ;
                                 break;
                        case "2":  this.CoachList.add(member);
                                 break;
                        case "3": this.CommitteeList.add(member);
                                  this.PlayerList.add(member);
                                 break;
                        case "4": this.PlayerList.add(member);
                                 break;
                        default: ;
                                 break;
                    }
                          
                }
            }
            catch (SQLException e) {
                
            }
        }

    public ArrayList<member> getPlayerList() {
        return PlayerList;
    }

    public ArrayList<member> getRecruitList() {
        return RecruitList;
    }

    public ArrayList<member> getCoachList() {
        return CoachList;
    }

    public ArrayList<member> getCommitteeList() {
        return CommitteeList;
    }

    
    
}
