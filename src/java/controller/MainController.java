/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author toan0
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
private final String LOGIN_CONTROLLER = "LoginServlet";
private final String LOGINGOOGLE_CONTROLLER = "LoginGoogleServlet";
private final String LOGOUT_CONTROLLER = "LogoutServlet";
private final String SEARCH_CONTROLLER = "SearchServlet";
private final String DELETE_CONTROLLER = "DeleteServlet";
private final String UPDATE_CONTROLLER = "UpdateServlet";   
private final String CREATE_CONTROLLER = "CreateServlet";   
private final String VIEW_PRODUCT_CATEGORY = "CategoryServlet";   
private final String VIEW_PRODUCT_DETAIL = "ProductDetailServlet";   
private final String SEARCH_PRODUCT = "SearchProductServlet";   
private final String ADD_NEW_PRODUCT = "AddNewProductServlet";   
private final String ADD_TO_CART = "CartServlet";   
private final String ERROR_PAGE = "login.jsp";

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
        String action = request.getParameter("action");
        String url = ERROR_PAGE;
        try {
            if(action.equals("Login")){
             url = LOGIN_CONTROLLER;   
            }else if(action.equals("Login Google")){
                url = LOGINGOOGLE_CONTROLLER;
            }
            
            else if(action.equals("Logout")){
                url = LOGOUT_CONTROLLER;
            }
            else if(action.equals("Search")){
                url = SEARCH_CONTROLLER;
            }else if(action.equals("Delete")){
                url = DELETE_CONTROLLER;
            }
            else if(action.equals("Update")){
                url = UPDATE_CONTROLLER;
            }else if(action.equals("Create")){
                url = CREATE_CONTROLLER;
            }
            else if(action.equals("viewProductfollowingCategory")){
                url = VIEW_PRODUCT_CATEGORY;
            }else if(action.equals("viewproductdetail")){
                url = VIEW_PRODUCT_DETAIL;
            }else if(action.equals("search")){
                url = SEARCH_PRODUCT;
            }else if(action.equals("Add")){
                url = ADD_NEW_PRODUCT;
            }else if(action.equals("addtocart")){
                url = ADD_TO_CART;
            }
        } catch (Exception e) {
            log("SORRY SOMETHING WENT WRONG!!!");
            e.printStackTrace();
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
