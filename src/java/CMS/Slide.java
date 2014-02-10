/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

/**
 *
 * @author Matheus
 */
public class Slide {
    
    private int slideshowID;
    private int memberID;
    private String imgSrc;
    private String dateStamp;
    private String[] splitDate;
   private String finalDate;

    public Slide() {
        this.slideshowID = 0;
        this.memberID = 0;
        this.imgSrc = "";
        this.dateStamp = "";
    }

    public Slide(int slideshow_id, int member_id, String imgSrc, String dateStamp) {
        this.slideshowID = slideshow_id;
        this.memberID = member_id;
        this.imgSrc = imgSrc;
        this.dateStamp = editDate(dateStamp);
    }
    
    private String editDate(String tempDate){
        
    this.splitDate = tempDate.split(" ");
    this.splitDate = this.splitDate[0].split("-");
    this.finalDate= splitDate[2] +"/"+ splitDate[1]+"/" + splitDate[0];
        
        return finalDate;
    }

    public int getSlideshowID() {
        return slideshowID;
    }

    public void setSlideshowID(int slideshowID) {
        this.slideshowID = slideshowID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
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
    
    
}
