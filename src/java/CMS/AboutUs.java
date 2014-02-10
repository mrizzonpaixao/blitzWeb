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
public class AboutUs {
    
    private int cmsAboutID;
    private int memberID;
    private String aboutText;
    private String imgSrc;
    private String dateStamp;
    private String[] splitDate;
    private String finalDate;

    public AboutUs() {
    }

    public AboutUs(ResultSet rs) {
        
        
        try {
                while (rs.next()) {                     
                    this.cmsAboutID = Integer.parseInt(rs.getString(1));
                    this.memberID = Integer.parseInt(rs.getString(2));
                    this.aboutText = rs.getString(3);
                    this.imgSrc = rs.getString(4);
                    this.dateStamp = editDate(rs.getString(5));                                                                         
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

    public int getCmsAboutID() {
        return cmsAboutID;
    }

    public void setCmsAboutID(int cmsAboutID) {
        this.cmsAboutID = cmsAboutID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getAboutText() {
        return aboutText;
    }

    public void setAboutText(String aboutText) {
        this.aboutText = aboutText;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public String getDateStamp() {
        return dateStamp;
    }

    public void setDateStamp(String dateStamp) {
        this.dateStamp = dateStamp;
    }

    public String[] getSplitDate() {
        return splitDate;
    }

    public void setSplitDate(String[] splitDate) {
        this.splitDate = splitDate;
    }

    public String getFinalDate() {
        return finalDate;
    }

    public void setFinalDate(String finalDate) {
        this.finalDate = finalDate;
    }
    
    
    
}
