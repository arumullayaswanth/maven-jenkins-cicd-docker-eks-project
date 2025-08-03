<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Yash Academy | Learn & Grow</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font and Icons -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      background: #f5f6fa;
      color: #333;
    }

    header {
      background: #1e1e2f;
      color: white;
      padding: 20px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }

    header h1 {
      font-size: 26px;
      margin: 0;
    }

    .social-icons a {
      color: white;
      margin-left: 15px;
      font-size: 20px;
      text-decoration: none;
    }

    .hero {
      background: linear-gradient(to right, #667eea, #764ba2);
      color: white;
      text-align: center;
      padding: 50px 20px 30px;
    }

    .hero h2 {
      font-size: 36px;
      margin-bottom: 10px;
    }

    .hero p {
      font-size: 18px;
    }

    .container {
      max-width: 500px;
      background: white;
      margin: -40px auto 30px;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin: 15px 0 5px;
      font-weight: 500;
    }

    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }

    .registerbtn {
      background: #667eea;
      color: white;
      border: none;
      padding: 12px;
      width: 100%;
      font-size: 16px;
      border-radius: 6px;
      margin-top: 20px;
      cursor: pointer;
      transition: 0.3s ease;
    }

    .registerbtn:hover {
      background: #5a67d8;
    }

    .signin {
      text-align: center;
      margin-top: 20px;
    }

    footer {
      text-align: center;
      padding: 20px;
      background: #1e1e2f;
      color: white;
      font-size: 14px;
    }

    .message {
      text-align: center;
      color: green;
      margin-top: 20px;
    }

    @media (max-width: 600px) {
      .hero h2 {
        font-size: 28px;
      }
      header {
        flex-direction: column;
        text-align: center;
      }
    }
  </style>
</head>
<body>

  <header>
    <h1>Yash Academy</h1>
    <div class="social-icons">
      <a href="https://www.youtube.com/@Yashacademy0" target="_blank" title="YouTube"><i class="fab fa-youtube"></i></a>
      <a href="https://github.com/arumullayaswanth" target="_blank" title="GitHub"><i class="fab fa-github"></i></a>
      <a href="https://www.linkedin.com/in/yaswanth-arumulla/" target="_blank" title="LinkedIn"><i class="fab fa-linkedin"></i></a>
      <a href="https://medium.com/@yaswanth.arumulla" target="_blank" title="Medium"><i class="fab fa-medium"></i></a>
    </div>
  </header>

  <div class="hero">
    <h2>Learn. Build. Grow.</h2>
    <p>Join our community of developers and learners 🚀</p>
  </div>

  <form id="registrationForm">
    <div class="container">
      <h3 style="text-align:center;">Register Now</h3>
      <label for="Name">Full Name</label>
      <input type="text" id="Name" name="Name" required>

      <label for="mobile">Mobile Number</label>
      <input type="text" id="mobile" name="mobile" required>

      <label for="email">Email Address</label>
      <input type="text" id="email" name="email" required>

      <label for="psw">Password</label>
      <input type="password" id="psw" name="psw" required>

      <label for="psw-repeat">Repeat Password</label>
      <input type="password" id="psw-repeat" name="psw-repeat" required>

      <p style="font-size:13px; margin-top:10px;">By registering, you agree to our <a href="#">Terms & Conditions</a>.</p>

      <button type="submit" class="registerbtn">Register</button>

      <div class="message" id="message"></div>
    </div>

    <div class="container signin">
      <p>Already have an account? <a href="#">Sign in</a>.</p>
    </div>
  </form>

  <footer>
    <p>📢 Don’t forget to <strong>Subscribe</strong> on YouTube and <strong>Follow</strong> me on GitHub, LinkedIn, and Medium!</p>
    <p>© 2025 Yaswanth Arumulla | All Rights Reserved</p>
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
        alert("Passwords do not match!");
        return;
      }

      document.getElementById("message").innerText = "🎉 Welcome " + name + "! You're registered successfully.";
      document.getElementById("registrationForm").reset();
    });
  </script>

</body>
</html>
