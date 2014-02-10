/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package memberInfo;

/**
 *
 * @author Matheus
 */
public class Fees {
    
    private int fees_id;
    private int member_id;
    private int changedBy;
    private int teamFee;
    private int leagueFee;
    private int[] gameDayFees;
    private String dateStamp;
    private String[] splitDate;
    private String finalDate;

    public Fees() {
        this.gameDayFees = new int[7];
        this.fees_id = 0;
        this.member_id = 0;
        this.changedBy = 0;
        this.teamFee = 0;
        this.leagueFee = 0;        
        this.dateStamp = "";
        
    }

    public Fees(int fees_id, int member_id, int changedBy, int teamFee, int leagueFee, int[] gameDayFees, String dateStamp) {
        this.gameDayFees = new int[7];
        this.fees_id = fees_id;
        this.member_id = member_id;
        this.changedBy = changedBy;
        this.teamFee = teamFee;
        this.leagueFee = leagueFee;
        this.gameDayFees = gameDayFees;
        this.dateStamp = editDate(dateStamp);
    }
    
    private String editDate(String tempDate){
        
    this.splitDate = tempDate.split(" ");
    this.splitDate = this.splitDate[0].split("-");
    this.finalDate= splitDate[2] +"/"+ splitDate[1]+"/" + splitDate[0];
        
        return finalDate;
    }

    public int getFees_id() {
        return fees_id;
    }

    public void setFees_id(int fees_id) {
        this.fees_id = fees_id;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public int getChangedBy() {
        return changedBy;
    }

    public void setChangedBy(int changedBy) {
        this.changedBy = changedBy;
    }

    public int getTeamFee() {
        return teamFee;
    }

    public void setTeamFee(int teamFee) {
        this.teamFee = teamFee;
    }

    public int getLeagueFee() {
        return leagueFee;
    }

    public void setLeagueFee(int leagueFee) {
        this.leagueFee = leagueFee;
    }

    public int[] getGameDayFees() {
        return gameDayFees;
    }

    public void setGameDayFees(int[] gameDayFees) {
        this.gameDayFees = gameDayFees;
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
