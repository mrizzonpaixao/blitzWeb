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
    private String firstName;
    private String Surname;
    private String content;
    private String dateStamp;
    private String[] splitDate;
    private String finalDate;
    private String imgSrc;
    private String memberId;

    public Post() {
        this.board_id = 0;
        this.firstName = "";
        this.Surname = "";
        this.content = "";
        this.dateStamp = "";
    }
    
    public Post(int board_id, String firstName, String surname, String content,
            String dateStamp, String imgSrc, String memberId) {
        this.board_id = board_id;
        this.Surname = surname;
        this.firstName = firstName;
        this.content = content;
        this.dateStamp = editDate(dateStamp);
        this.imgSrc = imgSrc;
        this.memberId = memberId;
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurname() {
        return Surname;
    }

    public void setSurname(String Surname) {
        this.Surname = Surname;
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

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    
    
}
