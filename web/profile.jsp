<%-- 
    Document   : signup
    Created on : Oct 13, 2024, 6:40:22 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <title>My Profile</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/signup/style.css">
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-6 col-xl-5">
                        <div class="login-wrap p-4 p-md-5">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <span class="fa fa-edit"></span>
                            </div>
                            <h3 class="text-center mb-4">My Profile</h3>
                            <form action="/audio/profile" method="post" class="signup-form">
                                <c:set var="account" value="${sessionScope.account}"></c:set>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Full Name</label>
                                        <input type="text" class="form-control" placeholder="Full Name" name="name" value="${account.name}"  required>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="gender">Gender</label>
                                    <select name="gender" >
                                        <option value="Male" ${account.gender.equals("Male")?"selected":""}>Male</option>
                                        <option value="Female" ${account.gender.equals("Female")?"selected":""}>Female</option>
                                        <option value="Others" ${account.gender.equals("Others")?"selected":""}>Others</option>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="dob">Date of birth</label>
                                    <input type="date" class="form-control" name="dob" value="${account.dob}">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="address">Address</label>
                                    <input type="text" class="form-control" name="address" value="${account.address}">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="phone">Phone Number</label>
                                    <input type="text" class="form-control" name="phone" value="${account.phone}">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="mail">Email</label>
                                    <input type="text" class="form-control" name="mail" value="${account.mail}">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">Update Profile</button>
                                </div>
                                <button style="margin-left: 150px; border: none; background: white"><a href="/audio/home" style="text-decoration: underline">Home</a></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
