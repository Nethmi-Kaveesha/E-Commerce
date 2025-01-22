<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Registration</title>
  <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .register-container {
      background: #fff;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }
    .register-container h1 {
      text-align: center;
      margin-bottom: 1.5rem;
      color: #333;
    }
    .form-group {
      margin-bottom: 1rem;
    }
    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: bold;
    }
    .form-group input {
      width: 100%;
      padding: 0.8rem;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 1rem;
    }
    .form-group input:focus {
      border-color: #007bff;
      outline: none;
    }
    .form-error {
      color: red;
      font-size: 0.9rem;
    }
    .btn {
      display: inline-block;
      background-color: #007bff;
      color: #fff;
      padding: 0.8rem 1.5rem;
      text-align: center;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
      font-size: 1rem;
    }
    .btn:hover {
      background-color: #0056b3;
    }
    .login-link {
      margin-top: 1rem;
      text-align: center;
    }
    .login-link a {
      color: #007bff;
      text-decoration: none;
    }
    .login-link a:hover {
      text-decoration: underline;
    }
    .alert {
      padding: 1rem;
      margin-bottom: 1rem;
      border-radius: 5px;
      background-color: #28a745;
      color: white;
      text-align: center;
      font-size: 1rem;
    }
  </style>
</head>
<body>
<div class="register-container">
  <h1>Register</h1>

  <!-- Success message display logic -->
  <% if (request.getAttribute("registrationSuccess") != null) { %>
  <div class="alert">
    User registered successfully!
  </div>
  <% } %>

  <form action="user-register" method="POST">
    <div class="form-group">
      <label for="name">Full Name</label>
      <input type="text" id="name" name="name" placeholder="Enter your full name" required>
    </div>
    <div class="form-group">
      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" placeholder="Enter your password" required>
    </div>
    <div class="form-group">
      <label for="confirm-password">Confirm Password</label>
      <input type="password" id="confirm-password" name="confirmPassword" placeholder="Confirm your password" required>
    </div>
    <button type="submit" class="btn">Register</button>
  </form>
  <div class="login-link">
    <p>Already have an account? <a href="login.jsp">Login here</a>.</p>
  </div>
</div>

</body>
</html>
