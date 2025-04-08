/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import Others.Tools;
import dal.BrandDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;
import model.Product;

/**
 *
 * @author HP
 */
@WebServlet(name="Shop", urlPatterns={"/shop"})
public class Shop extends HttpServlet {
   
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
            out.println("<title>Servlet Shop</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Shop at " + request.getContextPath () + "</h1>");
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
        BrandDAO bdao = new BrandDAO();
        List<Brand> bList = bdao.getAllBrand();
        request.setAttribute("bList", bList);
        String keyword = request.getParameter("keyword");
        String category_ID = request.getParameter("category_ID");
        request.setAttribute("category_ID", category_ID);
        String sortby = request.getParameter("sortby");
        String price = request.getParameter("price");
        request.setAttribute("price", price);
        String brand_ID = request.getParameter("brand_ID");
        request.setAttribute("brand_ID", brand_ID);
        ProductDAO pdao = new ProductDAO();
        List<Product> pList = pdao.selectProductsWithConditions(keyword, category_ID,brand_ID, price, sortby);
        request.setAttribute("pList", pList);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
//    public static void main(String[] args) {
//        ProductDAO pdao = new ProductDAO();
//        List<Product> pList = pdao.getAllProduct();
//        for (Product product : pList) {
//            System.out.println(product);
//        }
//    }
}
