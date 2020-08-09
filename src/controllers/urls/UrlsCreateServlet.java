package controllers.urls;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Url;
import models.User;
import models.validators.UrlValidator;
import utils.DBUtil;

/**
 * Servlet implementation class UrlsCreateServlet
 */
@WebServlet("/urls/create")
public class UrlsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UrlsCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Url u = new Url();

            u.setUser((User)request.getSession().getAttribute("login_user"));

            Date create_date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("url_date");
            if(rd_str != null && !rd_str.equals("")) {
                create_date = Date.valueOf(request.getParameter("url_date"));
            }
            u.setCreate_date(create_date);
            u.setContent(request.getParameter("content"));
            u.setUrl(request.getParameter("url"));
            List<String> errors = UrlValidator.validate(u);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("url", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/urls/new.jsp");
                rd.forward(request, response);

            } else {
                em.getTransaction().begin();
                em.persist(u);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");
                response.sendRedirect("/url_system/users/mypage?id=" + u.getId());
            }


    }
    }
}
