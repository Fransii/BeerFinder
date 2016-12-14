package com.beerfinder.Registration;

import com.beerfinder.DataBaseUtilities.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by franciszekdanes on 13.12.2016.
 */
@WebServlet(name = "RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher;

        Map<String, String> errors = new HashMap<String, String>();

        UserDAO userDAO = new UserDAO();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(userDAO.addUser(firstName,lastName,email,password))
        {
            dispatcher = request.getRequestDispatcher("WEB-INF/welcomePage.jsp");
        }else
        {
            errors.put("email", "Email already exist!");
            dispatcher = request.getRequestDispatcher("WEB-INF/registrationPage.jsp");
        }
        request.setAttribute("errors",errors);
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
