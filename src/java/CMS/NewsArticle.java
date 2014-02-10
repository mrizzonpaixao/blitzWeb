/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

/**
 *
 * @author Matheus
 */
public class NewsArticle {
    
   private int newsID;
   private int memberID;
   private String content;
   private String dateStamp;
   private String title;
   private String[] splitDate;
   private String finalDate;

    public NewsArticle() {
     
        this.newsID = 0;
        this.memberID = 0;
        this.content = null;
        this.dateStamp = null;
        this.title = null;
        
    }   

    public NewsArticle(int news_id, int member_id, String content, String dateStamp, String title) {
        this.newsID = news_id;
        this.memberID = member_id;
        this.content = content;
        this.dateStamp = editDate(dateStamp);
        this.title = title;
    }
    
    private String editDate(String tempDate){
        
    this.splitDate = tempDate.split(" ");
    this.splitDate = this.splitDate[0].split("-");
    this.finalDate= splitDate[2] +"/"+ splitDate[1]+"/" + splitDate[0];
        
        return finalDate;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDateStamp() {
        return dateStamp;
    }

    public void setDateStamp(String dateStamp) {
        this.dateStamp = dateStamp;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
   
   
   
   
    
}
