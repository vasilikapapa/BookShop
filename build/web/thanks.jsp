<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Homework 5</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>

<body>
  <h1>Thanks for your order</h1>

<p>Here is the information that you entered:</p>
<label>Email:</label>
<span>${user.email}</span><br>
<label>Name:</label>
<span>${user.firstName}</span><br>

<h1>Your cart</h1>

<table>
  <tr>
    <th>Cover</th>
    <th>Title</th>
    <th>Price</th>
    <th>Amount</th>
     <th>Quantity</th>
     <th></th>
  </tr>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="item" items="${cart.items}">
  <tr>
    
    <td><img src="${item.product.cover}" alt="${item.product.title} book cover" width="200" height="200"> </td>
     <td>${item.product.title}</td>
    <td>${item.product.priceCurrencyFormat}</td>
    <td>${item.totalCurrencyFormat}</td>
    
    <td>
      <form action="" method="post">
        <input type="hidden" name="productCode" value="${item.product.code}">
        <input type=text name="quantity" value="${item.quantity}" id="quantity">
        <input type="submit" value="Update">
      </form>
    </td>
    <td>
      <form action="" method="post">
        <input type="hidden" name="productCode" 
               value="${item.product.code}">
        <input type="hidden" name="quantity" 
               value="0">
        <input type="submit" value="Remove Item">
      </form>
    </td>
  </tr>
</c:forEach>
</table>
   

    

</body>
</html>