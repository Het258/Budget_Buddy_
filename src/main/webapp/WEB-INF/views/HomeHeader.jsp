<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BudgetBuddy</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        
        body {
            margin: 0;
            padding: 0;
            background-image: url('https://images.unsplash.com/photo-1554224155-6726b3ff858f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            color: white;
        }
        
        header {
            background-color: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(5px);
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .logo {
            font-size: 28px;
            font-weight: bold;
            color: white;
            letter-spacing: 1px;
        }
        
        .auth-buttons a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 25px;
            transition: all 0.3s ease;
            font-weight: 600;
            background: linear-gradient(135deg, #4a6cf7 0%, #2541b2 100%);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            display: inline-block;
        }
        
        .auth-buttons a:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            background: linear-gradient(135deg, #5a7cff 0%, #3552c1 100%);
        }
        
        .auth-buttons a:active {
            transform: translateY(0);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .time-info {
            position: fixed;
            top: 80px;
            right: 40px;
            background-color: rgba(0, 0, 0, 0.4);
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 14px;
            text-align: center;
            line-height: 1.4;
        }
        
        .content {
            padding: 180px 40px 40px;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .tax-section {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 8px;
            margin-top: 40px;
        }
        
        .tax-section h1 {
            font-size: 32px;
            margin-bottom: 20px;
            line-height: 1.2;
        }
        
        .tax-section p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        
        .year-note {
            font-size: 14px;
            margin-top: 30px;
            color: rgba(255, 255, 255, 0.7);
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">BudgetBuddy</div>
        <div class="auth-buttons">
            <a href="login" class="login-btn">Login</a>
        </div>
    </header>
    
    <div class="content">
        
    </div>
</body>
</html>