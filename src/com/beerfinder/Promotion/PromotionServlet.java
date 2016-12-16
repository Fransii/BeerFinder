package com.beerfinder.Promotion;

import com.beerfinder.Beans.Promotion;
import com.beerfinder.DataBaseUtilities.PromotionDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by franciszekdanes on 16.12.2016.
 */
@WebServlet(name = "PromotionServlet")
public class PromotionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/promotionPage.jsp");

        PromotionDAO promotionDAO = new PromotionDAO();
        Promotion promotion = null;
        promotion = promotionDAO.getPromotionById(Integer.parseInt(request.getParameter("promotionId")));

        request.setAttribute("promotion",promotion);
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
