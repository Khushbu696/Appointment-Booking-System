<html>

<head>
    <title>Book Appointment</title>
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
            padding: 30px;
            border-radius: 12px;
            width: 380px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
        }

        input, select, textarea, button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            background: #2193b0;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #176d85;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>

<div class="card">
    <h2>Book Appointment</h2>

    <!-- ERROR -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="book" method="post">

        <!-- Doctor -->
        <%
            String doctorId = request.getParameter("id");
            String doctorName = request.getParameter("name");
        %>

        <input type="text" value="<%= doctorName %>" readonly>

        <input type="hidden" name="doctor" value="<%= doctorId %>">
        <input type="hidden" name="doctorName" value="<%= doctorName %>">

        <!-- Name -->
        <input type="text" name="name"
               value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>"
               placeholder="Enter Name" required>

        <!-- Date -->
        <input type="date" name="date"
               value="<%= request.getAttribute("date") != null ? request.getAttribute("date") : "" %>"
               required>

        <!-- Time Slot -->
        <%
            String selectedSlot = (String) request.getAttribute("timeSlot");
        %>

        <select name="timeSlot" required>
            <option value="">Select Time Slot</option>

            <option <%= "09:00 AM - 10:00 AM".equals(selectedSlot) ? "selected" : "" %>>
                09:00 AM - 10:00 AM
            </option>

            <option <%= "10:00 AM - 11:00 AM".equals(selectedSlot) ? "selected" : "" %>>
                10:00 AM - 11:00 AM
            </option>

            <option <%= "11:00 AM - 12:00 PM".equals(selectedSlot) ? "selected" : "" %>>
                11:00 AM - 12:00 PM
            </option>

            <option <%= "02:00 PM - 03:00 PM".equals(selectedSlot) ? "selected" : "" %>>
                02:00 PM - 03:00 PM
            </option>

            <option <%= "03:00 PM - 04:00 PM".equals(selectedSlot) ? "selected" : "" %>>
                03:00 PM - 04:00 PM
            </option>
        </select>

        <!-- Phone -->
        <input type="text" name="phone"
               value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>"
               placeholder="Enter Phone Number" required>

        <!-- Reason -->
        <textarea name="reason"
                  placeholder="Describe your problem..."><%= request.getAttribute("reason") != null ? request.getAttribute("reason") : "" %></textarea>

        <button type="submit">Book Appointment</button>

    </form>
</div>

</body>
</html>