<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Yash Academy - Master DevOps & AWS | End-to-End Projects & Real-time Learning</title>
    <meta name="description" content="Learn DevOps, AWS, Kubernetes, Jenkins, Docker, Terraform with real-time projects. Expert-led courses with hands-on experience and industry best practices.">
    <meta name="keywords" content="DevOps, AWS, Kubernetes, Jenkins, Docker, Terraform, CI/CD, ArgoCD, Helm Charts, Cloud Computing">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary: #6366f1;
            --primary-dark: #4338ca;
            --primary-light: #8b5cf6;
            --accent: #a21caf;
            --accent-light: #ec4899;
            --white: #ffffff;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
            --gray-400: #9ca3af;
            --gray-500: #6b7280;
            --gray-600: #4b5563;
            --gray-700: #374151;
            --gray-800: #1f2937;
            --gray-900: #111827;
            --success: #10b981;
            --error: #ef4444;
            --warning: #f59e0b;
            --info: #3b82f6;
            
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --shadow-2xl: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            
            --gradient-primary: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            --gradient-accent: linear-gradient(135deg, var(--accent) 0%, var(--accent-light) 100%);
            --gradient-hero: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-card: linear-gradient(145deg, rgba(255,255,255,0.95) 0%, rgba(255,255,255,0.8) 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
            line-height: 1.6;
            color: var(--gray-800);
            background: var(--gradient-hero);
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header Styles */
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            box-shadow: var(--shadow-lg);
            animation: slideDown 0.8s ease-out;
        }

        @keyframes slideDown {
            from { transform: translateY(-100%); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
        }

        .nav__brand h2 {
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -0.02em;
        }

        .nav__menu {
            display: flex;
            list-style: none;
            gap: 2rem;
            align-items: center;
        }

        .nav__link {
            text-decoration: none;
            color: var(--gray-700);
            font-weight: 500;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            position: relative;
            padding: 0.5rem 0;
        }

        .nav__link:hover {
            color: var(--primary);
            transform: translateY(-1px);
        }

        .nav__link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gradient-primary);
            transition: width 0.3s ease;
        }

        .nav__link:hover::after {
            width: 100%;
        }

        .nav__social {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .social-link {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--gray-100);
            color: var(--gray-600);
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 1.1rem;
        }

        .social-link:hover {
            background: var(--primary);
            color: var(--white);
            transform: translateY(-2px) scale(1.1);
            box-shadow: var(--shadow-lg);
        }

        /* Hero Section */
        .hero {
            padding: 8rem 0 6rem;
            text-align: center;
            background: var(--gradient-hero);
            color: var(--white);
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none"><polygon fill="rgba(255,255,255,0.05)" points="1000,0 1000,80 0,100 0,0"/></svg>') repeat-x;
            background-size: 1000px 100px;
            animation: wave 20s linear infinite;
        }

        @keyframes wave {
            0% { background-position-x: 0; }
            100% { background-position-x: 1000px; }
        }

        .hero__content {
            position: relative;
            z-index: 2;
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .hero__title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
            letter-spacing: -0.02em;
        }

        .hero__subtitle {
            font-size: 1.25rem;
            margin-bottom: 2.5rem;
            opacity: 0.9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            font-weight: 400;
        }

        .hero__cta {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 1rem 2rem;
            border: none;
            border-radius: 0.75rem;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: inherit;
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            background: var(--gradient-primary);
            color: var(--white);
            box-shadow: var(--shadow-lg);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-xl);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.15);
            color: var(--white);
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.25);
            border-color: rgba(255, 255, 255, 0.5);
            transform: translateY(-2px);
        }

        /* Main Content */
        .main {
            background: var(--white);
            position: relative;
            z-index: 1;
        }

        .section {
            padding: 5rem 0;
        }

        .section__header {
            text-align: center;
            margin-bottom: 4rem;
        }

        .section__title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 1rem;
            letter-spacing: -0.02em;
        }

        .section__subtitle {
            font-size: 1.1rem;
            color: var(--gray-600);
            max-width: 600px;
            margin: 0 auto;
        }

        /* Courses Section */
        .courses-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .course-card {
            background: var(--gradient-card);
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: var(--shadow-lg);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }

        .course-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }

        .course-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--shadow-2xl);
        }

        .course-card__header {
            margin-bottom: 1.5rem;
        }

        .course-card__title {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
        }

        .course-card__description {
            color: var(--gray-600);
            font-size: 0.95rem;
            line-height: 1.6;
        }

        .course-card__meta {
            display: flex;
            gap: 1rem;
            margin: 1.5rem 0;
            flex-wrap: wrap;
        }

        .course-card__meta-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.85rem;
            color: var(--gray-600);
            background: var(--gray-100);
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
        }

        .course-card__technologies {
            margin: 1.5rem 0;
        }

        .course-card__tech-list {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 0.75rem;
        }

        .tech-tag {
            background: var(--gradient-primary);
            color: var(--white);
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .course-card__highlights {
            margin: 1.5rem 0;
        }

        .course-card__highlight-list {
            list-style: none;
            margin-top: 0.75rem;
        }

        .course-card__highlight-list li {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            color: var(--gray-700);
        }

        .course-card__highlight-list li::before {
            content: '✓';
            color: var(--success);
            font-weight: bold;
        }

        /* Technologies Section */
        .technologies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 3rem;
        }

        .tech-item {
            background: var(--gradient-card);
            border-radius: 0.75rem;
            padding: 1.5rem;
            text-align: center;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .tech-item:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }

        .tech-item__icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .tech-item__name {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
        }

        .tech-item__category {
            font-size: 0.85rem;
            color: var(--gray-600);
        }

        /* Features Section */
        .features {
            background: var(--gray-50);
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature-item {
            background: var(--white);
            border-radius: 1rem;
            padding: 2rem;
            text-align: center;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
        }

        .feature-item:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
        }

        .feature-item__icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .feature-item__title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.75rem;
        }

        .feature-item__description {
            color: var(--gray-600);
            font-size: 0.95rem;
        }

        /* Contact Section */
        .contact {
            background: var(--gradient-hero);
            color: var(--white);
        }

        .contact-form {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 1.5rem;
            padding: 3rem;
            box-shadow: var(--shadow-2xl);
            color: var(--gray-800);
            max-width: 600px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--gray-700);
        }

        .form-control {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid var(--gray-200);
            border-radius: 0.5rem;
            font-size: 1rem;
            font-family: inherit;
            transition: all 0.3s ease;
            background: var(--white);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
        }

        .form-control:invalid {
            border-color: var(--error);
        }

        .btn-submit {
            width: 100%;
            background: var(--gradient-primary);
            color: var(--white);
            padding: 1rem 2rem;
            border: none;
            border-radius: 0.75rem;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-lg);
            position: relative;
            overflow: hidden;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-xl);
        }

        .btn-submit:active {
            transform: translateY(2px) scale(0.98);
            box-shadow: var(--shadow);
        }

        .message {
            text-align: center;
            margin-top: 1.5rem;
            padding: 1rem;
            border-radius: 0.5rem;
            font-weight: 600;
            display: none;
        }

        .message.success {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
            border: 1px solid rgba(16, 185, 129, 0.3);
        }

        .message.error {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border: 1px solid rgba(239, 68, 68, 0.3);
        }

        /* Footer */
        .footer {
            background: var(--gray-900);
            color: var(--white);
            padding: 3rem 0 2rem;
            text-align: center;
        }

        .footer__content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer__section h3 {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--white);
        }

        .footer__links {
            list-style: none;
        }

        .footer__links li {
            margin-bottom: 0.5rem;
        }

        .footer__links a {
            color: var(--gray-300);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer__links a:hover {
            color: var(--primary-light);
        }

        .footer__social {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1rem;
        }

        .footer__social .social-link {
            background: var(--gray-800);
            color: var(--gray-300);
        }

        .footer__social .social-link:hover {
            background: var(--primary);
            color: var(--white);
        }

        .footer__bottom {
            border-top: 1px solid var(--gray-800);
            padding-top: 2rem;
            color: var(--gray-400);
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav__menu {
                display: none;
            }

            .hero__title {
                font-size: 2.5rem;
            }

            .hero__cta {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 100%;
                max-width: 300px;
                justify-content: center;
            }

            .section__title {
                font-size: 2rem;
            }

            .courses-grid,
            .technologies-grid,
            .features-grid {
                grid-template-columns: 1fr;
            }

            .contact-form {
                padding: 2rem;
                margin: 0 1rem;
            }

            .container {
                padding: 0 15px;
            }
        }

        @media (max-width: 480px) {
            .hero {
                padding: 6rem 0 4rem;
            }

            .hero__title {
                font-size: 2rem;
            }

            .section {
                padding: 3rem 0;
            }

            .course-card,
            .contact-form {
                padding: 1.5rem;
            }
        }

        /* Animations */
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.6s ease;
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .stagger-animation {
            animation-delay: calc(var(--stagger) * 0.1s);
        }

        /* Utility Classes */
        .text-center { text-align: center; }
        .text-left { text-align: left; }
        .text-right { text-align: right; }

        .mb-1 { margin-bottom: 0.25rem; }
        .mb-2 { margin-bottom: 0.5rem; }
        .mb-3 { margin-bottom: 1rem; }
        .mb-4 { margin-bottom: 1.5rem; }
        .mb-5 { margin-bottom: 2rem; }

        .mt-1 { margin-top: 0.25rem; }
        .mt-2 { margin-top: 0.5rem; }
        .mt-3 { margin-top: 1rem; }
        .mt-4 { margin-top: 1.5rem; }
        .mt-5 { margin-top: 2rem; }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <nav class="nav container">
            <div class="nav__brand">
                <h2>Yash Academy</h2>
            </div>
            <ul class="nav__menu">
                <li><a href="#home" class="nav__link">Home</a></li>
                <li><a href="#courses" class="nav__link">Courses</a></li>
                <li><a href="#technologies" class="nav__link">Technologies</a></li>
                <li><a href="#about" class="nav__link">About</a></li>
                <li><a href="#contact" class="nav__link">Contact</a></li>
            </ul>
            <div class="nav__social">
                <a href="https://www.youtube.com/@Yashacademy0" target="_blank" class="social-link" title="YouTube">
                    <i class="fab fa-youtube"></i>
                </a>
                <a href="https://github.com/arumullayaswanth" target="_blank" class="social-link" title="GitHub">
                    <i class="fab fa-github"></i>
                </a>
                <a href="https://www.linkedin.com/in/yaswanth-arumulla/" target="_blank" class="social-link" title="LinkedIn">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="https://medium.com/@yaswanth.arumulla" target="_blank" class="social-link" title="Medium">
                    <i class="fab fa-medium"></i>
                </a>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="container">
            <div class="hero__content">
                <h1 class="hero__title">Master DevOps & AWS with Real-World Projects</h1>
                <p class="hero__subtitle">
                    Learn end-to-end DevOps, AWS, Kubernetes, Jenkins, Docker, Terraform, Argo CD, and AI tools through hands-on projects and real-time scenarios
                </p>
                <div class="hero__cta">
                    <a href="#contact" class="btn btn-primary">
                        <i class="fas fa-rocket"></i>
                        Enroll Now
                    </a>
                    <a href="https://www.youtube.com/@Yashacademy0" target="_blank" class="btn btn-secondary">
                        <i class="fab fa-youtube"></i>
                        Watch Demo
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <main class="main">
        <!-- Courses Section -->
        <section id="courses" class="section">
            <div class="container">
                <div class="section__header">
                    <h2 class="section__title">Comprehensive DevOps & AWS Courses</h2>
                    <p class="section__subtitle">
                        Master the most in-demand DevOps technologies through structured learning paths and real-world projects
                    </p>
                </div>

                <div class="courses-grid">
                    <!-- Course 1: Complete DevOps End-to-End -->
                    <div class="course-card fade-in">
                        <div class="course-card__header">
                            <h3 class="course-card__title">Complete DevOps End-to-End</h3>
                            <p class="course-card__description">
                                Master the complete DevOps lifecycle from development to deployment with real-world industry projects
                            </p>
                        </div>
                        <div class="course-card__meta">
                            <span class="course-card__meta-item">
                                <i class="fas fa-clock"></i>
                                8 weeks
                            </span>
                            <span class="course-card__meta-item">
                                <i class="fas fa-signal"></i>
                                Beginner to Advanced
                            </span>
                        </div>
                        <div class="course-card__technologies">
                            <strong>Technologies:</strong>
                            <div class="course-card__tech-list">
                                <span class="tech-tag">Jenkins</span>
                                <span class="tech-tag">Docker</span>
                                <span class="tech-tag">Kubernetes</span>
                                <span class="tech-tag">Argo CD</span>
                                <span class="tech-tag">Monitoring</span>
                            </div>
                        </div>
                        <div class="course-card__highlights">
                            <strong>Key Highlights:</strong>
                            <ul class="course-card__highlight-list">
                                <li>Real-time industry projects</li>
                                <li>End-to-end CI/CD implementation</li>
                                <li>Production-ready deployments</li>
                                <li>Industry best practices</li>
                            </ul>
                        </div>
                        <a href="#contact" class="btn btn-primary">Learn More</a>
                    </div>

                    <!-- Course 2: AWS Cloud Mastery -->
                    <div class="course-card fade-in">
                        <div class="course-card__header">
                            <h3 class="course-card__title">AWS Cloud Mastery</h3>
                            <p class="course-card__description">
                                Comprehensive AWS training covering core services, architecture patterns, and deployment strategies
                            </p>
                        </div>
                        <div class="course-card__meta">
                            <span class="course-card__meta-item">
                                <i class="fas fa-clock"></i>
                                6 weeks
                            </span>
                            <span class="course-card__meta-item">
                                <i class="fas fa-signal"></i>
                                Intermediate
                            </span>
                        </div>
                        <div class="course-card__technologies">
                            <strong>Technologies:</strong>
                            <div class="course-card__tech-list">
                                <span class="tech-tag">EC2</span>
                                <span class="tech-tag">S3</span>
                                <span class="tech-tag">VPC</span>
                                <span class="tech-tag">IAM</span>
                                <span class="tech-tag">Lambda</span>
                                <span class="tech-tag">CloudFormation</span>
                            </div>
                        </div>
                        <div class="course-card__highlights">
                            <strong>Key Highlights:</strong>
                            <ul class="course-card__highlight-list">
                                <li>Hands-on AWS labs</li>
                                <li>Real AWS projects</li>
                                <li>Cost optimization strategies</li>
                                <li>Security best practices</li>
                            </ul>
                        </div>
                        <a href="#contact" class="btn btn-primary">Learn More</a>
                    </div>

                    <!-- Course 3: Kubernetes & Docker Deep Dive -->
                    <div class="course-card fade-in">
                        <div class="course-card__header">
                            <h3 class="course-card__title">Kubernetes & Docker Deep Dive</h3>
                            <p class="course-card__description">
                                Master containerization and orchestration with Docker and Kubernetes for scalable applications
                            </p>
                        </div>
                        <div class="course-card__meta">
                            <span class="course-card__meta-item">
                                <i class="fas fa-clock"></i>
                                5 weeks
                            </span>
                            <span class="course-card__meta-item">
                                <i class="fas fa-signal"></i>
                                Intermediate
                            </span>
                        </div>
                        <div class="course-card__technologies">
                            <strong>Technologies:</strong>
                            <div class="course-card__tech-list">
                                <span class="tech-tag">Docker</span>
                                <span class="tech-tag">Kubernetes</span>
                                <span class="tech-tag">Helm</span>
                                <span class="tech-tag">Ingress</span>
                                <span class="tech-tag">Monitoring</span>
                            </div>
                        </div>
                        <div class="course-card__highlights">
                            <strong>Key Highlights:</strong>
                            <ul class="course-card__highlight-list">
                                <li>Container best practices</li>
                                <li>Production deployments</li>
                                <li>Scaling strategies</li>
                                <li>Service mesh integration</li>
                            </ul>
                        </div>
                        <a href="#contact" class="btn btn-primary">Learn More</a>
                    </div>

                    <!-- Course 4: CI/CD with Jenkins & Argo CD -->
                    <div class="course-card fade-in">
                        <div class="course-card__header">
                            <h3 class="course-card__title">CI/CD with Jenkins & Argo CD</h3>
                            <p class="course-card__description">
                                Build robust CI/CD pipelines using Jenkins for continuous integration and Argo CD for GitOps deployment
                            </p>
                        </div>
                        <div class="course-card__meta">
                            <span class="course-card__meta-item">
                                <i class="fas fa-clock"></i>
                                4 weeks
                            </span>
                            <span class="course-card__meta-item">
                                <i class="fas fa-signal"></i>
                                Intermediate
                            </span>
                        </div>
                        <div class="course-card__technologies">
                            <strong>Technologies:</strong>
                            <div class="course-card__tech-list">
                                <span class="tech-tag">Jenkins</span>
                                <span class="tech-tag">Argo CD</span>
                                <span class="tech-tag">GitOps</span>
                                <span class="tech-tag">Pipeline Scripts</span>
                            </div>
                        </div>
                        <div class="course-card__highlights">
                            <strong>Key Highlights:</strong>
                            <ul class="course-card__highlight-list">
                                <li>Pipeline automation</li>
                                <li>GitOps workflows</li>
                                <li>Security integration</li>
                                <li>Multi-environment deployments</li>
                            </ul>
                        </div>
                        <a href="#contact" class="btn btn-primary">Learn More</a>
                    </div>

                    <!-- Course 5: Infrastructure as Code with Terraform -->
                    <div class="course-card fade-in">
                        <div class="course-card__header">
                            <h3 class="course-card__title">Infrastructure as Code with Terraform</h3>
                            <p class="course-card__description">
                                Automate infrastructure provisioning and management using Terraform across multiple cloud platforms
                            </p>
                        </div>
                        <div class="course-card__meta">
                            <span class="course-card__meta-item">
                                <i class="fas fa-clock"></i>
                                4 weeks
                            </span>
                            <span class="course-card__meta-item">
                                <i class="fas fa-signal"></i>
                                Beginner to Intermediate
                            </span>
                        </div>
                        <div class="course-card__technologies">
                            <strong>Technologies:</strong>
                            <div class="course-card__tech-list">
                                <span class="tech-tag">Terraform</span>
                                <span class="tech-tag">AWS</span>
                                <span class="tech-tag">Azure</span>
                                <span class="tech-tag">GCP</span>
                                <span class="tech-tag">Automation</span>
                            </div>
                        </div>
                        <div class="course-card__highlights">
                            <strong>Key Highlights:</strong>
                            <ul class="course-card__highlight-list">
                                <li>Multi-cloud deployment</li>
                                <li>State management</li>
                                <li>Best practices</li>
                                <li>Infrastructure testing</li>
                            </ul>
                        </div>
                        <a href="#contact" class="btn btn-primary">Learn More</a>
                    </div>

                    <!-- Course 6: AI Tools for DevOps -->
                    <div class="course-card fade-in">
                        <div class="course-card__header">
                            <h3 class="course-card__title">AI Tools for DevOps</h3>
                            <p class="course-card__description">
                                Integrate cutting-edge AI and ML tools into DevOps workflows for enhanced automation and intelligence
                            </p>
                        </div>
                        <div class="course-card__meta">
                            <span class="course-card__meta-item">
                                <i class="fas fa-clock"></i>
                                3 weeks
                            </span>
                            <span class="course-card__meta-item">
                                <i class="fas fa-signal"></i>
                                Advanced
                            </span>
                        </div>
                        <div class="course-card__technologies">
                            <strong>Technologies:</strong>
                            <div class="course-card__tech-list">
                                <span class="tech-tag">AI/ML Tools</span>
                                <span class="tech-tag">Automation</span>
                                <span class="tech-tag">Monitoring</span>
                                <span class="tech-tag">Analytics</span>
                            </div>
                        </div>
                        <div class="course-card__highlights">
                            <strong>Key Highlights:</strong>
                            <ul class="course-card__highlight-list">
                                <li>Cutting-edge AI tools</li>
                                <li>Automation enhancement</li>
                                <li>Future-ready skills</li>
                                <li>Intelligent monitoring</li>
                            </ul>
                        </div>
                        <a href="#contact" class="btn btn-primary">Learn More</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Technologies Section -->
        <section id="technologies" class="section features">
            <div class="container">
                <div class="section__header">
                    <h2 class="section__title">Technologies You'll Master</h2>
                    <p class="section__subtitle">
                        Get hands-on experience with the most in-demand DevOps and cloud technologies used by industry leaders
                    </p>
                </div>

                <div class="technologies-grid">
                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fab fa-docker"></i>
                        </div>
                        <h3 class="tech-item__name">Docker</h3>
                        <p class="tech-item__category">Containerization</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fas fa-dharmachakra"></i>
                        </div>
                        <h3 class="tech-item__name">Kubernetes</h3>
                        <p class="tech-item__category">Orchestration</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fab fa-jenkins"></i>
                        </div>
                        <h3 class="tech-item__name">Jenkins</h3>
                        <p class="tech-item__category">CI/CD</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fas fa-code-branch"></i>
                        </div>
                        <h3 class="tech-item__name">Argo CD</h3>
                        <p class="tech-item__category">GitOps</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fas fa-ship"></i>
                        </div>
                        <h3 class="tech-item__name">Helm Charts</h3>
                        <p class="tech-item__category">Package Management</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fas fa-network-wired"></i>
                        </div>
                        <h3 class="tech-item__name">Ingress</h3>
                        <p class="tech-item__category">Networking</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fas fa-cubes"></i>
                        </div>
                        <h3 class="tech-item__name">Terraform</h3>
                        <p class="tech-item__category">Infrastructure as Code</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fab fa-aws"></i>
                        </div>
                        <h3 class="tech-item__name">AWS</h3>
                        <p class="tech-item__category">Cloud Platform</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fas fa-robot"></i>
                        </div>
                        <h3 class="tech-item__name">AI Tools</h3>
                        <p class="tech-item__category">Automation</p>
                    </div>

                    <div class="tech-item fade-in">
                        <div class="tech-item__icon">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3 class="tech-item__name">Monitoring</h3>
                        <p class="tech-item__category">Observability</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features/Benefits Section -->
        <section id="about" class="section">
            <div class="container">
                <div class="section__header">
                    <h2 class="section__title">Why Choose Yash Academy?</h2>
                    <p class="section__subtitle">
                        Experience learning that goes beyond theory with real-world applications and industry expertise
                    </p>
                </div>

                <div class="features-grid">
                    <div class="feature-item fade-in">
                        <div class="feature-item__icon">🚀</div>
                        <h3 class="feature-item__title">Real-time Projects</h3>
                        <p class="feature-item__description">
                            Work on actual industry projects and scenarios that mirror real-world DevOps challenges and solutions
                        </p>
                    </div>

                    <div class="feature-item fade-in">
                        <div class="feature-item__icon">🔄</div>
                        <h3 class="feature-item__title">End-to-End Learning</h3>
                        <p class="feature-item__description">
                            Master the complete DevOps lifecycle from development to production deployment and monitoring
                        </p>
                    </div>

                    <div class="feature-item fade-in">
                        <div class="feature-item__icon">👨‍💼</div>
                        <h3 class="feature-item__title">Industry Expert</h3>
                        <p class="feature-item__description">
                            Learn from an experienced DevOps professional with hands-on industry experience and proven expertise
                        </p>
                    </div>

                    <div class="feature-item fade-in">
                        <div class="feature-item__icon">💬</div>
                        <h3 class="feature-item__title">24/7 Support</h3>
                        <p class="feature-item__description">
                            Get help whenever you need it through our active community and dedicated support channels
                        </p>
                    </div>

                    <div class="feature-item fade-in">
                        <div class="feature-item__icon">🎓</div>
                        <h3 class="feature-item__title">Hands-on Labs</h3>
                        <p class="feature-item__description">
                            Practice in real cloud environments with guided labs and practical exercises for each technology
                        </p>
                    </div>

                    <div class="feature-item fade-in">
                        <div class="feature-item__icon">📈</div>
                        <h3 class="feature-item__title">Career Growth</h3>
                        <p class="feature-item__description">
                            Build portfolio projects and gain skills that directly translate to career advancement opportunities
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact/Registration Section -->
        <section id="contact" class="section contact">
            <div class="container">
                <div class="section__header">
                    <h2 class="section__title">Start Your DevOps Journey Today</h2>
                    <p class="section__subtitle">
                        Join thousands of students who have transformed their careers with our comprehensive DevOps and AWS training
                    </p>
                </div>

                <div class="contact-form">
                    <form id="registrationForm">
                        <div class="form-group">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
                        </div>

                        <div class="form-group">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email address" required>
                        </div>

                        <div class="form-group">
                            <label for="mobile" class="form-label">Mobile Number</label>
                            <input type="tel" id="mobile" name="mobile" class="form-control" placeholder="Enter your mobile number" required>
                        </div>

                        <div class="form-group">
                            <label for="course" class="form-label">Course Interest</label>
                            <select id="course" name="course" class="form-control" required>
                                <option value="">Select a course</option>
                                <option value="complete-devops">Complete DevOps End-to-End</option>
                                <option value="aws-mastery">AWS Cloud Mastery</option>
                                <option value="kubernetes-docker">Kubernetes & Docker Deep Dive</option>
                                <option value="jenkins-argocd">CI/CD with Jenkins & Argo CD</option>
                                <option value="terraform">Infrastructure as Code with Terraform</option>
                                <option value="ai-tools">AI Tools for DevOps</option>
                                <option value="all-courses">All Courses</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="experience" class="form-label">Experience Level</label>
                            <select id="experience" name="experience" class="form-control" required>
                                <option value="">Select your experience level</option>
                                <option value="beginner">Beginner (0-1 years)</option>
                                <option value="intermediate">Intermediate (1-3 years)</option>
                                <option value="advanced">Advanced (3+ years)</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Create a password" required minlength="6">
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm your password" required minlength="6">
                        </div>

                        <button type="submit" class="btn-submit">
                            <i class="fas fa-rocket"></i>
                            Register Now & Start Learning
                        </button>

                        <div id="message" class="message"></div>

                        <p class="text-center mt-4" style="color: var(--gray-600); font-size: 0.9rem;">
                            By registering, you agree to our <a href="#" style="color: var(--primary);">Terms of Service</a> and <a href="#" style="color: var(--primary);">Privacy Policy</a>
                        </p>
                    </form>
                </div>

                <div class="text-center mt-5">
                    <h3 style="color: white; margin-bottom: 1rem;">Follow & Subscribe for Updates</h3>
                    <div class="footer__social">
                        <a href="https://www.youtube.com/@Yashacademy0" target="_blank" class="social-link" title="Subscribe on YouTube">
                            <i class="fab fa-youtube"></i>
                        </a>
                        <a href="https://github.com/arumullayaswanth" target="_blank" class="social-link" title="Follow on GitHub">
                            <i class="fab fa-github"></i>
                        </a>
                        <a href="https://www.linkedin.com/in/yaswanth-arumulla/" target="_blank" class="social-link" title="Connect on LinkedIn">
                            <i class="fab fa-linkedin"></i>
                        </a>
                        <a href="https://medium.com/@yaswanth.arumulla" target="_blank" class="social-link" title="Follow on Medium">
                            <i class="fab fa-medium"></i>
                        </a>
                    </div>
                    <p style="color: rgba(255,255,255,0.8); margin-top: 1rem; font-size: 1.1rem;">
                        📢 <strong>Don't forget to Subscribe on YouTube</strong> for the latest DevOps tutorials and project walkthroughs!
                    </p>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer__content">
                <div class="footer__section">
                    <h3>Yash Academy</h3>
                    <p style="color: var(--gray-300); margin-bottom: 1rem;">
                        Empowering careers through comprehensive DevOps and AWS training with real-world projects and industry best practices.
                    </p>
                    <div class="footer__social">
                        <a href="https://www.youtube.com/@Yashacademy0" target="_blank" class="social-link" title="YouTube">
                            <i class="fab fa-youtube"></i>
                        </a>
                        <a href="https://github.com/arumullayaswanth" target="_blank" class="social-link" title="GitHub">
                            <i class="fab fa-github"></i>
                        </a>
                        <a href="https://www.linkedin.com/in/yaswanth-arumulla/" target="_blank" class="social-link" title="LinkedIn">
                            <i class="fab fa-linkedin"></i>
                        </a>
                        <a href="https://medium.com/@yaswanth.arumulla" target="_blank" class="social-link" title="Medium">
                            <i class="fab fa-medium"></i>
                        </a>
                    </div>
                </div>

                <div class="footer__section">
                    <h3>Quick Links</h3>
                    <ul class="footer__links">
                        <li><a href="#home">Home</a></li>
                        <li><a href="#courses">Courses</a></li>
                        <li><a href="#technologies">Technologies</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>

                <div class="footer__section">
                    <h3>Popular Courses</h3>
                    <ul class="footer__links">
                        <li><a href="#contact">Complete DevOps End-to-End</a></li>
                        <li><a href="#contact">AWS Cloud Mastery</a></li>
                        <li><a href="#contact">Kubernetes & Docker</a></li>
                        <li><a href="#contact">Jenkins & Argo CD</a></li>
                        <li><a href="#contact">Terraform</a></li>
                    </ul>
                </div>

                <div class="footer__section">
                    <h3>Technologies</h3>
                    <ul class="footer__links">
                        <li><a href="#technologies">Docker & Kubernetes</a></li>
                        <li><a href="#technologies">Jenkins & CI/CD</a></li>
                        <li><a href="#technologies">AWS & Cloud</a></li>
                        <li><a href="#technologies">Terraform & IaC</a></li>
                        <li><a href="#technologies">AI Tools</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer__bottom">
                <p>&copy; 2024 Yash Academy. All rights reserved. | Designed for DevOps Excellence</p>
                <p style="margin-top: 0.5rem;">
                    🎯 <strong>Transform your career with hands-on DevOps and AWS expertise</strong> 🚀
                </p>
            </div>
        </div>
    </footer>

    <script>
        // Smooth scrolling for navigation links
        document.addEventListener('DOMContentLoaded', function() {
            // Smooth scrolling
            const navLinks = document.querySelectorAll('a[href^="#"]');
            navLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const targetId = this.getAttribute('href');
                    const targetElement = document.querySelector(targetId);
                    
                    if (targetElement) {
                        const headerHeight = document.querySelector('.header').offsetHeight;
                        const targetPosition = targetElement.offsetTop - headerHeight;
                        
                        window.scrollTo({
                            top: targetPosition,
                            behavior: 'smooth'
                        });
                    }
                });
            });

            // Fade in animation on scroll
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };

            const observer = new IntersectionObserver(function(entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, observerOptions);

            document.querySelectorAll('.fade-in').forEach(el => {
                observer.observe(el);
            });

            // Form handling
            const registrationForm = document.getElementById('registrationForm');
            const messageDiv = document.getElementById('message');

            registrationForm.addEventListener('submit', function(e) {
                e.preventDefault();

                const formData = new FormData(this);
                const name = formData.get('name');
                const email = formData.get('email');
                const mobile = formData.get('mobile');
                const course = formData.get('course');
                const experience = formData.get('experience');
                const password = formData.get('password');
                const confirmPassword = formData.get('confirmPassword');

                // Validation
                if (password !== confirmPassword) {
                    showMessage('❌ Passwords do not match!', 'error');
                    return;
                }

                if (password.length < 6) {
                    showMessage('❌ Password must be at least 6 characters long!', 'error');
                    return;
                }

                // Success message
                showMessage(`🎉 Registration successful! Welcome to Yash Academy, ${name}! <br>
                    📧 Check your email for course details and next steps.<br>
                    🚀 Don't forget to subscribe to our YouTube channel for updates!`, 'success');
                
                // Reset form
                this.reset();

                // Scroll to YouTube link after 3 seconds
                setTimeout(() => {
                    window.open('https://www.youtube.com/@Yashacademy0', '_blank');
                }, 3000);
            });

            function showMessage(text, type) {
                messageDiv.innerHTML = text;
                messageDiv.className = `message ${type}`;
                messageDiv.style.display = 'block';
                
                // Auto hide after 8 seconds
                setTimeout(() => {
                    messageDiv.style.display = 'none';
                }, 8000);
            }

            // Header scroll effect
            let lastScrollTop = 0;
            const header = document.querySelector('.header');
            
            window.addEventListener('scroll', function() {
                const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
                
                if (scrollTop > lastScrollTop && scrollTop > 100) {
                    header.style.transform = 'translateY(-100%)';
                } else {
                    header.style.transform = 'translateY(0)';
                }
                
                lastScrollTop = scrollTop;
            });

            // CTA button actions
            const enrollButtons = document.querySelectorAll('a[href="#contact"]');
            const demoButtons = document.querySelectorAll('a[href="https://www.youtube.com/@Yashacademy0"]');

            enrollButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    document.querySelector('#contact').scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                });
            });

            demoButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    window.open('https://www.youtube.com/@Yashacademy0', '_blank');
                });
            });
        });
    </script>
</body>
</html>
