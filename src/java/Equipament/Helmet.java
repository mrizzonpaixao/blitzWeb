/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipament;

/**
 *
 * @author Matheus
 */
public class Helmet {
    
    private int helmet_id;
    private String brand;
    private String size;

    public Helmet() {
        
        this.helmet_id = 0;
        this.brand = "";
        this.size = "";
    }    
    
    public Helmet(int helmet_id, String brand, String size) {
        this.helmet_id = helmet_id;
        this.brand = brand;
        this.size = size;
    }

    public int getHelmet_id() {
        return helmet_id;
    }

    public void setHelmet_id(int helmet_id) {
        this.helmet_id = helmet_id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    
    
    
    
    
}
