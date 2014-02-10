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
public class HelmetIndex {
    
    private ArrayList<Helmet> helmetArrayList = new ArrayList<>();    
    private Helmet helmet;

    public HelmetIndex() {
    }

    public HelmetIndex(ResultSet rs) {
        
        try {
                while (rs.next()) {
                    this.helmet = new Helmet(
                          Integer.parseInt(rs.getString(1)),                          
                          rs.getString(2),
                          rs.getString(3)
                            );
                   this.helmetArrayList.add(this.helmet);
                   
                }
            }
            catch (SQLException e) {
                
            }
        }

    public ArrayList<Helmet> gethelmetList() {
        return this.helmetArrayList;
    }
    
}
