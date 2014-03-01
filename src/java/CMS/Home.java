/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CMS;

import DBCon.DbCon;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Matheus
 */
public class Home {
    
    private ArrayList<NewsArticle> News = new ArrayList<>();
    private ArrayList<Fixture> Fixtures = new ArrayList<>();
    private ArrayList<Slide> SlideShow = new ArrayList<>();
    private Fixture fixture;
    private Slide slide;
    private NewsArticle newsArticle;
    private String fullName;
            
    

    public Home() {
        
    }

    public ArrayList<NewsArticle> getNews() {
        return News;
    }

    public void setNews(ResultSet rs) {
        try {
            while (rs.next()) {
                
                fullName = rs.getString(2) +" "+ rs.getString(3);
                       this.newsArticle = new NewsArticle(
                               Integer.parseInt(rs.getString(1)),
                               fullName,
                               rs.getString(4),
                               rs.getString(5),
                               rs.getString(6)
                               );
                      this.News.add(newsArticle);
                   }
        } catch (SQLException ex) {
            Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Fixture> getFixtures() {
        return Fixtures;
    }

    public void setFixtures(ResultSet rs) {
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
                       this.Fixtures.add(this.fixture);
                    }
        } catch (SQLException ex) {
            Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Slide> getSlideShow() {
        return SlideShow;
    }

    public void setSlideShow(ResultSet rs) {
        try {
            while (rs.next()) {
                        this.slide = new Slide(
                              Integer.parseInt(rs.getString(1)),
                              Integer.parseInt(rs.getString(2)),
                              rs.getString(3), 
                              rs.getString(4)
                                );
                       this.SlideShow.add(this.slide);
                    }
        } catch (SQLException ex) {
            Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
