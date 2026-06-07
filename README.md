# 💰 MyExpenseTracker App

A modern **Flutter Expense Tracker Application** built using **Firebase** and clean architecture principles.  
This app helps users track their income, expenses, and remaining balance in real time with a clean and responsive UI.

---

# 🚀 Features

- 🔐 Firebase Authentication (Login / Signup / Logout)
- 💵 Set Initial Balance
- ➕ Add Expenses
- ✏️ Update Expenses
- 🗑 Delete Expenses
- 📊 Real-time Remaining Balance Calculation
- 📅 Expense Date Tracking
- 🧾 Category-based Expense Management
- 🔄 Live Firestore Updates (Stream-based UI)
- 📱 Clean & Responsive UI Design

---



## 📸 App Screenshots

<p align="center">
  <img src="screenshots/Login_Screen.jpeg" width="200"/>
  <img src="screenshots/Signup_Screen.jpeg" width="200"/>
  <img src="screenshots/ForgotPassword_Screen.jpeg" width="200"/>
  
</p>

<p align="center">
  <img src="screenshots/Home_Screen.jpeg" width="200"/>
  <img src="screenshots/AddExpense_Screen.jpeg" width="200"/>
  <img src="screenshots/Update_Screen.jpeg" width="200"/>
</p>

<p align="center">
  <img src="screenshots/Delete_Screen.jpeg" width="200"/>
   <img src="screenshots/SetBalance_Screen.jpeg" width="200"/>
     <img src="screenshots/Profile_Screen.jpeg" width="200"/>
</p>
---

# 🛠 Tech Stack

- Flutter (Latest Stable)
- Dart
- Firebase Authentication
- Cloud Firestore
- Provider (State Management)
- Google Fonts
- Intl Package

---

# 🏗 Project Architecture
lib/
│
├── features/
│ ├── auth/
│ ├── expenses/
│ ├── profile/
│ └── widgets/
│
├── services/
├── provider/
├── model/
└── main.dart


# 🔥 Firestore Structure
user
   └── uid
        ├── name
        ├── email
        ├── initialBalance
        │
        └── expense
              ├── title
              ├── amount
              ├── note
              └── createdAt

👨‍💻 Developer
Developed by Raees Khan
GitHub:
https://github.com/raeeskhan371/MyExpenseTracker_App
