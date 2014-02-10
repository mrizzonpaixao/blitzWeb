/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

/**
 *
 * @author Matheus
 */
public class Post {
    
    private int board_id;
    private int member_id;
    private String content;
    private String dateStamp;
    private String[] splitDate;
    private String finalDate;

    public Post() {
        this.board_id = 0;
        this.member_id = 0;
        this.content = "";
        this.dateStamp = "";
    }
    
    public Post(int board_id, int member_id, String content, String dateStamp) {
        this.board_id = board_id;
        this.member_id = member_id;
        this.content = content;
        this.dateStamp = editDate(dateStamp);
    }
    
    private String editDate(String tempDate){
        
    this.splitDate = tempDate.split(" ");
    this.splitDate = this.splitDate[0].split("-");
    this.finalDate= splitDate[2] +"/"+ splitDate[1]+"/" + splitDate[0];
        
        return finalDate;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
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
    
    
}
