# FinSight

A high-performance, simple and efficient android application built to help manage personal finances.

## 🚀 Technologies Used

|    Technology    |    Purpose     |
|   -------------  | -------------  | 
| Flutter          | Cross-platform mobile framework. |
| SQLite           | Local database for persistent storage. |
| GetX             | State management, routing, and dependency injection. |

## 🏗️ Architecture
This project implements Clean Architecture to ensure the code is scalable, testable, and easy to maintain. The codebase is divided into three main layers:

1. Data Layer: Handles data sources (SQLite), repositories implementation, and models.
2. Domain Layer: Contains the core business logic, including entities and use cases.
3. Presentation Layer: Manages the UI components and state logic using GetX Controllers.

## ✨ Features that will be in this application
- Expense Tracking: Record and categorize daily spending.
- History & Visualization: The expense history feature is equipped with an annual expense graph to display financial trends.
- Local Storage: All data is stored securely on your device using SQLite.
- Localization (Multi-language): Support Indonesian and English Language
- Dark Theme: Dark theme option for visual comfort.
- Income Tracking: Added income recording feature so that the application does not only record expenses.
