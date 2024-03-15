package murach.Servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;

public class LoginServlet extends HttpServlet {

 @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/checkout.html";
        
        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // perform action and set URL to appropriate page
        if (action.equals("join")) {
            url = "/checkout.jsp";    // the "join" page
        } 
            else if (action.equals("sign")) {
            // get parameters from the request

            String email = request.getParameter("email");
            String password = request.getParameter("password"); 
                User user = new User();
            
            // validate the parameters
            String message;
            if (!UserDB.emailExists(email)) {
                url = "/register.jsp";
            }
            else
             if (!UserDB.signIn(email, password)){
                message = "This password is not correct."
                        +"Please, Try Again!";
                url = "/checkout.jsp";
               request.setAttribute("message", message);
            }
            else
             {
                user =  UserDB.selectUser(email);
                request.setAttribute("user", user);
                 url = "/thanks.jsp";
             }
          
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);  
}
}