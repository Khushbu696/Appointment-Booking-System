<%@ page import="java.util.*,com.appointment.dao.*,com.appointment.model.*" %>

<%
String isAdmin = (String) session.getAttribute("admin");
if(isAdmin == null){
    response.sendRedirect("login.jsp");
    return;
}

List<Appointment> list = AppointmentDAO.getAllAppointments();
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

.sidebar h2 {
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

/* Top Bar */
.topbar {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}

input, select {
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
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

/* Buttons */
.btn {
    padding: 6px 10px;
    color: white;
    border-radius: 5px;
    text-decoration: none;
}

.green { background: green; }

.no-data {
    text-align: center;
    padding: 20px;
    color: gray;
}

</style>

<script>
function filterTable() {
    let search = document.getElementById("search").value.toLowerCase();
    let status = document.getElementById("status").value;

    let rows = document.querySelectorAll("tbody tr");
    let visible = 0;

    rows.forEach(row => {
        let text = row.innerText.toLowerCase();
        let rowStatus = row.getAttribute("data-status");

        let matchSearch = text.includes(search);
        let matchStatus = (status === "" || rowStatus === status);

        if (matchSearch && matchStatus) {
            row.style.display = "";
            visible++;
        } else {
            row.style.display = "none";
        }
    });

    document.getElementById("noData").style.display = visible === 0 ? "block" : "none";
}
</script>

</head>

<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a class="active" href="admin.jsp">Appointments</a>
    <a href="doctors-admin.jsp">Doctors</a>
    <a href="logout">Logout</a>
</div>

<div class="main">

<h2>Appointments</h2>

<div class="topbar">
    <input type="text" id="search" placeholder="Search patient or doctor..." onkeyup="filterTable()">

    <select id="status" onchange="filterTable()">
        <option value="">All Status</option>
        <option value="BOOKED">BOOKED</option>
        <option value="COMPLETED">COMPLETED</option>
        <option value="CANCELLED">CANCELLED</option>
    </select>
</div>

<table>
<thead>
<tr>
    <th>Patient</th>
    <th>Doctor</th>
    <th>Date</th>
    <th>Time</th>
    <th>Status</th>
    <th>Action</th>
</tr>
</thead>

<tbody>

<%
for(Appointment a : list){
%>
<tr data-status="<%= a.getStatus() %>">
    <td><%= a.getPatientName() %></td>
    <td><%= a.getDoctorName() %></td>
    <td><%= a.getDate() %></td>
    <td><%= a.getTimeSlot() %></td>
    <td><%= a.getStatus() %></td>

    <td>
    <% if("BOOKED".equals(a.getStatus())){ %>
        <a class="btn green" href="complete?id=<%= a.getId() %>">Complete</a>
    <% } else { %>
        -
    <% } %>
    </td>
</tr>
<% } %>

</tbody>
</table>

<div id="noData" class="no-data" style="display:none;">
    No results found
</div>

</div>

</body>
</html>