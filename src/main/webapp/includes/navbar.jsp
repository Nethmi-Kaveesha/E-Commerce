<style>
    /* Custom styles for the page */
    .top-section {
        background-color: #343a40;
        color: white;
        padding: 20px 0;
    }


    .navbar-brand img {
        width: 200px; /* Adjust logo size */
        height: 70px;
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; /* Smooth hover effects */
        border: 3px solid #ffffff; /* Add border around logo */
        border-radius: 8px; /* Rounded corners for the logo */
    }

    .navbar-brand img:hover {
        transform: scale(1.1); /* Slight zoom effect */
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4); /* Add shadow */
    }

    .search-bar {
        display: flex;
        align-items: center;
        gap: 10px; /* Space between input and button */
    }

    .search-bar input {
        width: 60%;
        max-width: 500px; /* Limit the input width on larger screens */
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
        background-color: #e67e00; /* Darker orange on hover */
    }

    .navbar {
        background-color: #343a40;
        margin-top: 20px; /* Small space between search bar and navbar */
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
</style>
</head>
<body>

<!-- First Section (Top) - Logo and Search Bar -->
<div class="container-fluid top-section">
    <div class="row align-items-center">
        <!-- Image Logo (Trendify) -->
        <div class="col-md-3 col-12 text-center text-md-start">
            <h1>Trendify</h1>
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
                    <a class="nav-link active" aria-current="page" href="#">
                        <i class="fas fa-home"></i> Home
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
                    <a class="nav-link" href="rejister.jsp">
                        <i class="fas fa-user-plus"></i> Register
                    </a>
                </li>

                <!-- Visible to Logged-In Users -->
                <% if (user != null) { %>
                <li class="nav-item">
                    <a class="nav-link active" href="../webapp/cart.jsp">
                        <i class="fas fa-shopping-cart"></i> Cart
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="../webapp/orders.jsp">
                        <i class="fas fa-box"></i> Orders
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="log-out">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
                <% } else { %>
                <!-- Visible to Guests -->
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

