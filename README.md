# RepoFinder

`RepoFinder` is an iOS app built using SwiftUI that fetches and displays public GitHub repositories. The app shows each repository’s name, owner details, and creation date. Additionally, users can view more details about a specific repository upon selection.

## Features

- **Fetch Public Repositories:** Retrieve a list of public GitHub repositories using the provided GitHub API endpoint.
- **Repository List Items:**
  - **Repository Name**
  - **Owner's Name**
  - **Owner's Avatar Image**
  - **Creation Date:** 
    - If the repository was created within the last 6 months, display the date in the format `Thursday, Oct 22, 2020`.
    - If the repository is older than 6 months, show it in relative time like “8 months ago”, “2 years ago”, etc.
    - If the creation date is missing in the API response, programmatically generate it using Swift’s `Date` object.
- **Detailed View:** Tapping on a repository opens a detailed screen showing more repository information.

## Technical Architecture
- **Native Network Layer:** The network layer is implemented natively in Swift using `URLSession` without relying on any third-party libraries.
- **Async/Await:** Modern `async/await` syntax is used for handling asynchronous API requests.
- **Image Loading:** Images (avatars) are loaded natively in Swift without third-party image-loading libraries.

`RepoFinder` follows the **Clean Architecture** pattern, structured into three key layers: **Domain**, **Presentation**, and **Data**.

### Layers:

- **Domain Layer:** 
  - The heart of the app's business logic, containing use cases that define the core operations.
  
- **Presentation Layer:**
  - This layer handles all user interface elements using SwiftUI, including the `ViewModel` to supply data to the UI and `Coordinator` to manage navigation.

- **Data Layer:** 
  - Responsible for managing the app’s data. It interacts with external sources (like the GitHub API) to fetch repository data.

### Advantages of Clean Architecture:

1. **Separation of Concerns:** Cleanly separates different parts of the app (business logic, UI, and data) to ensure each layer has a single responsibility.
2. **Testability:** The architecture promotes testable code by decoupling the UI from the business logic, making it easy to write unit tests for the Domain layer.
3. **Scalability:** As new features are added, Clean Architecture ensures that the code remains maintainable, allowing for easy enhancements.
4. **Maintainability:** Modifications or updates to one layer, such as changing the data source or updating the UI, don’t affect other layers, making the app easy to maintain.
5. **Flexibility:** The modular nature of Clean Architecture allows for independent development and refactoring of different layers without major disruptions.

## Screenshots
<img src="https://github.com/user-attachments/assets/522044e5-bff3-4b75-a404-0a6e71a7af64" width="370" height="800"> <img src="https://github.com/user-attachments/assets/01c3ca42-b047-4dc8-bdd2-3a37e7738396" width="370" height="800">
