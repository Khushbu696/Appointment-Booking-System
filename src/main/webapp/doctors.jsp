<%@ page import="java.util.*,com.appointment.dao.*,com.appointment.model.*" %>

<html>
<head>
<style>

body {
    font-family: Arial;
    margin: 0;
    background: #f4f6f9;
    padding: 40px;
}

/* Title */
h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* Search bar */
.search-box {
    text-align: center;
    margin-bottom: 20px;
}

.search-box input {
    padding: 10px;
    width: 300px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

/* Table */
table {
    width: 70%;
    margin: auto;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    border-radius: 10px;
    overflow: hidden;
}

th, td {
    padding: 15px;
    text-align: center;
}

th {
    background: #2193b0;
    color: white;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

tr:hover {
    background: #e6f2f5;
}

/* Button */
.btn {
    padding: 8px 15px;
    background: #2193b0;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.btn:hover {
    background: #176d85;
}

</style>

<script>
// 🔍 Simple search
function searchDoctor() {
    let input = document.getElementById("search").value.toLowerCase();
    let rows = document.querySelectorAll("tbody tr");

    rows.forEach(row => {
        let text = row.innerText.toLowerCase();
        row.style.display = text.includes(input) ? "" : "none";
    });
}
</script>

</head>

<body>

<h2>Doctors List</h2>

<div class="search-box">
    <input type="text" id="search" placeholder="Search by name or specialization..." onkeyup="searchDoctor()">
</div>

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Specialization</th>
            <th>Action</th>
        </tr>
    </thead>

    <tbody>
    <%
    List<Doctor> list = DoctorDAO.getAllDoctors();
    for(Doctor d : list){
    %>
        <tr>
            <td><%= d.getName() %></td>
            <td><%= d.getSpecialization() %></td>
            <td>
                <a class="btn" href="book.jsp?id=<%= d.getId() %>&name=<%= d.getName() %>">Book</a>
            </td>
        </tr>
    <%
    }
    %>
    </tbody>

</table>

</body>
</html>