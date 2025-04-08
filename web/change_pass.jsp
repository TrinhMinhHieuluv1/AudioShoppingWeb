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
        <title>Change Pass</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/signup/style.css">

        <script>

            function checkConfirmPassword() {
                const password = document.getElementById('new-password').value;
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
                            <form action="/audio/change_pass" method="post" class="signup-form">
                                <h3 style="color: red">${requestScope.err}</h3>
                                <div class="form-group mb-3">
                                    <label class="label" for="username">Username</label>
                                    <input type="text" class="form-control" name="username" value="${sessionScope.account.username}" readonly>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="password">Old Password</label>
                                    <input type="password" id="password" class="form-control password-field" placeholder="Old Password" name="password" required>
                                    <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password" onclick="togglePassword('password')"></span>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="new-password">New Password</label>
                                    <input type="password" id="new-password" class="form-control password-field" placeholder="New Password" name="new-password" required>
                                    <span toggle="#new-password" class="fa fa-fw fa-eye field-icon toggle-password" onclick="togglePassword('new-password')"></span>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="label" for="confirm-password">Confirm Password</label>
                                    <input type="password" id="confirm-password" class="form-control password-field" placeholder="Confirm Password" name="confirm-password" oninput="checkConfirmPassword()"x required>
                                    <span toggle="#confirm-password" class="fa fa-fw fa-eye field-icon toggle-password" onclick="togglePassword('confirm-password')"></span>
                                </div>
                                <div id="err-confirm-password" style="color: red; display: none">Confirm Password is incorrect. Try again!</div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">Change</button>
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
