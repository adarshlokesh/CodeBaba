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
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.CardDetails;
import modal.GetDetails;

/**
 *
 * @author Raghu
 */
public class profile extends HttpServlet {

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
            out.println("<title>Servlet profile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profile at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
       
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
       //processRequest(request, response);//
       String fromwhere=request.getParameter("fromwhere");
       System.out.println(fromwhere);
       if(fromwhere.equalsIgnoreCase("newpost")){
       postCard(request);
       RequestDispatcher rd=request.getRequestDispatcher("/mainPage.jsp");
        rd.forward(request, response);
       }
       else
       {
           updateDetail(request);
           RequestDispatcher rd=request.getRequestDispatcher("/profile.jsp");
        rd.forward(request, response);
       }
      // ArrayList<CardDetails> posts=GetDetails.getPost();
       //request.setAttribute("result", posts);
        
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
    
    
    
    
    
    private void updateDetail(HttpServletRequest request)
    {
        HttpSession ses=request.getSession();
    int uid=Integer.parseInt(ses.getAttribute("uid").toString());
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String about=request.getParameter("about");
    System.out.println("1"+uid+name+email+about);
 String updateDetails="update newusers set name=? ,email=?,about=? where uid=?";
        
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(updateDetails);
                        stat.setString(1, name);
                        stat.setString(2, email);
                        stat.setString(3, about);
                        stat.setInt(4, uid);
                        stat.executeUpdate();
                        System.out.println("2");
                }
                catch(Exception e){
			System.out.println("Exception:"+e);
			
		}  
        
    }
    private void postCard(HttpServletRequest request)
    {
        boolean validUser = false;
        HttpSession session = request.getSession(true);
        String title=request.getParameter("Title");
        String description=request.getParameter("Description");
        String program=request.getParameter("Program");
        if(program.contains("<"))
        program=program.replaceAll("<", "&lt");
        program=program.trim();
        if(program.contains(">"))
        program=program.replaceAll(">", "&gt");
        int uid=Integer.parseInt(session.getAttribute("uid").toString());
        System.out.println(program);
		String validateUserQry = "insert into posts (uid,pic,title,description,program) values (?,?,?,?,?)";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/code", "root","admin");
			//System.out.println(email);
			//System.out.println(password);
			PreparedStatement stat = con.prepareStatement(validateUserQry);
                        stat.setInt(1,uid );
			stat.setString(2,GetDetails.getImage(uid));
			stat.setString(3,title);
                        stat.setString(4,description);
                        stat.setString(5,program);
                       
                        stat.executeUpdate();
			
			System.out.println("done");
				
		}
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}  
                

}
}
