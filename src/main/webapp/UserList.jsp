<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapp.dto.UserDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Toggle (For Toggle Button) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    /* Custom styles */
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .top-section {
        background-color: #343a40;
        color: white;
        padding: 20px 0;
    }

    #logo h1 {
        font-family: "Britannic Bold", sans-serif;
        font-size: 2.5rem;
        color: white;
        margin: 0;
        position: relative;
        right: -20px; /* Move text 20px to the right */
        text-transform: capitalize;
    }

    #logo h1 span:first-child {
        color: #ff8c00; /* Orange color for 'T' */
    }

    .navbar-brand img {
        width: 200px;
        height: 70px;
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        border: 3px solid #ffffff;
        border-radius: 8px;
    }

    .navbar-brand img:hover {
        transform: scale(1.1);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
    }

    .search-bar {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .search-bar input {
        width: 100%;
        max-width: 500px;
        padding: 10px;
        border-radius: 25px;
        border: 1px solid #ccc;
    }

    .search-bar button {
        border-radius: 25px;
        background-color: #ff8c00;
        color: white;
        padding: 8px 20px;
        border: none;
        transition: background-color 0.3s;
    }

    .search-bar button:hover {
        background-color: #e67e00;
    }

    .navbar {
        background-color: #343a40;
        margin-top: 20px;
    }

    .navbar-nav {
        display: flex;
        justify-content: space-around;
        width: 100%;
    }

    .nav-link {
        color: white !important;
        font-size: 1.1rem;
    }

    .nav-link:hover {
        color: #ff8c00 !important;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
        .search-bar {
            flex-direction: column;
            gap: 5px;
        }

        .search-bar input {
            width: 100%;
        }
    }
</style>
</head>
<body>

<!-- First Section (Top) - Logo and Search Bar -->
<div class="container-fluid top-section">
    <div class="row align-items-center">
        <!-- Logo -->
        <div id="logo" class="col-md-3 col-12 text-center text-md-start">
            <h1><span>T</span>rendify</h1>
        </div>
        <!-- Search Bar -->
        <div class="col-md-9 col-12 text-center text-md-start">
            <form class="d-flex justify-content-center justify-content-md-start search-bar" role="search">
                <input class="form-control" type="search" placeholder="Search products" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">
                    <i class="fas fa-search"></i> Search
                </button>
            </form>
        </div>
    </div>
</div>

<!-- Navbar with Links -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <!-- Always Visible -->
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i> Cart<span class="badge badge-danger px-1">${cartList.size()}</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin.jsp">
                        <i class="fas fa-store"></i> Admin Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-store"></i> Shop
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-th-large"></i> Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-envelope"></i> Contact Us
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="register.jsp">
                        <i class="fas fa-user-plus"></i> Register
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="orders.jsp">
                        <i class="fas fa-box"></i> Orders
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="log-out">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>



<div class="container mt-5">
    <h2 class="text-center">User List</h2>

    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
            if (users != null) {
                for (UserDTO user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getRole() %></td>
            <td>
                <!-- Toggle Button for Active/Inactive Status -->
                <input type="checkbox" class="status-toggle" data-id="<%= user.getId() %>"
                    <%= user.isActive() ? "checked" : "" %>
                       data-toggle="toggle" data-on="Active" data-off="Inactive" data-size="small">
            </td>
            <td>
                <a href="edit-user.jsp?id=<%= user.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="delete-user.jsp?id=<%= user.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No users available.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS (optional, for better interactivity) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.5/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Bootstrap Toggle JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script>
    // Handle Toggle Change Event
    $(document).ready(function() {
        $('.status-toggle').change(function() {
            var userId = $(this).data('id');
            var isActive = $(this).prop('checked');

            // Send AJAX request to update the user status
            $.ajax({
                url: 'update-status',
                method: 'POST',
                data: {
                    id: userId,
                    active: isActive
                },
                success: function(response) {
                    alert('User status updated successfully');
                },
                error: function() {
                    alert('Error updating status');
                    // Reset the toggle to the previous state
                    $(this).prop('checked', !isActive);
                }
            });
        });
    });
    <%@ include file="includes/footer.jsp" %>
</script>
</body>
</html>
