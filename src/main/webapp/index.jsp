<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Prog Academy</title>
  </head>
  <body>
    <% String login = (String)session.getAttribute("user_login");
       String age = (String)session.getAttribute("user_age");
       String badPsw = (String)session.getAttribute("bad_password"); %>

    <% if (age != null && Integer.parseInt(age) < 18 && Integer.parseInt(age) > 0){ %>
        <h1>Your age is < 18 !</h1>
        <br>Try again <a href="/login?a=exit">Ok</a>

    <% } else if (badPsw != null && badPsw.equals("yes")){ %>
        <h3>The password must be at least 8 characters long,
        <br>contain at least 1 uppercase letter, 1 lowercase letter,
        <br>1 special character and 1 number!</h3>
    <br>Try again <a href="/login?a=exit">Ok</a>
    <% } else if (login == null || "".equals(login)) { %>
        <form action="/login" method="POST">
            Login: <input type="text" name="login"><br>
            Password: <input type="password" name="password"><br>
            Age: <input type="text" name="age"><br>
            <input type="submit" />
        </form>
    <% } else { %>
        <h1>You are logged in as: <%= login %></h1>
        <br>Click this link to <a href="/login?a=exit">logout</a>
    <% } %>
  </body>
</html>