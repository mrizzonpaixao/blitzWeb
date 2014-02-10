/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

/**
 *
 * @author Matheus
 */
public class Fixture {
    
    private int fixture_id;
    private String gameDate;
    private String team;
    private String blitz_score;
    private String op_score;
    private int member_id;
    private String dateStamp;
    private String[] splitDate;
    private String finalDate;
    private String result;

    public Fixture() {
    }

    public Fixture(int fixture_id, String gameDate,String team,
            String blitz_score, String op_score,
            int member_id, String dateStamp) {
        
        this.fixture_id = fixture_id;
        this.gameDate = gameDate;
        this.team = team;
        this.blitz_score = blitz_score;
        this.op_score = op_score;
        this.member_id = member_id;
        this.dateStamp = editDate(dateStamp);
        this.result = result(op_score,blitz_score);
        
       }
    
    private String editDate(String tempDate){
        
    this.splitDate = tempDate.split(" ");
    this.splitDate = this.splitDate[0].split("-");
    this.finalDate= splitDate[2] +"/"+ splitDate[1]+"/" + splitDate[0];
        
        return finalDate;
    }
    
    private String result(String op_score, String blitz_score){
        String temp;
        
        if(Integer.parseInt(op_score)< Integer.parseInt(blitz_score)){
        
            temp = "W";
        }
        else{
        temp = "L";
        }
            
        return temp;
    }

    public String getResult() {
        return result;
    }

    public int getFixture_id() {
        return fixture_id;
    }

    public void setFixture_id(int fixture_id) {
        this.fixture_id = fixture_id;
    }

    public String getGameDate() {
        return gameDate;
    }

    public void setGameDate(String gameDate) {
        this.gameDate = gameDate;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getBlitz_score() {
        return blitz_score;
    }

    public void setBlitz_score(String blitz_score) {
        this.blitz_score = blitz_score;
    }

    public String getOp_score() {
        return op_score;
    }

    public void setOp_score(String op_score) {
        this.op_score = op_score;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
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
