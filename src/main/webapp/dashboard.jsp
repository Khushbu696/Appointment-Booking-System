<%@ page import="com.appointment.model.User" %>
<%@ page import="java.util.*,com.appointment.dao.*,com.appointment.model.*" %>

<%
User user = (User) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

// ✅ Get type from URL
String type = request.getParameter("type");

List<Appointment> list;

if("history".equals(type)){
    list = AppointmentDAO.getPast(user.getId());
} 
else if("upcoming".equals(type)){
    list = AppointmentDAO.getUpcoming(user.getId());
} 
else {
    list = AppointmentDAO.getAppointmentsByUser(user.getId());
}
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
    margin-bottom: 30px;
}

.sidebar a {
    display: block;
    padding: 14px 20px;
    color: white;
    text-decoration: none;
    font-size: 15px;
}

/* ✅ Active + Hover */
.sidebar a:hover,
.sidebar a.active {
    background: rgba(255,255,255,0.2);
}

/* Main Content */
.main {
    margin-left: 240px;
    padding: 40px;
    width: 100%;
    background: #f4f6f9;
    min-height: 100vh;
}

/* Header */
.header {
    margin-bottom: 30px;
}

/* Card */
.card {
    background: white;
    padding: 25px;
    border-radius: 12px;
    width: 100%;
    max-width: 900px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

/* Button */
.btn {
    padding: 6px 12px;
    background: #e74c3c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
}

.btn:hover {
    background: #c0392b;
}

/* Table */
table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 10px;
}

th, td {
    text-align: center;
    padding: 10px;
}

th {
    background: #2193b0;
    color: white;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Hello, <%= user.getName() %></h2>

    <!-- ✅ Active tab logic -->
    <a class="<%= (type == null) ? "active" : "" %>" href="dashboard.jsp">Dashboard</a>
    <a href="doctors.jsp">Book Appointment</a>
    <a class="<%= "upcoming".equals(type) ? "active" : "" %>" href="dashboard.jsp?type=upcoming">Upcoming</a>
    <a class="<%= "history".equals(type) ? "active" : "" %>" href="dashboard.jsp?type=history">History</a>
    <a href="logout">Logout</a>
</div>

<!-- Main Content -->
<div class="main">

    <div class="header">
        <h1>Dashboard</h1>
        <p>Welcome back! Manage your appointments easily.</p>
    </div>

    <div class="card">

<!-- ✅ Dynamic Heading -->
<h3>
<%
if("history".equals(type)){
    out.print("Past Appointments");
} 
else if("upcoming".equals(type)){
    out.print("Upcoming Appointments");
} 
else {
    out.print("Your Appointments");
}
%>
</h3>

<%
if(list.isEmpty()){
%>
    <p>No Appointments Found</p>
    <a class="btn" style="background:#2193b0;" href="doctors.jsp">Book Appointment</a>

<%
} else {
%>

    <table>
        <tr>
            <th>Doctor</th>
            <th>Date</th>
            <th>Time</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

    <%
    for(Appointment a : list){
    %>
        <tr>
            <td><%= a.getDoctorName() %></td>
            <td><%= a.getDate() %></td>
            <td><%= a.getTimeSlot() %></td>
            <td><%= a.getReason() %></td>
            
            <td>
                <% if("BOOKED".equals(a.getStatus())){ %>
                <span style="color:green;">BOOKED</span>
                <% } else if("CANCELLED".equals(a.getStatus())){ %>
                <span style="color:red;">CANCELLED</span>
                <% } else { %>
                <span><%= a.getStatus() %></span>
                <% } %>
            </td>
            
            <td>
                <% if("BOOKED".equals(a.getStatus())){ %>
                <a class="btn" href="cancel?id=<%= a.getId() %>" onclick="return confirm('Cancel this appointment?')"> Cancel </a>
                <% } else { %>
                <span style="color: gray;">N/A</span>
                <% } %>
            </td>
        </tr>
    <%
    }
    %>

    </table>

<%
}
%>

    </div>

</div>

</body>
</html>