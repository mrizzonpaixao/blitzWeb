/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package memberInfo;

/**
 *
 * @author Matheus
 */
public class Stats {
    
    private int stasID;
    private int memberID;
    private String rushYds;
    private String pasYds;
    private String recvYds;
    private String tds;
    private String tckls;
    private String scks;
    private String inter;

    public Stats() {
        
        this.stasID = 0;
        this.memberID = 0;
        this.rushYds = "";
        this.pasYds = "";
        this.recvYds = "";
        this.tds = "";
        this.tckls = "";
        this.scks = "";
    }

    public Stats(int stasID, int memberID, String rushYds, String pasYds,
            String recvYds, String tds, String tckls, String scks) {
        this.stasID = stasID;
        this.memberID = memberID;
        this.rushYds = rushYds;
        this.pasYds = pasYds;
        this.recvYds = recvYds;
        this.tds = tds;
        this.tckls = tckls;
        this.scks = scks;
    }

    public int getStasID() {
        return stasID;
    }

    public void setStasID(int stasID) {
        this.stasID = stasID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getRushYds() {
        return rushYds;
    }

    public void setRushYds(String rushYds) {
        this.rushYds = rushYds;
    }

    public String getPasYds() {
        return pasYds;
    }

    public void setPasYds(String pasYds) {
        this.pasYds = pasYds;
    }

    public String getRecvYds() {
        return recvYds;
    }

    public void setRecvYds(String recvYds) {
        this.recvYds = recvYds;
    }

    public String getTds() {
        return tds;
    }

    public void setTds(String tds) {
        this.tds = tds;
    }

    public String getTckls() {
        return tckls;
    }

    public void setTckls(String tckls) {
        this.tckls = tckls;
    }

    public String getScks() {
        return scks;
    }

    public void setScks(String scks) {
        this.scks = scks;
    }

    public String getInter() {
        return inter;
    }

    public void setInter(String inter) {
        this.inter = inter;
    }
    
    
    
    
    
}
