<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Yash Academy - Learn, Grow, Excel</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #667eea, #764ba2);
      margin: 0;
      padding: 0;
    }

    header {
      background-color: white;
      padding: 20px;
      text-align: center;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    header h1 {
      margin: 0;
      font-size: 28px;
      color: #333;
    }

    .socials {
      margin-top: 10px;
    }

    .socials a {
      margin: 0 10px;
      text-decoration: none;
      color: #555;
      font-size: 24px;
      transition: color 0.3s;
    }

    .socials a:hover {
      color: #4CAF50;
    }

    .container {
      background-color: white;
      max-width: 500px;
      margin: 30px auto;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.2);
    }

    h2 {
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
      margin-top: 6px;
      border: 1px solid #ccc;
      border-radius: 5px;
      transition: 0.3s;
    }

    input[type=text]:focus, input[type=password]:focus {
      border-color: #667eea;
      box-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
      outline: none;
    }

    .registerbtn {
      background-color: #667eea;
      color: white;
      padding: 12px;
      margin-top: 20px;
      width: 100%;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .registerbtn:hover {
      background-color: #5a67d8;
    }

    .signin {
      text-align: center;
      margin-top: 25px;
    }

    a {
      color: #667eea;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    hr {
      margin: 20px 0;
    }

    .message {
      text-align: center;
      font-weight: bold;
      color: green;
      margin-top: 20px;
    }

    footer {
      text-align: center;
      margin-top: 50px;
      color: white;
      font-size: 18px;
    }

    .subscribe {
      text-align: center;
      margin-top: 30px;
      color: white;
      font-size: 20px;
      font-weight: bold;
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <header>
    <h1>Yash Academy - Empower Your Learning Journey</h1>
    <div class="socials">
      <a href="https://www.youtube.com/@Yashacademy0" target="_blank" title="YouTube"><i class="fab fa-youtube"></i></a>
      <a href="https://github.com/arumullayaswanth" target="_blank" title="GitHub"><i class="fab fa-github"></i></a>
      <a href="https://www.linkedin.com/in/yaswanth-arumulla/" target="_blank" title="LinkedIn"><i class="fab fa-linkedin"></i></a>
      <a href="https://medium.com/@yaswanth.arumulla" target="_blank" title="Medium"><i class="fab fa-medium"></i></a>
    </div>
  </header>

  <div class="subscribe">
    📢 Don't forget to <strong>Subscribe</strong> on YouTube and <strong>Follow</strong> me on GitHub, LinkedIn, and Medium!
  </div>

  <form id="registrationForm">
    <div class="container">
      <h2>Register for Free Learning Resources</h2>
      <p>Please fill in this form to create your account.</p>
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

      <div class="message" id="message"></div>
    </div>

    <div class="container signin">
      <p>Already have an account? <a href="#">Sign in</a>.</p>
    </div>
  </form>

  <footer>
    <p>Thank You 🙏 — Keep Learning with Yash Academy!</p>
  </footer>

  <script>
    document.getElementById("registrationForm").addEventListener("submit", function(event) {
      event.preventDefault();

      const name = document.getElementById("Name").value;
      const mobile = document.getElementById("mobile").value;
      const email = document.getElementById("email").value;
      const password = document.getElementById("psw").value;
      const repeatPassword = document.getElementById("psw-repeat").value;

      if (password !== repeatPassword) {
        alert("❌ Passwords do not match!");
        return;
      }

      document.getElementById("message").innerText = "🎉 Registration successful! Welcome, " + name + "!";
      document.getElementById("registrationForm").reset();
    });
  </script>

</body>
</html>
