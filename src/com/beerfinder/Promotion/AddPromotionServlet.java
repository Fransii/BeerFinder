package com.beerfinder.Promotion;

import com.beerfinder.DataBaseUtilities.PromotionDAO;
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
 * Created by franciszekdanes on 15.12.2016.
 */
@WebServlet(name = "AddPromotionServlet")
public class AddPromotionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher;

        Map<String, String> errors = new HashMap<String, String>();

        PromotionDAO promotionDAO = new PromotionDAO();

        HttpSession session = request.getSession(false);

        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String coordX = request.getParameter("coordX");
        String coordY = request.getParameter("coordY");
        String storeName = request.getParameter("storeName");
        String beerName = request.getParameter("beerName");
        String beerCapacity = request.getParameter("beerCapacity");
        String beerpackage = request.getParameter("beerPackage");
        String beerPrice = request.getParameter("beerPrice");
        String city = request.getParameter("city");
        String postCode = request.getParameter("postCode");
        String street = request.getParameter("street");
        String buildNumber = request.getParameter("buildNumber");
        int idUser = (Integer) session.getAttribute("userId");


        if(promotionDAO.addPromotion(startDate,endDate,idUser,
                coordX,coordY,storeName,
                beerName,beerCapacity,beerpackage,
                beerPrice,city,postCode,
                street,buildNumber))
        {
            response.sendRedirect("/AddPromotionResultServlet");
            return;
        }else
        {
            errors.put("blad", "Cos zle!");
            dispatcher = request.getRequestDispatcher("WEB-INF/addPromotionPage.jsp");
        }
        request.setAttribute("errors",errors);
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
