package murach.data;

import java.sql.*;
import java.util.ArrayList;

import murach.business.Product;

public class ProductDB {

    
    public static ArrayList<Product> getProducts() {
  
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Book ";
             
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Product> products;
             products = new ArrayList<Product> ();
            Product product;
            if (rs.next()) {
               product = new Product();
                product.setCover(rs.getString("Cover"));
                product.setTitle(rs.getString("Title"));
                product.setPrice(rs.getDouble("Price"));
                product.setCode(rs.getString("ProductCode"));
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
     public static Product getProduct(String code) {
  
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Book WHERE ProductCode = ?";
             
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, code);
            rs = ps.executeQuery();
            
            Product product = new Product();
            if (rs.next()) {
               
                product.setCover(rs.getString("Cover"));
                product.setTitle(rs.getString("Title"));
                product.setPrice(rs.getDouble("Price"));
                product.setCode(rs.getString("ProductCode"));
               
            }
            return product;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    public static String getHtmlTable()
            throws SQLException {
         ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
         Statement statement = connection.createStatement();
         ResultSet results = statement.executeQuery("select * from Book");
        StringBuilder htmlTable = new StringBuilder();
        ResultSetMetaData metaData = results.getMetaData();
        int columnCount = metaData.getColumnCount();

        htmlTable.append("<table>");

        // add header row
        htmlTable.append("<tr>");
        for (int i = 2; i <= columnCount-1; i++) {
            htmlTable.append("<th>");
            htmlTable.append(metaData.getColumnName(i));
            htmlTable.append("</th>");
        }
        htmlTable.append("</tr>");

        // add all other rows
        while (results.next()) {
            htmlTable.append("<tr>");
       
                htmlTable.append("<td>");
                htmlTable.append("<img src=\"");
                htmlTable.append(results.getString(2)); 
                htmlTable.append("\" width=150 height=300>");
                htmlTable.append("</td>");
            for (int i = 3; i < columnCount; i++) {
                htmlTable.append("<td>");
                htmlTable.append(results.getString(i));
                htmlTable.append("</td>");
            }
            htmlTable.append( "<td><form action=\"cart\" method=\"post\"> <input type=\"hidden\" name=\"productCode\" value=\"");
            htmlTable.append(results.getString(5));
            htmlTable.append("\"> <input type=\"submit\" value=\"Add To Cart\"></form></td>");
            htmlTable.append("</tr>");
        }

        htmlTable.append("</table>");
        return htmlTable.toString();
    }
}