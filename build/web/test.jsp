<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
         
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ví Dụ Sử Dụng Hàm Trong JSP</title>
</head>
<body>
    <%
        // Định nghĩa hàm để lấy thời gian hiện tại
        String getCurrentTime() {
            Date date = new Date();
            return date.toString();
        }
    %>

    <h1>Thời gian hiện tại:</h1>
    <p><%= getCurrentTime() %></p> <!-- Sử dụng hàm để in thời gian -->
    
    <h2>Ví dụ khác với hàm</h2>
    <%
        // Định nghĩa một hàm khác để tính tổng hai số
        int add(int a, int b) {
            return a + b;
        }
        
        // Sử dụng hàm add
        int sum = add(5, 10);
    %>
    <p>Tổng của 5 và 10 là: <%= sum %></p> <!-- In kết quả của hàm add -->
</body>
</html>