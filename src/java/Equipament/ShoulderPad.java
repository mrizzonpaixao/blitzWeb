/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipament;

/**
 *
 * @author Matheus
 */
public class ShoulderPad {
    
      private int shoulderPad_id;
    private String brand;
    private String size;

    public ShoulderPad() {
        
        this.shoulderPad_id = 0;
        this.brand = "";
        this.size = "";
    }    
    
    public ShoulderPad(int shoulderPad_id, String brand, String size) {
        this.shoulderPad_id = shoulderPad_id;
        this.brand = brand;
        this.size = size;
    }

    public int getShoulderPad_id() {
        return shoulderPad_id;
    }

    public void setShoulderPad_id(int shoulderPad_id) {
        this.shoulderPad_id = shoulderPad_id;
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
