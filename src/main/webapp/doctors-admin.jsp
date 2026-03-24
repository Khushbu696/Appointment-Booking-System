<%@ page import="java.util.*,com.appointment.dao.*,com.appointment.model.*" %>

<%
List<Doctor> doctors = DoctorDAO.getAllDoctors();
%>

<html>
<head>
<style>

body {
    margin: 0;
    font-family: Arial;
    display: flex;
}

/* Sidebar */
.sidebar {
    width: 240px;
    height: 100vh;
    background: linear-gradient(180deg, #2193b0, #176d85);
    color: white;
    padding-top: 30px;
    position: fixed;
}

.sidebar h2{
    text-align: center;
}

.sidebar a {
    display: block;
    padding: 14px;
    color: white;
    text-decoration: none;
}

.sidebar a.active,
.sidebar a:hover {
    background: rgba(255,255,255,0.2);
}

/* Main */
.main {
    margin-left: 240px;
    padding: 30px;
    width: 100%;
}

/* Topbar */
.topbar {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

input {
    padding: 10px;
    width: 250px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

/* Buttons */
.add-btn {
    background: #2193b0;
    color: white;
    padding: 10px 15px;
    text-decoration: none;
    border-radius: 6px;
}

.delete {
    background: red;
    color: white;
    padding: 6px 12px;
    border-radius: 5px;
    text-decoration: none; /* ✅ FIX underline */
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #2193b0;
    color: white;
    padding: 10px;
}

td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* No Data */
.no-data {
    text-align: center;
    margin-top: 20px;
    color: gray;
    display: none;
}

</style>

<script>
function searchDoctors() {
    let input = document.getElementById("search").value.toLowerCase();
    let rows = document.querySelectorAll("tbody tr");
    let visible = 0;

    rows.forEach(row => {
        let text = row.innerText.toLowerCase();

        if (text.includes(input)) {
            row.style.display = "";
            visible++;
        } else {
            row.style.display = "none";
        }
    });

    // ✅ FIX: Show/hide "No Data" but KEEP header visible
    document.getElementById("noData").style.display = visible === 0 ? "block" : "none";
}
</script>

</head>

<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="admin.jsp">Appointments</a>
    <a class="active" href="doctors-admin.jsp">Doctors</a>
    <a href="logout">Logout</a>
</div>

<div class="main">

<div class="topbar">
    <input type="text" id="search" placeholder="Search doctor..." onkeyup="searchDoctors()">
    <a class="add-btn" href="addDoctor.jsp">+ Add Doctor</a>
</div>

<table>
<thead> <!-- ✅ FIX: Separate header -->
<tr>
    <th>Name</th>
    <th>Specialization</th>
    <th>Fees</th>
    <th>Action</th>
</tr>
</thead>

<tbody>
<%
for(Doctor d : doctors){
%>
<tr>
    <td><%= d.getName() %></td>
    <td><%= d.getSpecialization() %></td>
    <td>Rs. <%= d.getFees() %></td>
    <td>
        <a class="delete" href="deleteDoctor?id=<%= d.getId() %>"
           onclick="return confirm('Delete this doctor?')">Delete</a>
    </td>
</tr>
<% } %>
</tbody>

</table>

<div id="noData" class="no-data">
    No doctors found
</div>

</div>

</body>
</html>