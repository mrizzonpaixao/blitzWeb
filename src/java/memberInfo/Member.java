/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package memberInfo;

import Equipament.EquipamentLet;
import java.util.ArrayList;

/**
 *
 * @author Matheus
 */
public class Member {
    
    private int memberId;
    private String role;
    private String firstName;
    private String surname;
    private String fullname;
    private String email;
    private String contactNumber;
    private String description;
    private String imgSrc;
    private String jerseyNumber;
    private String possition;
    private Fees fees;
    private Stats stats;
    private ArrayList<Message> Inbox = new ArrayList<>();
    private ArrayList<Message> Sent = new ArrayList<>();
    private EquipamentLet let;

    public Member() {
        
        this.memberId = 0;
        this.role = "";
        this.firstName = "";
        this.surname = "";
        this.fullname = "";
        this.email = "";
        this.contactNumber = "";
        this.description = "";
        this.imgSrc = "";
        this.jerseyNumber = "";
        this.possition = "";
        
    }

    public Member(int member_id, String role, String firstName, String surname,
            String email, String contactNumber, String description, 
            String imgSrc, String possition) {
        
        this.memberId = member_id;
        this.role = role;
        this.firstName = firstName;
        this.surname = surname;        
        this.fullname = setFullname(firstName, surname);        
        this.email = email;
        this.contactNumber = contactNumber;
        this.description = description;
        this.imgSrc = imgSrc;
        this.possition = possition;
    }

    public EquipamentLet getLet() {
        return let;
    }

    public void setLet(EquipamentLet let) {
        this.let = let;
    }

    
    private String setFullname(String firstName, String surname) {
        this.fullname = surname.toUpperCase() +", " + firstName.toUpperCase();
        
        return this.fullname;
    }

    public void setMember_id(int member_id) {
        this.memberId = member_id;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public void setJerseyNumber(String jerseyNumber) {
        this.jerseyNumber = jerseyNumber;
    }

    public void setPossition(String possition) {
        this.possition = possition;
    }

    public void setFees(Fees fees) {
        this.fees = fees;
    }

    public void setStats(Stats stats) {
        this.stats = stats;
    }

    public void setInbox(ArrayList<Message> Inbox) {
        this.Inbox = Inbox;
    }

    public void setSent(ArrayList<Message> Sent) {
        this.Sent = Sent;
    }

    public int getMember_id() {
        return memberId;
    }

    public String getRole() {
        return role;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getSurname() {
        return surname;
    }

    public String getFullname() {
        return fullname;
    }

    public String getEmail() {
        return email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public String getDescription() {
        return description;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public String getJerseyNumber() {
        return jerseyNumber;
    }

    public String getPossition() {
        return possition;
    }

    public Fees getFees() {
        return fees;
    }

    public Stats getStats() {
        return stats;
    }

    public ArrayList<Message> getInbox() {
        return Inbox;
    }

    public ArrayList<Message> getSent() {
        return Sent;
    }

   
    
    
}
