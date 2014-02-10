/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * * @author Matheus
 */
public class ContactUs {
    
    private int cmsContactID;
    private int memberID;
    private String postPostCode;
    private String postFirstLine;
    private String postCity;
    private String gamePostCode;
    private String gameFirstLine;
    private String gameCity;
    private String dateStamp;
    private String[] splitDate;
    private String finalDate;

    public ContactUs() {
    }

    public ContactUs(ResultSet rs) {
        
        try {
                while (rs.next()) {                     
                    this.cmsContactID = Integer.parseInt(rs.getString(1));
                    this.memberID = Integer.parseInt(rs.getString(2));
                    this.postPostCode = rs.getString(3);
                    this.postFirstLine = rs.getString(4);
                    this.postCity = rs.getString(5);
                    this.gamePostCode = rs.getString(6);
                    this.gameFirstLine = rs.getString(7);
                    this.gameCity = rs.getString(8);
                    this.dateStamp = editDate(rs.getString(9));       
                            
                                                                                                     
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

    public int getCmsContactID() {
        return cmsContactID;
    }

    public void setCmsContactID(int cmsContactID) {
        this.cmsContactID = cmsContactID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getPostPostCode() {
        return postPostCode;
    }

    public void setPostPostCode(String postPostCode) {
        this.postPostCode = postPostCode;
    }

    public String getPostFirstLine() {
        return postFirstLine;
    }

    public void setPostFirstLine(String postFirstLine) {
        this.postFirstLine = postFirstLine;
    }

    public String getPostCity() {
        return postCity;
    }

    public void setPostCity(String postCity) {
        this.postCity = postCity;
    }

    public String getGamePostCode() {
        return gamePostCode;
    }

    public void setGamePostCode(String gamePostCode) {
        this.gamePostCode = gamePostCode;
    }

    public String getGameFirstLine() {
        return gameFirstLine;
    }

    public void setGameFirstLine(String gameFirstLine) {
        this.gameFirstLine = gameFirstLine;
    }

    public String getGameCity() {
        return gameCity;
    }

    public void setGameCity(String gameCity) {
        this.gameCity = gameCity;
    }

    public String getDateStamp() {
        return dateStamp;
    }

    public void setDateStamp(String dateStamp) {
        this.dateStamp = dateStamp;
    }

    
    
}
