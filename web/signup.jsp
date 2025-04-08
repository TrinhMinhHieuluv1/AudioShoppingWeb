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
        <title>Sign Up</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/signup/style.css">

        <script>

            function checkConfirmPassword() {
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirm-password').value;
                const err = document.getElementById('err-confirm-password');
                if (password !== confirmPassword) {
                    err.style.display = 'block';
                } else {
                    err.style.display = 'none';
                }
            }

            function togglePassword(id) {
                const passwordField = document.getElementById(id);
                const passwordFieldType = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordField.setAttribute('type', passwordFieldType);
                const eyeIcon = event.target;
                eyeIcon.classList.toggle('fa-eye');
                eyeIcon.classList.toggle('fa-eye-slash');
            }
        </script>
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
                            <h3 class="text-center mb-4">Create Your Account</h3>
                            <form action="/audio/signup" method="post" class="signup-form">
                                <div class="form-group mb-3">
                                    <label class="label" for="username">Username</label>
                                    <input type="text" class="form-control" placeholder="Username" name="username" value="${requestScope.username}" required">
                                </div>
                                <div style="color: red">${requestScope.err_username}</div>
                                <div class="form-group mb-3">
                                    <label class="label" for="password">Password</label>
                                    <input type="password" id="password" class="form-control password-field" placeholder="Password" name="password" value="${requestScope.password}" required>
                                    <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password" onclick="togglePassword('password')"></span>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="confirm-password">Confirm Password</label>
                                    <input type="password" id="confirm-password" class="form-control password-field" placeholder="Confirm Password" name="confirm-password" oninput="checkConfirmPassword()" value="${requestScope.password}"  required>
                                    <span toggle="#confirm-password" class="fa fa-fw fa-eye field-icon toggle-password" onclick="togglePassword('confirm-password')"></span>
                                </div>
                                <div id="err-confirm-password" style="color: red; display: none">Confirm Password is incorrect. Try again!</div>
                                <div class="form-group mb-3">
                                    <label class="label" for="name">Full Name</label>
                                    <input type="text" class="form-control" placeholder="Full Name" name="name" value="${requestScope.name}"  required>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="gender">Gender</label>
                                    <select name="gender" >
                                        <option value="Male" ${requestScope.gender.equals("Male")?"selected":""}>Male</option>
                                        <option value="Female" ${requestScope.gender.equals("Female")?"selected":""}>Female</option>
                                        <option value="Others" ${requestScope.gender.equals("Others")?"selected":""}>Others</option>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="dob">Date of birth</label>
                                    <input type="date" class="form-control" name="dob" value="${requestScope.dob}">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="address">Address</label>
                                    <input type="text" class="form-control" name="address" value="${requestScope.address}">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="phone">Phone Number</label>
                                    <input type="text" class="form-control" name="phone" value="${requestScope.phone}">
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="mail">Email</label>
                                    <input type="text" class="form-control" name="mail" value="${requestScope.mail}">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
                                </div>
                            </form>
                            <p>I'm already a member! <a data-toggle="tab" href="/audio/signin">Sign In</a></p>
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
