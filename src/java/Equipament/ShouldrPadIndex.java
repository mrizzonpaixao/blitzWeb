/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Equipament;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Matheus
 */
public class ShouldrPadIndex {
    
    private ArrayList<ShoulderPad> shoulderPadArrayList = new ArrayList<>();    
    private ShoulderPad shoulderPad;

    public ShouldrPadIndex() {
    }

    public ShouldrPadIndex(ResultSet rs) {
        
        try {
                while (rs.next()) {
                    this.shoulderPad = new ShoulderPad(
                          Integer.parseInt(rs.getString(1)),                          
                          rs.getString(2),
                          rs.getString(3)
                            );
                   this.shoulderPadArrayList.add(this.shoulderPad);
                   
                }
            }
            catch (SQLException e) {
                
            }
        }

    public ArrayList<ShoulderPad> getshoulderPadList() {
        return this.shoulderPadArrayList;
    }
    
    
}
