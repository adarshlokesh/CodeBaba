/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Raghu
 */
public class GetDetails {
    public static ArrayList<CommentDetails> getComments(int pid)
    {
        CommentDetails comment;
        ArrayList<CommentDetails> cmt=new ArrayList<CommentDetails>();
         String getcomment="select * from comments where pid=?";
         String getUserDetails="select name from newusers where uid=?";
        
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(getcomment);
                        stat.setInt(1,pid);
                        ResultSet rs=stat.executeQuery();
                        while(rs.next())
                        {
                            comment=new CommentDetails();
                            PreparedStatement stat1=con.prepareStatement(getUserDetails);
                            stat1.setInt(1, rs.getInt("uid"));
                            
                            ResultSet rsUser=stat1.executeQuery();
                            if(rsUser.next())
                            {
                                comment.setName(rsUser.getString("name"));
                                String pic=rsUser.getString("name").substring(0, 1);
                                comment.setImage(pic.toUpperCase()+".jpg");
                            }
                            comment.setComment(rs.getString("comment"));
                            comment.setDate(rs.getString("date"));
                            
                           
                            
                            cmt.add(comment);
                        }
                }
                catch(Exception e){
			System.out.println("Exception:"+e);
			
		} 
        
        
        return cmt;
    }
    
    static public String getImage(int uid)
    {
             String getImage="select name from newusers where uid=?";
             String img=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(getImage);
                        stat.setInt(1, uid);
                        ResultSet rs=stat.executeQuery();
                        rs.next();
                        img=rs.getString("name").substring(0, 1).toUpperCase()+".jpg";
                }
                catch(Exception e){
			System.out.println("Exception:"+e);
			
		} 
                return img;
    }
    
     static public ArrayList getPost()
    {
        ArrayList<CardDetails> la=new ArrayList<CardDetails>();
        
        
        String checkRecord="select * from posts";
        String getUserDetails="select name,about from newusers where uid=?";
        
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(checkRecord);
                        
                        ResultSet rs=stat.executeQuery();
                        CardDetails c;
                        while(rs.next())
                        {
                            
                            c=new CardDetails();
                            PreparedStatement stat1=con.prepareStatement(getUserDetails);
                            stat1.setInt(1, rs.getInt("uid"));
                            ResultSet rs1=stat1.executeQuery();
                            rs1.next();
                            c.setUname(rs1.getString("name"));
                            c.setAbout(rs1.getString("about"));
                            c.setPic(rs.getString("pic"));
                            c.setTitle(rs.getString("title"));
                            c.setDescription(rs.getString("description"));
                            c.setProgram(rs.getString("program"));
                            c.setPid(rs.getString("pid"));
                            
                            c.setComment(getComments(rs.getInt("pid")));
                            c.setLikes(rs.getInt("likes"));
                            la.add(c);
                           
                        }
                                
                                
                               
			
				
		}
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}  
        
        
        return la;
    }
    
     
     
     static public ArrayList getProfilePost(int uid)
    {
        ArrayList<CardDetails> la=new ArrayList<CardDetails>();
        
        
        String checkRecord="select * from posts where uid=?";
        String getUserDetails="select name,about from newusers where uid=?";
        
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(checkRecord);
                        stat.setInt(1, uid);
                        ResultSet rs=stat.executeQuery();
                        CardDetails c;
                        while(rs.next())
                        {
                            
                            c=new CardDetails();
                            PreparedStatement stat1=con.prepareStatement(getUserDetails);
                            stat1.setInt(1, rs.getInt("uid"));
                            ResultSet rs1=stat1.executeQuery();
                            rs1.next();
                            c.setUname(rs1.getString("name"));
                            c.setAbout(rs1.getString("about"));
                            c.setPic(rs.getString("pic"));
                            c.setTitle(rs.getString("title"));
                            c.setDescription(rs.getString("description"));
                            c.setProgram(rs.getString("program"));
                            c.setPid(rs.getString("pid"));
                           
                            c.setComment(getComments(rs.getInt("pid")));
                            c.setLikes(rs.getInt("likes"));
                            la.add(c);
                           
                        }
                                
                                
                               
			
				
		}
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}  
        
        
        return la;
    }
     public static ResultSet getAboutUser(int uid)
     {
         String aboutQry="select * from newusers where uid=?";
        
        String details=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(aboutQry);
                        stat.setInt(1, uid);
                        ResultSet rs=stat.executeQuery();
                        if(rs.next())
                        {
                          /*
                            details=rs.getString("name");
                            details+=",";
                            details+=rs.getString("phone");
                            details+=",";
                            details+=rs.getString("about");
                            */
                            return rs;
                        }
                }
                catch(Exception e){
			System.out.println("Exception:"+e);
			
		}  
                
                return null;
     }
}
