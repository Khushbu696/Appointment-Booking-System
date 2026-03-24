<html>
<head>
<style>
body {
    font-family: Arial;
    margin: 0;
    height: 100vh;
    background: linear-gradient(135deg, #2193b0, #6dd5ed);
    display: flex;
    justify-content: center;
    align-items: center;
}

.card {
    background: white;
    padding: 35px;
    border-radius: 12px;
    width: 320px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    text-align: center;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 6px;
}

button {
    width: 100%;
    padding: 12px;
    background: #2193b0;
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: bold;
    cursor: pointer;
}

button:hover {
    background: #176d85;
}

p {
    margin-top: 15px;
    color: #555;
}

a {
    color: #2193b0;
    text-decoration: none;
    font-weight: bold;
}
</style>
</head>

<body>

<div class="card">
    <h2>Login</h2>

    <form action="login" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button>Login</button>
    </form>

    <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
</div>

</body>
</html>