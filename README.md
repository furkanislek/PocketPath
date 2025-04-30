## PocketPath: Your Personal Finance Tracker

![Cream Simple Get App Instagram Story](https://github.com/user-attachments/assets/2605967e-39d5-484b-b2a9-958ba08df418)

PocketPath is a Flutter-based mobile application designed to help users manage their personal finances effectively. It allows tracking income and expenses, setting financial targets, and analyzing spending patterns through intuitive charts and summaries.

### Key Features

*   **Expense & Income Tracking:** Easily log daily expenditures and income sources.
*   **Target Setting:** Define financial goals (e.g., saving targets, budget limits) and track progress.
*   **Data Visualization:** Understand your financial habits with clear charts and graphs (e.g., spending by category, progress towards targets).
*   **Calendar View:** Visualize spending patterns over time using an integrated calendar.
*   **Authentication:** Secure user accounts using Firebase Authentication.
*   **Cloud Storage:** Store financial data securely using Cloud Firestore.
*   **Ad Integration:** Includes Google Mobile Ads integration.

### Technologies Used

*   **Framework:** Flutter (v3.x)
*   **State Management & Navigation:** GetX
*   **Backend:** Firebase (Authentication, Cloud Firestore)
*   **Charting:** `syncfusion_flutter_charts`, `fl_chart`
*   **UI Components:** `percent_indicator`, `calendar_timeline`, `smooth_page_indicator`, `drop_down_list`
*   **Ads:** `google_mobile_ads`
*   **Utilities:** `intl`, `date_format`, `uuid`

### Project Structure

The project follows a standard Flutter structure, organizing code into logical directories:

*   `lib/`: Contains the core Dart code.
    *   `main.dart`: Application entry point.
    *   `controller/`: Houses GetX controllers for state management and business logic (e.g., `AuthController`, `BottomNavigationController`).
    *   `pages/`: Contains individual screen widgets (e.g., `Home`, `Login`, `Analysis`, `AddCost`, `Target`).
    *   `components/`: Reusable UI widgets.
    *   `services/`: Service classes (e.g., `AdService`).
    *   `Introduction/`: Likely contains onboarding or introductory screens.
    *   `firebase_options.dart`: Firebase configuration.
*   `assets/`: Static assets like images and SVGs.
*   `fonts/`: Custom fonts used in the application.
*   `android/`, `ios/`, `web/`, etc.: Platform-specific configuration and code.
*   `pubspec.yaml`: Project dependencies and metadata.

### Getting Started

To run this project locally, follow these steps:

1.  **Prerequisites:**
    *   Flutter SDK installed (check `pubspec.yaml` for compatible version).
    *   A configured Firebase project.
    *   An editor like VS Code or Android Studio with Flutter plugins.

2.  **Clone the Repository:**
    ```bash
    git clone https://github.com/furkanislek/PocketPath.git
    cd PocketPath
    ```

3.  **Configure Firebase:**
    *   Follow the Firebase setup instructions for Flutter: [https://firebase.google.com/docs/flutter/setup](https://firebase.google.com/docs/flutter/setup)
    *   Place your platform-specific Firebase configuration files (e.g., `google-services.json` for Android, `GoogleService-Info.plist` for iOS) in the respective directories (`android/app/`, `ios/Runner/`).
    *   Ensure Authentication (likely Email/Password) and Firestore are enabled in your Firebase project.

4.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

5.  **Run the App:**
    ```bash
    flutter run
    ```

### Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues to improve the application.

### License

This project is currently unlicensed (or check the repository for a specific license file if added later).

### ScreenShots
![Cream Simple Get App Instagram Story Kopyası](https://github.com/user-attachments/assets/30148249-26a8-443e-b704-83d1db32272c)![Cream Simple Get App Instagram Story Kopyası Kopyası](https://github.com/user-attachments/assets/8df09039-cd95-438d-a3eb-d4278304d9bb)


