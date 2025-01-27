<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <%@ include file="includes/head.jsp" %>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f7f6;
        }

        .contact-form-container {
            display: flex;
            justify-content: center;
            margin-top: 40px;
            min-height: 100vh;
        }

        .contact-form {
            padding: 10px;
            border-radius: 10px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            border: none;
            font-size: 16px;
            margin-top: 5px;
        }

        .form-group input {
            background-color: #333;
            color: white;
        }

        .form-group textarea {
            background-color: #444;
            color: white;
            height: 150px;
            resize: none;
        }

        .btn-submit {
            background-color: #ff8c00;
            color: white;
            padding: 15px 30px;
            border-radius: 30px;
            width: 100%;
            font-size: 18px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #e67e00;
        }

        .message {
            color: #4CAF50;
            font-size: 16px;
            text-align: center;
            margin-top: 20px;
        }

        .message.error {
            color: #f44336;
        }
    </style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>
<div class="contact-form-container">
    <div class="contact-form">
        <h2>Contact Us</h2>
        <form id="contactForm" onsubmit="return handleSubmit(event)">
            <div class="form-group">
                <input type="text" id="name" placeholder="Your Name" required>
            </div>
            <div class="form-group">
                <input type="email" id="email" placeholder="Your Email" required>
            </div>
            <div class="form-group">
                <textarea id="message" placeholder="Your Message" required></textarea>
            </div>
            <button type="submit" class="btn-submit">Send Message</button>
        </form>
        <div id="responseMessage" class="message"></div>
    </div>
</div>

<script>
    function handleSubmit(event) {
        event.preventDefault(); // Prevents the default form submission

        // Get the input values
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const message = document.getElementById('message').value;

        // Simple validation to ensure all fields are filled
        if (name === '' || email === '' || message === '') {
            document.getElementById('responseMessage').textContent = 'Please fill in all fields.';
            document.getElementById('responseMessage').classList.add('error');
            return;
        }

        // Simulate email sending by showing a success message
        setTimeout(() => {
            document.getElementById('responseMessage').textContent = `Thank you for contacting us, ${name}! We'll get back to you shortly.`;
            document.getElementById('responseMessage').classList.remove('error');
            document.getElementById('responseMessage').classList.add('message');

            // Clear the form after submission
            document.getElementById('contactForm').reset();
        }, 1000);
    }
</script>

</body>
</html>
