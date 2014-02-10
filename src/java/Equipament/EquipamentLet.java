/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipament;

/**
 *
 * @author Matheus
 */
public class EquipamentLet {
    
    private int let_id;
    private int member_id;
    private int pad_id;
    private int helmet_id;
    private int fee;
    private Helmet helmet;
    private ShoulderPad pad; 

    public EquipamentLet() {
    }

    public EquipamentLet(int let_id, int member_id, int pad_id, int helmet_id, int fee) {
        this.let_id = let_id;
        this.member_id = member_id;
        this.pad_id = pad_id;
        this.helmet_id = helmet_id;
        this.fee = fee;
    }

    public Helmet getHelmet() {
        return helmet;
    }

    public void setHelmet(Helmet helmet) {
        this.helmet = helmet;
    }

    public ShoulderPad getPad() {
        return pad;
    }

    public void setPad(ShoulderPad pad) {
        this.pad = pad;
    }

    public int getLet_id() {
        return let_id;
    }

    public void setLet_id(int let_id) {
        this.let_id = let_id;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public int getPad_id() {
        return pad_id;
    }

    public void setPad_id(int pad_id) {
        this.pad_id = pad_id;
    }

    public int getHelmet_id() {
        return helmet_id;
    }

    public void setHelmet_id(int helmet_id) {
        this.helmet_id = helmet_id;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }
    
    
    
}
