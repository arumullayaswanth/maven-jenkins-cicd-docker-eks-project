<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Yash Academy – Learn, Grow, Excel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- FontAwesome for social icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Inter:400,600,800&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary: #6366f1;
      --primary-dark: #4338ca;
      --accent: #a21caf;
      --white: #fff;
      --gray-bg: #f4f4fa;
      --shadow: 0 8px 32px rgba(60, 0, 100, 0.10);
    }
    body {
      font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(110deg, #6366f1 0%, #a21caf 100%);
      margin: 0;
      min-height: 100vh;
      padding: 0;
    }
    header {
      background: rgba(255,255,255,0.87);
      box-shadow: var(--shadow);
      padding: 36px 0 22px 0;
      border-radius: 0 0 24px 24px;
      text-align: center;
      margin-bottom: 18px;
      animation: fadeInDown 1s both;
    }
    @keyframes fadeInDown {
      from { opacity:0; transform: translateY(-40px);}
      to { opacity:1; transform: translateY(0);}
    }
    header h1 {
      font-size: 2.2rem;
      font-weight: 800;
      margin: 0;
      color: var(--primary-dark);
      background: linear-gradient(90deg, #6366f1 40%, #a21caf 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .socials {
      margin-top: 10px;
    }
    .socials a {
      margin: 0 7px;
      color: var(--primary-dark);
      font-size: 1.6rem;
      background: #efeffa;
      border-radius: 50%;
      padding: 10px;
      transition: background 0.3s, color 0.3s, transform 0.2s;
      box-shadow: 0 2px 8px #a21caf11;
      display: inline-block;
    }
    .socials a:hover {
      background: var(--primary);
      color: #fff;
      transform: scale(1.11) translateY(-2px);
    }
    .promo-section {
      background: rgba(255,255,255,0.93);
      margin: 30px auto 10px auto;
      max-width: 920px;
      border-radius: 16px;
      padding: 30px 30px 30px 30px;
      box-shadow: var(--shadow);
      text-align: center;
    }
    .promo-section h2 {
      color: var(--primary-dark);
      font-size: 2rem;
      font-weight: 700;
    }
    .promo-section p {
      color: #432a6e;
      font-size: 1.16rem;
      margin: 18px 0;
      font-weight: 500;
    }
    .promo-section ul {
      text-align: left;
      display: inline-block;
      margin-top: 14px;
      margin-bottom: 14px;
      color: #3d376e;
      padding: 0 20px;
      font-size: 1.13rem;
      font-weight: 600;
    }
    .promo-section ul li {
      margin-bottom: 8px;
      font-weight: 500;
      list-style: "✓ ";
    }
    .promo-actions {
      margin-top: 20px;
    }
    .promo-actions a {
      display: inline-block;
      margin: 0 8px;
      padding: 13px 35px;
      font-size: 1.18rem;
      font-weight: 700;
      background: linear-gradient(93deg, var(--primary) 70%, var(--accent) 100%);
      color: #fff;
      border-radius: 9px;
      box-shadow: 0 4px 16px #a21caf22, 0 3px var(--primary-dark);
      text-decoration: none;
      transition: background 0.2s, transform 0.07s;
    }
    .promo-actions a:hover {
      background: var(--accent);
      color: #f9f7fd;
      transform: scale(1.04);
    }
    .promo-images {
      margin: 23px auto 14px auto;
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 18px 26px;
    }
    .promo-images img {
      width: 125px;
      height: 90px;
      border-radius: 10px;
      box-shadow: 0 1px 10px #b86ad844;
      object-fit: cover;
      background: #f4f4fa;
    }

    .subscribe {
      text-align: center;
      margin-bottom: 22px;
      color: #fff;
      font-size: 1.17rem;
      font-weight: 600;
      letter-spacing: 0.03em;
      text-shadow: 0 2px 8px #432a6e66;
      background: rgba(60,0,100,0.08);
      border-radius: 10px;
      padding: 15px 0;
    }
    .container {
      background: var(--white);
      max-width: 420px;
      margin: 28px auto 0 auto;
      border-radius: 16px;
      box-shadow: var(--shadow);
      padding: 38px 32px 25px 32px;
      animation: fadeInUp 1.1s both;
    }
    @keyframes fadeInUp {
      from { opacity:0; transform: translateY(34px);}
      to { opacity:1; transform: none;}
    }
    h2 {
      color: var(--primary-dark);
      font-size: 1.38rem;
      font-weight: 700;
      margin-bottom: 8px;
      letter-spacing: 0.02em;
      text-align: center;
    }
    p {
      color: #686eaa;
      text-align: center;
      font-size: 1rem;
      margin-bottom: 16px;
    }
    label {
      display: block;
      margin-top: 14px;
      font-weight: 600;
      color: #3d376e;
      letter-spacing: 0.01em;
      font-size: 1rem;
    }
    input[type=text], input[type=password] {
      width: 100%;
      background: var(--gray-bg);
      border: 1.5px solid #d1d9fc;
      border-radius: 7px;
      padding: 9.5px 13px;
      margin-top: 7px;
      font-size: 1rem;
      transition: border 0.35s;
      box-sizing: border-box;
      font-family: inherit;
    }
    input:focus {
      outline: none;
      border: 2px solid var(--accent);
      background: #eae6fc;
    }
    hr {
      margin: 1.5em 0;
      border: none;
      border-bottom: 1.5px solid #e0e0fa;
    }
    .registerbtn {
      margin-top: 22px;
      width: 100%;
      padding: 13px 0;
      background: linear-gradient(93deg, var(--primary) 70%, var(--accent) 100%);
      color: #fff;
      font-weight: 700;
      font-size: 1.18rem;
      border: none;
      border-radius: 8px;
      box-shadow: 0 4px 16px #a21caf22, 0 3px var(--primary-dark);
      cursor: pointer;
      transition: transform 0.06s cubic-bezier(.7,2,0,1), box-shadow 0.16s, background 0.26s;
      will-change: transform, box-shadow;
      font-family: inherit;
      letter-spacing: 0.03em;
      position: relative;
    }
    .registerbtn:active {
      transform: translateY(4px) scale(0.97);
      box-shadow: 0 1px 4px #764ba244, 0 0px var(--primary-dark);
      filter: brightness(0.98);
    }
    .registerbtn:focus {
      outline: 2px solid var(--accent);
    }
    .message {
      text-align: center;
      color: #34a853;
      margin-top: 20px;
      font-weight: 800;
      letter-spacing: 0.01em;
      font-size: 1.08rem;
      min-height: 1.1em;
    }
    .container.signin {
      margin-top: 20px;
      background: none;
      box-shadow: none;
      padding: 0;
      text-align: center;
    }
    .container.signin p,a {
      color: var(--primary-dark);
      font-size: 1.04rem;
      font-weight: 500;
      letter-spacing: 0.01em;
    }
    .container.signin a:hover {
      text-decoration: underline;
      color: var(--accent);
    }
    footer {
      text-align: center;
      color: #fff;
      margin-top: 70px;
      font-size: 1.13rem;
      text-shadow: 0 2px 14px #4a247a66;
      font-weight: 600;
      letter-spacing: 0.03em;
      margin-bottom: 10px;
    }
    @media (max-width: 600px) {
      .container { max-width: 94vw; padding: 21px 6vw;}
      header { padding: 25px 0 13px 0; border-radius: 0 0 13px 13px;}
      h2 { font-size: 1.04rem;}
      .promo-section { padding:14px 4vw; }
      .promo-section h2 { font-size: 1.16rem;}
      .promo-section ul { font-size: .98rem;}
      .promo-actions a { font-size:.97rem; padding:9px 17px;}
      .promo-images img { width:74px; height:52px;}
    }
  </style>
</head>
<body>
  <!-- HEADER -->
  <header>
    <h1>Yash Academy – Empower Your Learning Journey</h1>
    <div class="socials">
      <a href="https://www.youtube.com/@Yashacademy0" target="_blank" title="YouTube"><i class="fab fa-youtube"></i></a>
      <a href="https://github.com/arumullayaswanth" target="_blank" title="GitHub"><i class="fab fa-github"></i></a>
      <a href="https://www.linkedin.com/in/yaswanth-arumulla/" target="_blank" title="LinkedIn"><i class="fab fa-linkedin"></i></a>
      <a href="https://medium.com/@yaswanth.arumulla" target="_blank" title="Medium"><i class="fab fa-medium"></i></a>
    </div>
  </header>

  <!-- PROMOTIONAL SECTION -->
  <div class="promo-section">
    <h2>🔥 Join Our YouTube Channel: <span style="color:#e52d27;"><i class="fab fa-youtube"></i> Yash Academy</span> 🔥</h2>
    <p>
      <b>Master DevOps, AWS, and Cloud Technologies!</b> <br>
      Subscribe to our channel for detailed tutorials, best practices, hands-on projects, and real-world scenarios.
    </p>
    <div class="promo-images">
      <!-- Replace REFERENCE_IMAGE_LINK with suitable images from Google (DevOps, AWS, Kubernetes, Jenkins, AI, etc.) -->
      <img src="REFERENCE_IMAGE_LINK" alt="DevOps">
      <img src="REFERENCE_IMAGE_LINK" alt="AWS">
      <img src="REFERENCE_IMAGE_LINK" alt="Kubernetes">
      <img src="REFERENCE_IMAGE_LINK" alt="Jenkins">
      <img src="REFERENCE_IMAGE_LINK" alt="AI Tools">
    </div>
    <ul>
      <li>🏆 <b>End-to-End DevOps Projects</b> (CI/CD, Automation, Infra-as-Code)</li>
      <li>🚀 <b>Cloud Essentials:</b> AWS Architectures, Deployment, Best Practices</li>
      <li>🛠️ <b>Kubernetes, Jenkins, ArgoCD, Helm Charts, Ingress, Docker</b></li>
      <li>🤖 <b>Hands-on with AI Tools for DevOps</b></li>
      <li>📦 <b>Terraform Automation</b> & Cloud Infrastructure</li>
      <li>🌐 <b>Real-Time Industry Projects</b></li>
      <li>📋 <b>Comprehensive DevOps + AWS Syllabus</b></li>
      <li>💡 <b>Career Guidance & Interview Preparation</b></li>
    </ul>
    <div class="promo-actions">
      <a href="https://www.youtube.com/@Yashacademy0" target="_blank"><i class="fab fa-youtube"></i> Subscribe Now</a>
      <a href="mailto:yaswanth.arumulla@gmail.com" target="_blank"><i class="fa fa-envelope"></i> Contact for Courses</a>
    </div>
  </div>

  <div class="subscribe">
    📢 Don't forget to <b>Subscribe</b> on YouTube and <b>Follow</b> on GitHub, LinkedIn, and Medium!
  </div>

  <form id="registrationForm" autocomplete="off">
    <div class="container">
      <h2>Register for Free Learning Resources</h2>
      <p>Fill in your details to unlock all exclusive resources!</p>
      <hr>
      <label for="Name">Name</label>
      <input type="text" placeholder="Full Name" name="Name" id="Name" required autocomplete="off">
      <label for="mobile">Mobile</label>
      <input type="text" placeholder="Mobile Number" name="mobile" id="mobile" required maxlength="15">
      <label for="email">Email</label>
      <input type="text" placeholder="your@email.com" name="email" id="email" required>
      <label for="psw">Password</label>
      <input type="password" placeholder="Password" name="psw" id="psw" required minlength="5">
      <label for="psw-repeat">Repeat Password</label>
      <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
      <hr>
      <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
      <button type="submit" class="registerbtn">Register</button>
      <div class="message" id="message"></div>
    </div>
    <div class="container signin">
      <p>Already have an account? <a href="#">Sign in</a></p>
    </div>
  </form>

  <footer>
    Thank You 🙏 — Keep Learning with Yash Academy!
  </footer>

<script>
  // Form feedback
  document.getElementById("registrationForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const name = document.getElementById("Name").value.trim();
    const mobile = document.getElementById("mobile").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("psw").value;
    const repeatPassword = document.getElementById("psw-repeat").value;

    if (password !== repeatPassword) {
      document.getElementById("message").style.color = "crimson";
      document.getElementById("message").innerText = "❌ Passwords do not match!";
      return;
    }

    document.getElementById("message").style.color = "#34a853";
    document.getElementById("message").innerHTML = "🎉 Registration successful!<br>Welcome, <b>" + name + "</b>!";
    document.getElementById("registrationForm").reset();
  });
</script>
</body>
</html>
