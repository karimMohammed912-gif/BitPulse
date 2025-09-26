# BitPulse
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/karimMohammed912-gif/BitPulse)

BitPulse is a comprehensive cryptocurrency tracking application built with Flutter. It provides real-time data, detailed charts, and portfolio management features to help users monitor the dynamic world of digital currencies.

## Features

- **Real-time Crypto Tracking**: View live prices, market cap, and 24-hour volume for a wide range of cryptocurrencies from the CoinGecko API.
- **Detailed Coin View**: Dive deep into any cryptocurrency with interactive price charts, historical data, and key market metrics.
- **User Authentication**: Secure sign-up and login functionality using Firebase Authentication.
- **Personal Watchlist**: Star your favorite cryptocurrencies to keep them in a dedicated watchlist for quick access. Local data persistence is managed using Hive.
- **Currency Exchange Calculator**: Convert between different cryptocurrencies with up-to-date exchange rates.
- **Advanced Search**: Quickly find any cryptocurrency by its name or symbol.
- **Customizable Themes**: Personalize your user experience by choosing from multiple app themes, including light and dark modes.

## Tech Stack & Architecture

BitPulse is built using a modern Flutter stack, emphasizing clean architecture and scalability.

- **Framework**: Flutter
- **Architecture**: Feature-Driven Architecture with a clean separation of layers (Presentation, Data).
- **State Management**: `flutter_bloc` / `Cubit` for predictable and scalable state management.
- **Routing**: `go_router` for a declarative, URL-based navigation system.
- **Networking**: `Dio` for efficient and powerful HTTP requests to the CoinGecko API.
- **Local Storage**: `Hive` for fast, on-device storage of user preferences and starred cryptocurrencies.
- **Authentication**: `Firebase Auth` for handling user registration and sign-in.
- **Dependency Injection**: `get_it` for managing dependencies and decoupling services.
- **Charting**: `fl_chart` for creating beautiful and interactive charts.

## Project Structure

The project is organized into two main directories within `lib/`:

-   **`lib/Features`**: Contains individual application features, each organized into its own sub-directory (e.g., `AuthFeature`, `HomeFeature`, `DetailsFeature`). This modular approach ensures that each feature is self-contained.
    -   `Data/`: Holds models and repository implementations.
    -   `Presentation/`: Contains UI (Views/Widgets) and state management (Cubits).
-   **`lib/core`**: Includes shared components, utilities, and core services used across multiple features.
    -   `Api/`: API service configuration.
    -   `Error/`: Custom error and failure handling classes.
    -   `Routes/`: `GoRouter` configuration and route definitions.
    -   `Themes/`: Application themes and a `ThemeCubit` for dynamic theme switching.
    -   `di/`: Dependency injection setup using `GetIt`.
    -   `utils/`: Constants, helper functions, and shared services like `StarService`.
    -   `widgets/`: Common widgets used throughout the application.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
-   Firebase Account: To set up authentication.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/karimmohammed912-gif/BitPulse.git
    cd BitPulse
    ```

2.  **Set up Firebase:**
    -   Create a new Firebase project.
    -   Add an Android and/or iOS app to your Firebase project.
    -   Download the `google-services.json` file for Android and place it in `android/app/`.
    -   Download the `GoogleService-Info.plist` file for iOS and place it in `ios/Runner/`.

3.  **Create Environment File:**
    Create a `.env` file in the root of the project and add your CoinGecko API key:
    ```
    Api_Key=YOUR_COINGECKO_API_KEY
    ```

4.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

5.  **Generate Hive models:**
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

6.  **Run the application:**
    ```sh
    flutter run
    ```

## Deployment

The repository includes scripts to simplify the deployment process for Android.

### Android Deployment via Fastlane

You can distribute the app to Firebase App Distribution using Fastlane.

1.  Navigate to the `android` directory:
    ```sh
    cd android
    ```

2.  Run the Fastlane command:
    ```sh
    fastlane firebase_distribute
    ```

### Android Deployment via Batch Script

On Windows, you can use the `deploy.bat` script to build the release APK and upload it to Firebase App Distribution.

```bat
deploy.bat
