/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.User;
import dto.UserErrorHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author toan0
 */
@WebServlet(name = "CreateServlet", urlPatterns = {"/CreateServlet"})
public class CreateServlet extends HttpServlet {

    private final String SUCCESS = "login.jsp";
    private final String FAIL = "createuser.jsp";

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
        String url = FAIL;
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirm_password");

            UserErrorHandler userError = new UserErrorHandler();
          
           
            boolean check = true;
            if (userID.length() > 10 || userID.length() < 5) {
                userError.setUserIDError("UserName must be [5-10]");
                check = false;
            }

//            if (!password.matches(".*#.*[0-9].*")) {
//                userError.setPasswordError("Password must have 1 char # and 1 digit");
//                check = false;
//            }
            if (!password.equals(confirmPassword)) {
                userError.setConfirmPasswordError("2 Password is not the same");
                check = false;
            }
            if (check) {
                User user = new User(userID, fullName, password, roleID);
               request.setAttribute("user",  UserDAO.findAUserByID(userID));
                if (UserDAO.checkDupplicate(userID)) {
                    userError.setUserIDError("DUPPLICATE USERNAME: " + userID + " !");
                    request.setAttribute("USER_ERROR", userError);
                } else {

                    if (UserDAO.CreateUser(user)) {
                        url = SUCCESS;
                    } else {
                        request.setAttribute("USER_ERROR", "Can not insert!!!");
                    }
                }
            } else {

                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("ERROR AT CREATE CONTROLLER: " + e.toString());
        } finally {
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
