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

## 📸 App Screenshots

<p align="center">
  <img src="screenshots/Home Screen.jpeg" width="200"/>
  <img src="screenshots/Login Screen.jpeg" width="200"/>
  <img src="screenshots/Signup Screen.jpeg" width="200"/>
</p>

<p align="center">
  <img src="screenshots/SetBalance Screen.jpeg" width="200"/>
  <img src="screenshots/AddExpense Screen.jpeg" width="200"/>
  <img src="screenshots/Update Screen.jpeg" width="200"/>
</p>

<p align="center">
  <img src="screenshots/Delete Screen.jpeg" width="200"/>
  <img src="screenshots/Profile Screen.jpeg" width="200"/>
  <img src="screenshots/ForgotPassword Screen.jpeg" width="200"/>
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
