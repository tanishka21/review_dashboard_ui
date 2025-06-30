<img width="1680" alt="Screenshot 2025-06-30 at 9 12 07 PM" src="https://github.com/user-attachments/assets/ec784a22-376e-4304-9c40-2bc1dfe006a6" /># review_dashboard_ui

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

# Review Dashboard UI

![Review Dashboard UI Screenshot](path/to/your/main_dashboard_screenshot.png)

A modern and responsive Flutter UI for a review dashboard, designed to efficiently manage and review user accounts. This project showcases a clean design with dynamic elements like hover effects, filtering, and a responsive layout.

## Features

* **User Review Cards:** Displays individual user accounts with profile image, name, ID, and social media details.
* **Dynamic Action Buttons:** Accept/Decline buttons appear on hover for each review card, allowing quick actions.
* **Social Media Integration:** Shows connected social media platforms (Instagram, Facebook, TikTok, WhatsApp) with their respective icons and handles.
* **Account Statistics:** Clearly presents follower, following, and post counts for each user, separated by visual dividers.
* **Search and Filter Functionality:** Allows users to search by name/username and sort review accounts based on criteria like 'Date Connected', 'Name', and 'Followers'.
* **Sidebar Navigation:** A persistent sidebar on desktop of different sections of the dashboard. On mobile, it's accessible via a hamburger menu.
* **Themed UI:** Utilizes custom styles, dimensions, and color schemes for a consistent look and feel.

## Screenshots


* <img width="1680" alt="Screenshot 2025-06-30 at 9 12 07 PM" src="https://github.com/user-attachments/assets/c3752938-ac84-4048-89ec-e5a4d28d296a" />
(Overall dashboard view)
* <img width="1680" alt="Screenshot 2025-06-30 at 9 12 10 PM" src="https://github.com/user-attachments/assets/dcd37cc7-89fc-4117-8538-5dcb570fcbcf" />
           (Close-up of a review card with buttons visible)
* <img width="1680" alt="Screenshot 2025-06-30 at 9 12 10 PM" src="https://github.com/user-attachments/assets/321ada05-e9eb-4a9f-99dd-ac24c6e48adc" />
* <img width="1680" alt="Screenshot 2025-06-30 at 9 12 25 PM" src="https://github.com/user-attachments/assets/4d2501e8-5e88-442f-a516-1530000fde7c" />


## Installation

To get this project up and running on your local machine, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone <your-repository-url>
    cd review_dashboard_ui
    ```

2.  **Get Flutter dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```
    (You might want to specify a device, e.g., `flutter run -d chrome` for web, or `flutter run -d <device_id>` for a mobile emulator/device.)

## Project Structure

The core application logic and UI components are organized as follows:
Okay, I can help you create a README.md file based on the Flutter UI code and discussions we've had. This README will serve as documentation for your "Review Dashboard UI" project.

I'll structure it with common sections like:

Project Title

Description

Features (Based on the UI components we've discussed: review cards, sidebar, search/filter, hover effects)

Screenshots (Mentioning where to place them)

Installation (Standard Flutter setup)

Usage (How to run the app)

Project Structure (A high-level overview of your lib folder)

Dependencies (Key packages used)

Contributing (Standard placeholder)

License (Standard placeholder)

Markdown

# Review Dashboard UI

![Review Dashboard UI Screenshot](path/to/your/main_dashboard_screenshot.png)

A modern and responsive Flutter UI for a review dashboard, designed to efficiently manage and review user accounts. This project showcases a clean design with dynamic elements like hover effects, filtering, and a responsive layout.

## Features

* **User Review Cards:** Displays individual user accounts with profile image, name, ID, and social media details.
* **Dynamic Action Buttons:** Accept/Decline buttons appear on hover for each review card, allowing quick actions.
* **Social Media Integration:** Shows connected social media platforms (Instagram, Facebook, TikTok, WhatsApp) with their respective icons and handles.
* **Account Statistics:** Clearly presents follower, following, and post counts for each user, separated by visual dividers.
* **Responsive Layout:** Adapts the UI for both desktop/web and mobile views, featuring a collapsing sidebar for smaller screens.
* **Search and Filter Functionality:** Allows users to search by name/username and sort review accounts based on criteria like 'Date Connected', 'Name', and 'Followers'.
* **Sidebar Navigation:** A persistent sidebar on desktop provides easy navigation to different sections of the dashboard. On mobile, it's accessible via a hamburger menu.
* **Themed UI:** Utilizes custom styles, dimensions, and color schemes for a consistent look and feel.

## Screenshots

To showcase the application, consider adding screenshots here.
* `path/to/your/main_dashboard_screenshot.png` (Overall dashboard view)
* `path/to/your/review_card_hover_screenshot.png` (Close-up of a review card with buttons visible)
* `path/to/your/mobile_view_screenshot.png` (If applicable, a screenshot of the mobile/drawer view)

## Installation

To get this project up and running on your local machine, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone <your-repository-url>
    cd review_dashboard_ui
    ```

2.  **Get Flutter dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```
    (You might want to specify a device, e.g., `flutter run -d chrome` for web, or `flutter run -d <device_id>` for a mobile emulator/device.)

## Usage

* Navigate through the dashboard using the sidebar menu on desktop or the drawer on mobile.
* Use the search bar to filter review accounts by username, first name, or last name.
* Sort the review cards using the "Sort By" dropdown.
* Hover over a review card to reveal the "Accept" and "Decline" action buttons.
* Click "Filter", "Archive", or "Validate" buttons to simulate their respective actions (currently showing snackbars).

## Project Structure

The core application logic and UI components are organized as follows:

lib/
├── controller/             # GetX controllers for managing state and business logic
│   └── review_controller.dart
├── data/                   # Mock data or data sources
│   └── review_accounts_data.dart
├── model/                  # Data models (e.g., ReviewAccountModel)
│   └── review_accounts_model.dart
├── repository/             # Data repositories for abstracting data access
│   └── reviews_repository.dart
├── utils/                  # Utility classes (colors, dimensions, styles, constants, images)
│   ├── app_color.dart
│   ├── app_dimensions.dart
│   ├── app_style.dart
│   ├── constants.dart
│   └── image_constants.dart
└── view/                   # UI Screens and their widgets
└── Home/
├── home.dart       # Main dashboard screen
└── widgets/        # Widgets specific to the Home screen
├── filter_dropdown_widget.dart
├── review_card.dart        # The core review card UI
├── search_bar_widget.dart
└── sidebar_menu_widget.dart


## Dependencies

This project relies on the following key Flutter packages:

* `flutter_svg`: For displaying SVG images (social media icons, sidebar icons).
* `get`: A powerful solution for state management, dependency injection, and route management.

You can find the full list of dependencies in the `pubspec.yaml` file.

