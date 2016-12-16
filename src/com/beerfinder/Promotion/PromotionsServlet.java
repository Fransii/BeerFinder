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
@WebServlet(name = "PromotionsServlet")
public class PromotionsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/promotionsPage.jsp");


        ArrayList<Promotion> promotions = new ArrayList<Promotion>();

        PromotionDAO promotionDAO = new PromotionDAO();

        if(request.getParameter("ALL") != null){
            promotions = promotionDAO.getAllPromotions();
        }else
        {
            promotions = promotionDAO.getSpecificPromotion(request.getParameter("city"));
        }

        request.setAttribute("promotions",promotions);
        dispatcher.forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
