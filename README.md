# FinSight

A high-performance, simple and efficient android application built to help manage personal finances.

### List of Contents
- [🚀 Technologies Used](#-technologies-used)
- [🏗️ Architecture](#️-architecture)
- [✨ Features in this application](#-features-in-this-application)
- [📱 Screenshots](#-screenshots)
- [✨ Features that will be in this application](#-features-that-will-be-in-this-application)

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

## ✨ Features in this application
- Expense Tracking: Record and categorize daily spending.
- History & Visualization: The expense history feature is equipped with an annual expense graph to display financial trends.
- Local Storage: All data is stored securely on your device using SQLite.

## 📱 Screenshots
<div align="center">
    <a href="url"><img src="https://github.com/bima1313/finSight/blob/main/screenshots/Screenshot_2026-06-03-16-18-24-77_6a9a7df4aae2632eb61a1bb15503a7a2.jpg" height="635" width="300" hspace="25"></a>    
    <a href="url"><img src="https://github.com/bima1313/finSight/blob/main/screenshots/Screenshot_2026-06-03-21-03-51-41_6a9a7df4aae2632eb61a1bb15503a7a2.jpg" height="635" width="300" hspace="25"></a>  </a>  
</div>
<br>
<div align="center">
    <a href="url"><img src="https://github.com/bima1313/finSight/blob/main/screenshots/Screenshot_2026-06-03-21-03-58-54_6a9a7df4aae2632eb61a1bb15503a7a2.jpg" height="635" width="300" hspace="25"></a>
    <a href="url"><img src="https://github.com/bima1313/finSight/blob/main/screenshots/Screenshot_2026-06-03-21-04-28-43_6a9a7df4aae2632eb61a1bb15503a7a2.jpg" height="635" width="300"></a>        
</div>

## ✨ Features that will be in this application
- Localization (Multi-language): Support Indonesian and English Language
- Dark Theme: Dark theme option for visual comfort.
- Income Tracking: Added income recording feature so that the application does not only record expenses.
