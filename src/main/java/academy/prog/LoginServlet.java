package academy.prog;

import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    static final String LOGIN = "admin";
    static final String PASS = "admin";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String ageStr = request.getParameter("age");
        int age = 0;
        if(ageStr != null && !ageStr.equals("")){
            age = Integer.parseInt(ageStr);
        } else {
            ageStr = "0";
        }
        if ( age < 18){
            HttpSession session = request.getSession(true);
            session.setAttribute("user_age", ageStr);
        }else if (LOGIN.equals(login) && PASS.equals(password)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user_login", login);
            session.setAttribute("user_age", ageStr);
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String a = request.getParameter("a");
        HttpSession session = request.getSession(false);

        if ("exit".equals(a) && (session != null))
            session.removeAttribute("user_login");
            session.removeAttribute("user_age");

        response.sendRedirect("index.jsp");
    }
}