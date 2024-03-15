<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <h1>Sign In</h1>

    <p><i>${message}</i></p>
    <form action="login" method="post">
        <input type="hidden" name="action" value="sign">        
        <label class="pad_top">Email:</label>
        <input type="email" name="email" value="${user.email}" 
               required><br>
        <label class="pad_top">Password:</label>
        <input type="password" name="password" value="${user.password}"  
               required><br>        
        <label>&nbsp;</label>
        <input type="submit" value="Submit" class="margin_left">
    </form>
</body>
</html>