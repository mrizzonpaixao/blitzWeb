/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBCon;


import CMS.Fixture;
import CMS.Home;
import CMS.NewsArticle;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Equipament.EquipamentLet;
import Equipament.Helmet;
import Equipament.ShoulderPad;
import java.util.ArrayList;
import memberInfo.Fees;
import memberInfo.MemberIndex;
import memberInfo.Message;
import memberInfo.Stats;

/**
 *
 * @author Matheus
 */
public class DbCon {
    
    private String queryString;
    private PreparedStatement pstmt;
    private Connection conn;
    private ResultSet rset;
    private Home home; 
    private Boolean added = true;
    private MemberIndex members;
    private Fees fees;
    private Stats stats;
    private int[] gameDayFees;
    private ArrayList<Message> Inbox = new ArrayList<>();
    private ArrayList<Message> Sent = new ArrayList<>();
    private Message message;
    private EquipamentLet let;
    private Helmet helmet;
    private ShoulderPad pad;

    public DbCon() {
        this.home = new Home();
    }
    
    public void dbConnect(){
    try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
             conn = DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/blitzWeb", "matpx", "onelife23");
            System.out.println("Connection OK");
        }
        catch (Exception e) {
            System.out.println("Connection fail");
        
    }
    }
    
    
    public ArrayList<NewsArticle> getAllNews() throws SQLException{
    
        queryString = "SELECT * FROM cms_news ORDER BY date_stamp DESC ";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        home.setNews(rset);
    
    return home.getNews();
    }
    
    public Boolean addMember( String firstName, String surname,
            String email){
    
        queryString = "INSERT INTO members (first_name, surname, email) VALUES('"+firstName+"','"+surname+"','"+email+"')";
        
         System.out.println(queryString);
        try {
            pstmt = conn.prepareStatement(queryString);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
            added = false;
           }        
    return added;
    }
    
    public ArrayList<Fixture> getAllFixtures() throws SQLException{
    
        queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
       home.setFixtures(rset);
    
    return home.getFixtures();
    }
    
    public void endConn() throws SQLException{
    
        conn.close();
    
    }
    
    public MemberIndex getAllMembers() throws SQLException {
      
        queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        this.members = new MemberIndex(rset);
    
    return members;
    }
    
    public Stats getMemberStats(String memberID) throws SQLException{
    
         queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
         
                
        while (rset.next()) {
                    this.stats = new Stats(
                          Integer.parseInt(rset.getString(1)),
                          Integer.parseInt(rset.getString(2)),
                          rset.getString(3),
                          rset.getString(4),
                          rset.getString(5),
                          rset.getString(6),
                          rset.getString(7),
                          rset.getString(8)
                            );
        }
        
    return stats;
    }
    
    public Fees getMemberFees(String memberID) throws SQLException{
    
        queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
    
        this.gameDayFees = new int[7];
        
        
                while (rset.next()) {                    
                    
                     this.gameDayFees[0] = Integer.parseInt(rset.getString(6));
                     this.gameDayFees[1] = Integer.parseInt(rset.getString(7));
                     this.gameDayFees[2] = Integer.parseInt(rset.getString(8));
                     this.gameDayFees[3] = Integer.parseInt(rset.getString(9));
                     this.gameDayFees[4] = Integer.parseInt(rset.getString(10));
                     this.gameDayFees[5] = Integer.parseInt(rset.getString(11));
                     this.gameDayFees[6] = Integer.parseInt(rset.getString(12));
                     this.gameDayFees[7] = Integer.parseInt(rset.getString(13));
                                  
                    this.fees = new Fees(
                          Integer.parseInt(rset.getString(1)),
                          Integer.parseInt(rset.getString(2)),
                          Integer.parseInt(rset.getString(3)),
                          Integer.parseInt(rset.getString(4)),
                          Integer.parseInt(rset.getString(5)),
                          this.gameDayFees,  
                          rset.getString(14));
                }
    
    return fees;
    }
    
    public ArrayList<Message> getAllInboxMessages(String ReciverId) throws SQLException{
        
     queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();  
        
      if (!rset.isBeforeFirst() ) {  
            return null;
         }   
        
    while (rset.next()) {
                    this.message = new Message(
                          Integer.parseInt(rset.getString(1)),
                          rset.getString(2),
                          rset.getString(3),  
                          rset.getString(4), 
                          rset.getString(5),
                          rset.getString(6),
                          Integer.parseInt(rset.getString(7))  );
                   this.Inbox.add(this.message);
                   
                }
    
    return Inbox;
    }
    
    public ArrayList<Message> getAllSentMessages(String memberId) throws SQLException{
        
     queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();  
        
      if (!rset.isBeforeFirst() ) {  
            return null;
         }   
        
    while (rset.next()) {
                    this.message = new Message(
                          Integer.parseInt(rset.getString(1)),
                          rset.getString(2),
                          rset.getString(3),  
                          rset.getString(4), 
                          rset.getString(5),
                          rset.getString(6),
                          Integer.parseInt(rset.getString(7))  );
                   this.Sent.add(this.message);
                   
                }
    
    return Sent;
    }

    public EquipamentLet getMemberLet(String memberId) throws SQLException {
        
        queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();  
        
      if (!rset.isBeforeFirst() ) {  
            return null;
         }
        
        while (rset.next()) {
                    this.let = new EquipamentLet(
                          Integer.parseInt(rset.getString(1)),
                          Integer.parseInt(rset.getString(2)),
                          Integer.parseInt(rset.getString(3)),
                          Integer.parseInt(rset.getString(4)),
                          Integer.parseInt(rset.getString(5))  );
                    let.setHelmet(getHelmetById(rset.getString(4)));
                    let.setPad(getPadById(rset.getString(3)));
        }       
        
        return let;
    }
    
    private Helmet getHelmetById(String id) throws SQLException{
        
        queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery(); 
        
        while (rset.next()) {
                    this.helmet = new Helmet(
                          Integer.parseInt(rset.getString(1)),                          
                          rset.getString(2),
                          rset.getString(3)
                            );
        }
    return helmet;
    }
    
     private ShoulderPad getPadById(String id) throws SQLException{
        
         queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery(); 
        
         while (rset.next()) {
                    this.pad = new ShoulderPad(
                          Integer.parseInt(rset.getString(1)),                          
                          rset.getString(2),
                          rset.getString(3)
                            );
         }
    
    return pad;
    }
    
}
