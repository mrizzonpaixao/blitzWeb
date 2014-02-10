/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package memberInfo;

/**
 *
 * @author Matheus
 */
public class Message {
    
    private int messageId;
    private String sender;
    private String revicer;
    private String subject;
    private String dateStamp;
    private String content;
    private int read;
    private String[] splitDate;
    private String finalDate;

    public Message() {
        
        this.messageId = 0;
        this.sender = "";
        this.revicer = "";
        this.subject = "";
        this.dateStamp = "";
        this.content = "";
        this.read = 0;
        
    }

    public Message( int messageId, String senderID, String revicerID, String subject,
            String dateStamp, String content, int read) {
        this.messageId = messageId;
        this.sender = senderID;
        this.revicer = revicerID;
        this.subject = subject;
        this.dateStamp = editDate(dateStamp);
        this.content = content;
        this.read = read;
    }
    
    private String editDate(String tempDate){
        
    this.splitDate = tempDate.split(" ");
    this.splitDate = this.splitDate[0].split("-");
    this.finalDate= splitDate[2] +"/"+ splitDate[1]+"/" + splitDate[0];
        
        return finalDate;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRevicer() {
        return revicer;
    }

    public void setRevicer(String revicer) {
        this.revicer = revicer;
    }

     public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDateStamp() {
        return dateStamp;
    }

    public void setDateStamp(String dateStamp) {
        this.dateStamp = dateStamp;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRead() {
        return read;
    }

    public void setRead(int read) {
        this.read = read;
    }
    
    
}
