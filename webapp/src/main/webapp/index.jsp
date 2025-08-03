<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Yash Academy Registration</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    .container {
      background-color: #fff;
      margin: 50px auto;
      padding: 30px;
      border-radius: 10px;
      width: 400px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h1 {
      text-align: center;
      color: #333;
    }

    label {
      display: block;
      margin-top: 15px;
      font-weight: bold;
    }

    input[type=text], input[type=password] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .registerbtn {
      background-color: #4CAF50;
      color: white;
      padding: 12px;
      margin-top: 20px;
      width: 100%;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }

    .registerbtn:hover {
      background-color: #45a049;
    }

    .signin {
      text-align: center;
      margin-top: 20px;
    }

    a {
      color: #4CAF50;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    hr {
      margin-top: 20px;
      margin-bottom: 20px;
    }

    .message {
      text-align: center;
      font-weight: bold;
      color: green;
      margin-top: 20px;
    }
  </style>
</head>
<body>

  <form id="registrationForm">
    <div class="container">
      <h1>Welcome to Yash Academy YouTube Channel</h1>
      <p>Please fill in this form to create an account.</p>
      <hr>

      <label for="Name"><b>Enter Name</b></label>
      <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>

      <label for="mobile"><b>Enter Mobile</b></label>
      <input type="text" placeholder="Enter Mobile Number" name="mobile" id="mobile" required>

      <label for="email"><b>Enter Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" id="email" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

      <label for="psw-repeat"><b>Repeat Password</b></label>
      <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>

      <hr>
      <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
      <button type="submit" class="registerbtn">Register</button>
    </div>

    <div class="container signin">
      <p>Already have an account? <a href="#">Sign in</a>.</p>
    </div>

    <div class="message" id="message"></div>

    <h1 style="text-align:center;">Thank You, Happy Learning</h1>
    <h1 style="text-align:center;">See You Again</h1>
  </form>

  <script>
    document.getElementById("registrationForm").addEventListener("submit", function(event) {
      event.preventDefault();

      const name = document.getElementById("Name").value;
      const mobile = document.getElementById("mobile").value;
      const email = document.getElementById("email").value;
      const password = document.getElementById("psw").value;
      const repeatPassword = document.getElementById("psw-repeat").value;

      if (password !== repeatPassword) {
        alert("Passwords do not match!");
        return;
      }

      document.getElementById("message").innerText = "Registration successful! Welcome, " + name + " 🎉";
      document.getElementById("registrationForm").reset();
    });
  </script>

</body>
</html>
