/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Matheus
 */
public class fixtureList {
    
    private ArrayList<Fixture> fixtureArrayList = new ArrayList<>();    
    private Fixture fixture;

    public fixtureList() {
    }

    public fixtureList(ResultSet rs) {
        
        try {
                while (rs.next()) {
                    this.fixture = new Fixture(
                            Integer.parseInt(rs.getString(1)),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            Integer.parseInt(rs.getString(6)),
                            rs.getString(7)
                            );
                   this.fixtureArrayList.add(this.fixture);
                   
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }

    public ArrayList<Fixture> getFixtureList() {
        return this.fixtureArrayList;
    }
    
    
}
