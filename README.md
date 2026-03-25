# 🏥 Appointment Booking System

A full-stack web application that allows users to register, login, view doctors, and book appointments. Built using **Java (JSP/Servlets)**, **MySQL**, and deployed on **Railway**.

---

## Live Deployed Link

```text
https://appointment-booking-system-production-ed4c.up.railway.app
```

---

## 📷 Preview

User Dashboard
![User Dashboard](./screenshots/appointment_user.jpeg)

Admin Panel
![Admin Panel](./screenshots/appointment_admin.jpeg)

---

## 🚀 Features

* 👤 User Registration & Login
* 👨‍⚕️ View Doctors with Specialization & Fees
* 📅 Book Appointments
* 📋 View Appointment Details
* 🔐 Secure Database with Foreign Key Relationships
* 🌐 Deployed Online using Railway

---

## 🛠️ Tech Stack

* **Frontend:** HTML, CSS, JSP
* **Backend:** Java Servlets
* **Database:** MySQL
* **Server:** Apache Tomcat
* **Deployment:** Railway

---

## 🗂️ Database Schema

### 🔹 Users Table

* id (PK)
* name
* email (unique)
* password

### 🔹 Doctors Table

* id (PK)
* name
* specialization
* fees

### 🔹 Appointments Table

* id (PK)
* patient_name
* doctor_id (FK)
* user_id (FK)
* appointment_date
* time_slot
* phone
* reason
* status

---

## ⚙️ Environment Variables

The application uses environment variables for database connection:

```env
DB_URL=jdbc:mysql://<host>:<port>/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
DB_USER=root
DB_PASS=<your_password>
```

---

## 🧩 How to Run Locally

1. Clone the repository:

```bash
git clone https://github.com/your-username/appointment-booking-system.git
```

2. Import into IDE (Eclipse/IntelliJ)

3. Configure MySQL:

```sql
CREATE DATABASE appointment_db;
```

4. Run SQL schema (tables + inserts)

5. Deploy on Apache Tomcat

6. Access:

```text
http://localhost:8080/AppointmentBookingSystem/
```

---

## 🌐 Deployment

The project is deployed using **Railway**.

Steps:

1. Push code to GitHub
2. Connect GitHub repo to Railway
3. Add MySQL service
4. Set environment variables
5. Deploy project
6. Generate public domain

---

## 🔮 Future Enhancements

* Payment Integration
* Email Notifications
* Responsive UI
