package com.beerfinder.Login;

import com.beerfinder.DataBaseUtilities.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by franciszekdanes on 13.12.2016.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        Map<String, String> errors = new HashMap<String, String>();
        RequestDispatcher dispatcher;
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(userDAO.isUserValid(email,password))
        {
            HttpSession session = request.getSession();
            session.setAttribute("email",email);
            response.sendRedirect("/MainPageServlet");
            return;
        }else if(userDAO.isEmailUsed(email)){
            errors.put("wrong", "Wrong email or password!");
            dispatcher = request.getRequestDispatcher("WEB-INF/loginPage.jsp");
        }else{
            errors.put("error", "user not exist!");
            dispatcher = request.getRequestDispatcher("WEB-INF/loginPage.jsp");
        }
        request.setAttribute("errors",errors);
        dispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
