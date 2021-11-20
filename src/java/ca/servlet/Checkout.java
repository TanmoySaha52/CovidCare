/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class Checkout extends HttpServlet {

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
       String total = request.getParameter("Total");
       String type = request.getParameter("Type");
        String cp = request.getParameter("CP");
       System.out.println(cp);
        try (PrintWriter out = response.getWriter()) {
           double zeroTotal = Double.parseDouble(total);
           System.out.print(zeroTotal);
           if(zeroTotal<=50 && type.equalsIgnoreCase("Food")){
               out.print("<script>alert('Please Choose item to order!!'); window.location.href='FoodMenu.jsp';</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("FoodMenu.jsp");
                        rd.include(request, response);
           }
           else if(zeroTotal<=20 && type.equalsIgnoreCase("Medical Supplies")){
               out.print("<script>alert('Please Choose item to order!!'); window.location.href='MedicalSupplies.jsp';</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("MedicalSupplies.jsp");
                        rd.include(request, response);
           }else{
           request.setAttribute("total", total);
            request.setAttribute("type", type);
            request.setAttribute("cp", cp);
            RequestDispatcher rd = request.getRequestDispatcher("pay.jsp");
            rd.forward(request, response);
           }
            
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
        processRequest(request, response);
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

}
