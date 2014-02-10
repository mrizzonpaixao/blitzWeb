/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Matheus
 */
public class Global {
    
    private int cmsGlobalID;
    private int memberID;
    private String footCopyright;
    private String footEmail;
    private String dateStamp;
    private String logoSrc;
    private String[] splitDate;
    private String finalDate;

    public Global() {
    }

    public Global(ResultSet rs) {
        try {
                while (rs.next()) {                    
                          this.cmsGlobalID = Integer.parseInt(rs.getString(1));
                          this.memberID = Integer.parseInt(rs.getString(2));
                          this.footCopyright = rs.getString(3); 
                          this.footEmail = rs.getString(4);
                          this.dateStamp = editDate(rs.getString(5));
                          this.logoSrc = rs.getString(6);                                                           
                }
            }
            catch (SQLException e) {
                
            }
       
    }

    private String editDate(String tempDate){
        
    this.splitDate = tempDate.split(" ");
    this.splitDate = this.splitDate[0].split("-");
    this.finalDate= splitDate[2] +"/"+ splitDate[1]+"/" + splitDate[0];
        
        return finalDate;
    }
    
    public int getCmsGlobalID() {
        return cmsGlobalID;
    }

    public void setCmsGlobalID(int cmsGlobalID) {
        this.cmsGlobalID = cmsGlobalID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getFootCopyright() {
        return footCopyright;
    }

    public void setFootCopyright(String footCopyright) {
        this.footCopyright = footCopyright;
    }

    public String getFootEmail() {
        return footEmail;
    }

    public void setFootEmail(String footEmail) {
        this.footEmail = footEmail;
    }

    public String getDateStamp() {
        return dateStamp;
    }

    public void setDateStamp(String dateStamp) {
        this.dateStamp = dateStamp;
    }

    public String getLogoSrc() {
        return logoSrc;
    }

    public void setLogoSrc(String logoSrc) {
        this.logoSrc = logoSrc;
    }
    
    
    
    
}
