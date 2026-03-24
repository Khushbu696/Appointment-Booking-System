<html>
<head>
<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(135deg, #2193b0, #6dd5ed);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 12px;
    width: 350px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

input, button {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
}

button {
    background: #2193b0;
    color: white;
    border: none;
}
</style>
</head>

<body>

<div class="card">
    <h2>Add Doctor</h2>

    <form action="addDoctor" method="post">
        <input type="text" name="name" placeholder="Doctor Name" required>
        <input type="text" name="specialization" placeholder="Specialization" required>
        <input type="number" name="fees" placeholder="Fees" required>
        <button>Add Doctor</button>
    </form>
</div>

</body>
</html>