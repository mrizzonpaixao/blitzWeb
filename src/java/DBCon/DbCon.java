/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DBCon;


import CMS.AboutUs;
import CMS.ContactUs;
import CMS.Fixture;
import CMS.Global;
import CMS.Home;
import CMS.NewsArticle;
import CMS.NoticeBoard;
import CMS.Post;
import CMS.Slide;
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
import java.sql.Statement;
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
    private Boolean added;
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
    private AboutUs about;
    private ContactUs contact;
    private Global global;
    private String memberRole;
    private String memberId;
    private NewsArticle article;
    private NewsArticle newsArticle;
    private ArrayList<Post> Posts;
    private NoticeBoard notice;
    private Post post;
            
    public DbCon() {
        this.added = true;
        this.home = new Home();
        dbConnect();
    }
    
    private void dbConnect(){
    try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
             conn = DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/blitzWeb", "matpx", "onelife23");
            
        }
        catch (Exception e) {
            System.out.println("Connection fail");
        
    }
    }
    
    /*Home page*/
    
    public ArrayList<NewsArticle> getAllNews() throws SQLException{
    
        queryString = "SELECT cms_news.news_id, members.first_name,"
                + "members.surname, cms_news.content, cms_news.date_stamp,"
                + "cms_news.title  FROM blitzweb.cms_news INNER JOIN members"
                + " on cms_news.member_id = members.member_id"
                + " ORDER BY cms_news.date_stamp DESC; ";
        
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        home.setNews(rset);
    
    return home.getNews();
    }
    
    public NewsArticle addNewsArticle(String memberId, String content, String title) throws SQLException{
         String id="";
         queryString = "INSERT INTO cms_news VALUES(null,"+memberId+",'"+content+"',null,'"+title+"');";
         pstmt = conn.prepareStatement(queryString);
         pstmt.executeUpdate();
         
         queryString = "select LAST_INSERT_ID() from cms_news";
         pstmt = conn.prepareStatement(queryString);
         rset  = pstmt.executeQuery();
    
         while (rset.next()) {
           id = rset.getString(1);
                             }
         
         queryString = "SELECT cms_news.news_id, members.first_name,"
                + "members.surname, cms_news.content, cms_news.date_stamp,"
                + "cms_news.title  FROM blitzweb.cms_news INNER JOIN members"
                + " on cms_news.member_id = members.member_id"
                + " WHERE news_id="+id+" ; ";
        
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        while (rset.next()) {
                
                String fullName = rset.getString(2) +" "+ rset.getString(3);
                       this.newsArticle = new NewsArticle(
                               Integer.parseInt(rset.getString(1)),
                               fullName,
                               rset.getString(4),
                               rset.getString(5),
                               rset.getString(6)
                               );
        }
    
    return this.newsArticle;
    }
    
    public Boolean addMember(String firstName, String surname, String email, 
            String ContactNum, String password ) throws SQLException{
    added = true;
    
        queryString = "INSERT INTO members (first_name,surname,email,contact_num,member_password) VALUES('" + firstName +"',"
                + "'"+ surname +"','"+ email +"','"+ ContactNum +"','"+ password +"')";
        try {
            pstmt = conn.prepareStatement(queryString);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
            added = false;
           } 
        
        if(!checkLogin(email,password)){
        added = false;
        }
        
    return added;
    }
    
    public Boolean checkEmail(String email) throws SQLException{
                
        queryString = "SELECT COUNT(*) FROM members\n" +
"WHERE email='"+email+"'";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        String temp = "";
         while (rset.next()) {
         
             temp = rset.getString(1);
         
         }
         
         if(temp.contains("0")){
         return false;
         }else{
         return true;
         }
    
   
    }
    
    public ArrayList<Fixture> getAllFixtures() throws SQLException{
    
        queryString = "SELECT * FROM cms_fixtures";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
       home.setFixtures(rset);
    
    return home.getFixtures();
    }
    
    public Boolean updateFixture(String date, String team, String homeScore, 
            String opScore, String memberId, String fixtureID){
    
        Boolean update = true;
        
        queryString = "update cms_fixtures set gameDate = '"+ date +"', team= "
                + "'"+ team+"', blitz_score= '"+ homeScore +"', op_score="
                + " '"+ opScore+"', member_id = "+ memberId +", date_stamp"
                + " = null where fixture_id= "+fixtureID+";";
        try {
            pstmt = conn.prepareStatement(queryString);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
            update = false;
        }
        
        
    return update;
    }
    
    public ArrayList<Slide> getAllSlides() throws SQLException{
    
        queryString = "SELECT * FROM cms_slideshow where active = 0;";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
       home.setSlideShow(rset);
    
    return home.getSlideShow();
    }
    
    public String addSlide(String id, String fileName) throws SQLException{
    String slideId="";
    
    queryString = "INSERT INTO cms_slideshow values(Null,"+id+",'"+fileName+"',null,0);";
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    queryString = "select LAST_INSERT_ID() from cms_slideshow";
    pstmt = conn.prepareStatement(queryString);
    rset  = pstmt.executeQuery();
    
    while (rset.next()) {
        return rset.getString(1);
        }
            
    return slideId;
    };
    
    public Boolean removeSlide(String id, String memberId) throws SQLException{
    
    Boolean temp = true;
    
    queryString = "UPDATE cms_slideshow set date_stamp=null, active = 1, member_id="+memberId+" where slideshow_id = "+id+";";
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    return temp;
    }
    
    /*About us Page*/
    
    public AboutUs getAboutUsPage() throws SQLException{
    
        queryString = "SELECT * FROM cms_about ORDER BY date_stamp DESC LIMIT 1 ";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
       about = new AboutUs(rset);
    
    return about;
    }
    
    public Boolean editAboutImg(String memberId, String imgSrc) throws SQLException{
    
    Boolean temp = true;
    String aboutTxt ="";
    queryString = "SELECT about_txt FROM cms_about ORDER BY date_stamp DESC LIMIT 1 ";
    pstmt = conn.prepareStatement(queryString);
    rset = pstmt.executeQuery();
    
    while (rset.next()) {
        aboutTxt = rset.getString(1);
        }
    
    queryString = "INSERT INTO cms_about VALUES(null,"+memberId+",'"+aboutTxt+"','"+imgSrc+"',null)";
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
        
          
    return temp;
    } 
    
    public Boolean editAboutContent (String memberId, String aboutCont) throws SQLException{
    
    Boolean temp = true;
    String imgSrc ="";
    queryString = "SELECT about_img FROM cms_about ORDER BY date_stamp DESC LIMIT 1 ";
    pstmt = conn.prepareStatement(queryString);
    rset = pstmt.executeQuery();
    
    while (rset.next()) {
        imgSrc = rset.getString(1);
        }
    
    queryString = "INSERT INTO cms_about VALUES(null,"+memberId+",'"+aboutCont+"','"+imgSrc+"',null)";
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
        
          
    return temp;
    } 
    public ContactUs getContactUsPage() throws SQLException{
    
        queryString = "SELECT * FROM cms_contact ORDER BY date_stamp DESC LIMIT 1 ";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
       contact = new ContactUs (rset);
    
    return contact;
    }
    
    public Boolean updateContactInfo(String memberId, String postalPostCode, String postalCity, 
            String postalFirstLine, String gamePostcode, String gameFirstline, String gameCity) throws SQLException{
    
        Boolean temp = true;
        
        queryString = "INSERT INTO cms_contact VALUES(null,"+memberId+",'"+postalPostCode+"','"+postalFirstLine+
                "','"+postalCity+"','"+gamePostcode+"','"+gameFirstline+"','"+gameCity+"',null)";
        
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    return temp;
    }
    
    public Global getGlobalElements() throws SQLException{
    
        queryString = "SELECT * FROM cms_global ORDER BY date_stamp DESC LIMIT 1 ";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
       global = new Global (rset);
    
    return global;
    }
    
    
    public MemberIndex getAllMembers() throws SQLException {
      
        queryString = "SELECT * from members ORDER BY surname;";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        this.members = new MemberIndex(rset);
    
    return members;
    }
    
    public String getPosAsString(String id) throws SQLException{
       queryString = "SELECT pos_description FROM positions where pos_id ='"+ id +"'; ";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery(); 
        
        while (rset.next()) {
        return rset.getString(1);
        }
        
        return null;
    }
    
    public Stats getMemberStats(String memberID) throws SQLException{
    
         queryString = "SELECT * FROM stats where member_id ='"+ memberID +"';";
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
    
        queryString = "SELECT * FROM fees where member_id='"+ memberID +"';";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
    
        this.gameDayFees = new int[8];
        
        
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
        
     queryString = "SELECT * FROM messages where receiver_id = '"+ ReciverId +"';";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();  
        
      if (!rset.isBeforeFirst() ) {  
            return Inbox;
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
        
     queryString = "SELECT * FROM messages where sender_id = '"+ memberId +"';";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();  
        
      if (!rset.isBeforeFirst() ) {  
            return Sent;
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
        
        queryString = "SELECT * FROM equipment_lets where member_id = '"+ memberId +"';";
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
                     let.setPad(getPadById(rset.getString(3)));
                    let.setHelmet(getHelmetById(rset.getString(4)));
                   
                    
        }       
        
        return let;
    }
    
    private Helmet getHelmetById(String id) throws SQLException{
        
        queryString = "SELECT * FROM helmets WHERE helmet_id ="+id;
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
        
        queryString = "SELECT * FROM shoulder_pads WHERE pad_id = 1";         
        pstmt = conn.prepareStatement(queryString);
        ResultSet r = pstmt.executeQuery(); 
        
         while (r.next()) {
                    this.pad = new ShoulderPad(
                          Integer.parseInt(r.getString(1)),                          
                          r.getString(2),
                          r.getString(3)
                            );
         }
    
    return pad;
    }
     
     public void endConn() throws SQLException{
    
        conn.close();
    
    }

    public boolean checkLogin(String email, String password) throws SQLException {
        
        boolean loginOk = false;
         queryString = "SELECT member_id , role_id FROM members WHERE email='"+email+""
                 + "' and member_password='"+password+"';";
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery(); 
        
        if (!rset.isBeforeFirst() ) {  
            return loginOk;
         }else{
            loginOk = true;
        }
        
        while (rset.next()) {
        
            this.memberId = rset.getString(1);
            this.memberRole = rset.getString(2);  
                                
            }        
        
        return loginOk;
    }

    public String getMemberRole() {
        return memberRole;
    }

    public String getMemberId() {
        return memberId;
    }
    
    public String addPost(String content, String id) throws SQLException {
    
    queryString = "INSERT INTO notice_board VALUES(null,"+id+",'"+content+"',null)";
        try {
            pstmt = conn.prepareStatement(queryString);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
           return "fail"; 
        }
        
        queryString = "select LAST_INSERT_ID() from cms_slideshow";
        try {
            pstmt = conn.prepareStatement(queryString);
        } catch (SQLException ex) {
            Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
        }
    rset  = pstmt.executeQuery();
    
    while (rset.next()) {
        return rset.getString(1);
        }
            
    return "fail";
    }
    
   public NoticeBoard getallPosts() throws SQLException{
   
    queryString = "SELECT board_id, first_name, surname, content,"+
                " date_stamp, member_img, members.member_id FROM blitzweb.notice_board INNER JOIN members" +
                           " on notice_board.member_id = members.member_id " +
                                     "ORDER BY notice_board.date_stamp ASC;";
        
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        notice = new NoticeBoard(rset);
    
   
   return notice;
   }
   
   public Post getPostsAtId(String id) throws SQLException{
   
    queryString = "SELECT board_id, first_name, surname, content,"+
                " date_stamp, member_img, members.member_id FROM blitzweb.notice_board INNER JOIN members" +
                           " on notice_board.member_id = members.member_id " +
                                     "WHERE board_id = "+id+";";
        
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        while (rset.next()) {
                    post = new Post(
                          Integer.parseInt(rset.getString(1)),
                          rset.getString(2),
                          rset.getString(3),
                          rset.getString(4), 
                          rset.getString(5),
                          rset.getString(6),
                          rset.getString(7)  
                            );
                                 
                }
    
   
   return post;
   }
   
   public Boolean updateMemberImg(String imgName, String memberId) throws SQLException{
    
    Boolean temp = true;
    
    queryString = "UPDATE members set member_img = '"+imgName+"' WHERE member_id ="+memberId;
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    return temp;
    }
   
   public Boolean editMemberDetail(String userId, String pos, String role,
           String firstName, String surname, String email, String contact) throws SQLException{
   
   Boolean temp = true;
  
    queryString = "UPDATE members set role_id="+ role +",first_name='"+firstName+"' ,surname='"+
            surname+"' ,email='"+email+"' ,contact_num='"+contact+"' ,possition_id=" + pos +" WHERE member_id = " + userId ;
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    return temp;
   }
    
   public Boolean editStats(String statId,  String RushYds , String PasYds,
             String RecYds , String Tds , String Sck, String Tckl ) throws SQLException{
   
   Boolean temp = true;
  
    queryString = "UPDATE stats set rush_yds="+RushYds+", pas_yds="+PasYds
            +", recv_yds="+RecYds+", tds="+Tds+", tckls="+Tckl+", scks="+Sck
            +" WHERE stat_id = " + statId ;
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    return temp;
   }
   
   public Boolean editmemberDesc(String memberId,  String desc) throws SQLException{
   
   Boolean temp = true;
  
    queryString = "UPDATE members set description='"+desc+"' WHERE member_id = " + memberId ;
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    return temp;
   }
  
   public Boolean editFee(String userId, String row, String val ) throws SQLException{
   Boolean temp = true;
  
    queryString = "UPDATE fees set "+row+"="+val+" WHERE member_id = " + userId ;
    pstmt = conn.prepareStatement(queryString);
    pstmt.executeUpdate();
    
    return temp;
   
   }

    public MemberIndex getMemberAtVal(String val) throws SQLException {
        
        MemberIndex m;
        
         queryString = "SELECT * FROM members WHERE first_name LIKE '"+val
                 +"%' OR surname LIKE '"+val+"%' OR email LIKE '"+val+"%' LIMIT 4";
         
        pstmt = conn.prepareStatement(queryString);
        rset = pstmt.executeQuery();
        
        m = new  MemberIndex(rset);
       
        return m;
    }
}
