<div align="center">

# 🎓 Student Performance & Attendance Tracker

### A comprehensive MySQL database system to track student academics, attendance, and faculty — built for real-world college management.

![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Database-orange?style=for-the-badge&logo=databricks&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

</div>

---

## 📽️ Project Demo

> 🎬 **Watch the full project walkthrough below — includes live SQL query execution and a brief overview of the system design.**

https://github.com/HarshalVora86/Student_performance_and_attendance_tracker/blob/main/demo/project_demo.mp4

> *(Click the link above to watch the demo video directly on GitHub)*

---

## 📌 Table of Contents

- [About the Project](#-about-the-project)
- [Database Schema](#-database-schema)
- [ER Diagram / Flowchart](#-er-diagram--entity-relationship-overview)
- [Key Features](#-key-features)
- [SQL Concepts Covered](#-sql-concepts-covered)
- [Sample Query Outputs](#-sample-query-outputs)
- [How to Run](#-how-to-run)
- [Screenshots](#-screenshots)
- [Project Structure](#-project-structure)
- [Author](#-author)

---

## 🧠 About the Project

This project is a **fully functional relational database system** built using **MySQL** to manage and analyze student academic data in a college environment.

It covers everything from **student registration** and **course enrollment** to **grade tracking**, **attendance monitoring**, and **faculty management** — all using raw SQL with no external frameworks.

> 💡 Designed to demonstrate core database engineering skills including schema design, normalization, complex joins, subqueries, window functions, and stored procedures.

---

## 🗂️ Database Schema

The database `student_tracker` contains **7 inter-related tables**:

| 🏷️ Table | 📋 Description |
|---|---|
| `students` | Student personal info, DOB, address, admission date |
| `faculty` | Faculty name, email, department assignment |
| `departments` | 10 academic departments |
| `courses` | Course catalogue linked to faculty |
| `enrollments` | Maps students to courses they are enrolled in |
| `grades` | Marks obtained per student per course |
| `attendance` | Per-class attendance records with status (Present/Absent/Late) |

---

## 🔗 ER Diagram / Entity-Relationship Overview

```
                    ┌─────────────────┐
                    │   departments   │
                    │─────────────────│
                    │ department_id PK│
                    │ department_name │
                    └────────┬────────┘
                             │ 1
              ┌──────────────┼──────────────┐
              │ N            │ N            │
    ┌─────────▼──────┐  ┌────▼────────┐  ┌─▼───────────┐
    │    students    │  │   faculty   │  │   courses   │
    │────────────────│  │─────────────│  │─────────────│
    │ student_id  PK │  │ faculty_id  │  │ course_id PK│
    │ name           │  │ name        │  │ course_name │
    │ dob            │  │ email       │  │ faculty_id FK│
    │ gender         │  │ phone_number│  └─────┬───────┘
    │ email          │  │ department_id│        │
    │ phone_number   │  └─────────────┘        │
    │ address        │                         │ 1
    │ admission_date │        ┌────────────────┘
    │ department_id FK        │ N
    └───────┬────────┘  ┌─────▼──────────┐
            │ 1         │  enrollments   │
            │           │────────────────│
            │ N         │ enrollment_id PK│
    ┌───────▼──────┐    │ student_id FK  │
    │  attendance  │    │ course_id FK   │
    │──────────────│    │ enrollment_date│
    │ attendance_id│    └───────┬────────┘
    │ student_id FK│            │
    │ course_id FK │            │ N
    │ date         │    ┌───────▼──────┐
    │ status       │    │    grades    │
    └──────────────┘    │──────────────│
                        │ grade_id PK  │
                        │ student_id FK│
                        │ course_id FK │
                        │marks_obtained│
                        └──────────────┘
```

---

## ✨ Key Features

- 🏛️ **Normalized Schema** — 3NF compliant with proper primary & foreign keys
- 📊 **Performance Analytics** — Rankings, averages, top performers using window functions
- 📅 **Attendance Monitoring** — Monthly summaries, absentee tracking, attendance %
- 🔗 **Multi-table JOINs** — INNER, LEFT, RIGHT, and CROSS JOINs used throughout
- 🪟 **Window Functions** — `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, running totals
- 🔄 **Subqueries & CTEs** — Correlated subqueries and `WITH` clause usage
- 🧮 **Aggregate Functions** — `COUNT`, `AVG`, `SUM`, `MAX`, `MIN` with `GROUP BY`
- 🔤 **String Functions** — `UPPER()`, `TRIM()`, `CONCAT()`, `COALESCE()` for data cleaning
- 📆 **Date Functions** — `TIMESTAMPDIFF`, `DATE_FORMAT`, `YEAR()` for time-based analysis
- 🔀 **CASE Statements** — Performance level categorization (Excellent / Good / Needs Improvement)
- 🚫 **NULL Handling** — `COALESCE()` and `IS NULL` checks throughout

---

## 📚 SQL Concepts Covered

```
✅ DDL          → CREATE, DROP, ALTER
✅ DML          → INSERT, UPDATE, DELETE
✅ DQL          → SELECT with complex filtering
✅ JOINs        → INNER, LEFT, RIGHT, CROSS
✅ Subqueries   → Correlated & non-correlated
✅ Window Funcs → RANK, DENSE_RANK, ROW_NUMBER, SUM OVER
✅ Aggregation  → GROUP BY, HAVING, COUNT, AVG, MAX, MIN
✅ String Ops   → UPPER, TRIM, CONCAT, COALESCE, LIKE
✅ Date Ops     → DATE_FORMAT, TIMESTAMPDIFF, YEAR, MONTH
✅ CASE         → Multi-condition branching
✅ SET Ops      → UNION, INTERSECT, EXCEPT
✅ Constraints  → PK, FK, UNIQUE, NOT NULL, ON DELETE
```

---

## 🖼️ Sample Query Outputs

### 📋 Database Tables Overview
![Database Tables and Faculty Data](screenshots/01_tables_faculty_students.png)

---

### 🏆 Top Performers & Attendance Summary
![Top Performers](screenshots/02_top_performers_attendance.png)

---

### 📉 Low Attendance & At-Risk Students
![Low Attendance Students](screenshots/03_low_attendance_atrisk.png)

---

### 📧 Student Info with NULL Handling
![Student Info with NULL](screenshots/04_student_info_null_handling.png)

---

### 📊 Department-wise Student Count & Course Averages
![Department and Course Stats](screenshots/05_department_course_stats.png)

---

### 👨‍🏫 Faculty-Course-Department Mapping
![Faculty Course Mapping](screenshots/06_faculty_course_department.png)

---

### 🔗 All Students with Department (LEFT JOIN)
![Student Department Join](screenshots/07_student_department_join.png)

---

### 📈 Student Marks — All Enrolled
![Student Marks](screenshots/08_student_marks_experience.png)

---

### 📆 Monthly Attendance Report & Admission Timeline
![Monthly Attendance](screenshots/09_monthly_attendance_timeline.png)

---

### 🔠 String Functions — UPPER, TRIM, COALESCE
![String Functions](screenshots/10_string_functions.png)

---

### 🪟 Window Functions — RANK & Running Total
![Window Functions Rank](screenshots/11_window_functions_rank.png)

---

### 🎯 CASE Statements — Performance & Attendance Categories
![CASE Performance](screenshots/12_case_performance_attendance.png)

---

## ⚙️ How to Run

### Prerequisites
- MySQL 8.0+ installed
- MySQL Workbench or any SQL client (DBeaver, TablePlus, etc.)

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/HarshalVora86/Student_performance_and_attendance_tracker.git

# 2. Open MySQL CLI or Workbench

# 3. Run the SQL file
mysql -u root -p < student_tracker.sql

# 4. Use the database
USE student_tracker;

# 5. Run any query from the queries section
SELECT * FROM students;
```

---

## 📁 Project Structure

```
Student_performance_and_attendance_tracker/
│
├── 📄 student_tracker.sql        # Main SQL file (schema + data + queries)
├── 📁 screenshots/               # Output screenshots (12 images)
│   ├── 01_tables_faculty_students.png
│   ├── 02_top_performers_attendance.png
│   ├── 03_low_attendance_atrisk.png
│   ├── 04_student_info_null_handling.png
│   ├── 05_department_course_stats.png
│   ├── 06_faculty_course_department.png
│   ├── 07_student_department_join.png
│   ├── 08_student_marks_experience.png
│   ├── 09_monthly_attendance_timeline.png
│   ├── 10_string_functions.png
│   ├── 11_window_functions_rank.png
│   └── 12_case_performance_attendance.png
├── 📁 demo/
│   └── project_demo.mp4          # Screen recording walkthrough
└── 📄 README.md
```

---

## 👤 Author

<div align="center">

**Harshal Vora**

[![GitHub](https://img.shields.io/badge/GitHub-HarshalVora86-181717?style=for-the-badge&logo=github)](https://github.com/HarshalVora86)

*Made with ❤️ and a lot of SQL queries*

</div>

---

<div align="center">

⭐ **If you found this project helpful, drop a star on the repo!** ⭐

</div>
