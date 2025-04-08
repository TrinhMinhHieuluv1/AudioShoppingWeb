/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;
import java.sql.Date;

/**
 *
 * @author HP
 */
@WebServlet(name="SignUp", urlPatterns={"/signup"})
public class SignUp extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet Register</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        List<User> uList = udao.getAllUser();
        request.setAttribute("uList", uList);
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob_raw = request.getParameter("dob");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        Date dob = null;
        if(dob_raw != null && !dob_raw.isEmpty()) {
            dob = Date.valueOf(dob_raw);
        }
        UserDAO udao = new UserDAO();
        for (User user : udao.getAllUser()) {
            if (user.getUsername().equals(username)) {
                String err_username = "This username is existed. Try again!";
                request.setAttribute("err_username", err_username);
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                request.setAttribute("name", name);
                request.setAttribute("gender", gender);
                request.setAttribute("dob", dob);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.setAttribute("mail", mail);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }
        }
        User userToAdd = new User(username, password, name, gender, dob, address, phone, mail, "", false, 0);
        udao.addUser(userToAdd);
        HttpSession session = request.getSession();
        session.setAttribute("account", userToAdd);
        response.sendRedirect("/audio/home");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
