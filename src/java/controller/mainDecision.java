/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.servlet.http.HttpSession;
import modal.CardDetails;
import modal.CommentDetails;
import modal.GetDetails;

/**
 *
 * @author Raghu
 */
public class mainDecision extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet mainDecision</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mainDecision at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  processRequest(request, response);
      
      String fromwhere=request.getParameter("fromwhere");
      PrintWriter out=response.getWriter();
      out.println(fromwhere);
      if(fromwhere.equalsIgnoreCase("login"))
      {
          String uname=request.getParameter("username");
          String pass=request.getParameter("password");
          int uid=validateUser(uname,pass);
          
          if(uid>=0)
          {
              
              //ArrayList<CardDetails> posts=GetDetails.getPost();
              
             
              //request.setAttribute("result", posts);
             
              
              HttpSession session = request.getSession(true);
              session.setAttribute("uid", uid);
              RequestDispatcher rd=request.getRequestDispatcher("/mainPage.jsp");
              rd.forward(request, response);
          }
          else{
          RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
                request.setAttribute("check", "Wrong Password");
              rd.forward(request, response);
          }
      }
      else if(fromwhere.equalsIgnoreCase("register"))
      {
          boolean check=registerUser(request);
          System.out.println(check);
          
           RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
              rd.forward(request, response);
      }
      else if(fromwhere.equalsIgnoreCase("lagout"))
      {
           HttpSession session = request.getSession(true);
           session.invalidate();
          RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
              rd.forward(request, response);
      }
      
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private int validateUser(String uname,String pass)
    {
                boolean validUser = false;
		String validateUserQry = "select uid from login where username=? and password=?";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(validateUserQry);
			stat.setString(1,uname);
			stat.setString(2, pass);
                        
			ResultSet rs = stat.executeQuery();
			
			if(rs.next()) {				
	
					validUser = true;
                                     
                        int uid=rs.getInt("uid");
                        System.out.println(uid);
                        return uid;
                                       // System.out.println("id = "+rs.getString("username")+"  pass ="+rs.getString("password"));
			}
				
		}
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}  
                return -1;
    }
    
    private boolean registerUser(HttpServletRequest request)
    {
        String name,email,phone,pass;
        name=request.getParameter("name");
        email=request.getParameter("email");
        phone=request.getParameter("phone");
        pass=request.getParameter("pass");
        
        String checkRecord="select * from newusers where name=? and email=?";
        String validateUserQry = "insert into newusers (name,email,phone,password) values (?,?,?,?);";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(checkRecord);
                        stat.setString(1,name);
                        stat.setString(2,email);
                        ResultSet rs=stat.executeQuery();
                        if(rs.next())
                        {
                            
                            return false;
                        }
                                
                        
                                stat=con.prepareStatement(validateUserQry);
			stat.setString(1,name);
			stat.setString(2, email);
                        stat.setString(3, phone);
                        stat.setString(4, pass);
			stat.executeUpdate();      
                        
                        
                             String getuid="select uid from newusers where name=? and email=?"; 
                             stat = con.prepareStatement(getuid);
                             System.out.println(name+"  "+email);
                        stat.setString(1,name);
                        stat.setString(2,email);
                        rs=stat.executeQuery();
                        int uid=0;
                       rs.next();
                            uid=rs.getInt("uid");
                            System.out.println(uid);
                        
                        String addLogin="insert into login (uid,username,password) values (?,?,?)";
                        stat=con.prepareStatement(addLogin);
                        stat.setInt(1,uid);
                        stat.setString(2,name);
                        stat.setString(3,pass);
                        stat.executeUpdate();
			
			
				
		}
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}  
                return true;
        
    }
    
   

}
