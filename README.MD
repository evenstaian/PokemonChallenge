#Pokemon Challenge - MVVM-C
#### _Using PokeAPI public API (https://pokeapi.co/)_
__Author: Evens Taian__

This project implements the __MVVM-C__ (Model-View-ViewModel-Coordinator) architectural pattern, enabling clean code maintenance, readability, well-defined responsibilities, and testability. The application was built following SOLID principles:

- Single Responsibility Principle
- Open-Closed Principle  
- Liskov Substitution Principle
- Interface Segregation Principle
- Dependency Inversion Principle

View development method: __ViewCode__ (UIKit)

### Project Architecture

The project is structured using MVVM-C pattern with the following components:

- **View (ViewController)**: Responsible for UI elements and user interactions
- **ViewModel**: Handles business logic and data transformation
- **Model**: Represents data structures
- **Coordinator**: Manages navigation flow between screens
- **Service**: Handles API communication

### Key Features

- Pokemon list with infinite scroll
- Pull to refresh functionality
- Pokemon details view
- Evolution chain visualization
- Support for both portrait and landscape orientations
- Network caching
- Mock data support for testing

### ViewCode Implementation

All custom views conform to the ViewCode protocol, ensuring consistent view setup. This approach provides:

- Full code control
- High customization
- Better readability
- Easy maintenance
- Minimal version control conflicts

### Dependency Injection & Abstractions

The project uses protocol-oriented programming and dependency injection. This approach:

- Enables easier testing through mock objects
- Reduces coupling between components
- Improves code maintainability
- Follows SOLID principles

### Network Layer

The networking layer is built with:
- Protocol-based API requests
- Response caching
- Error handling
- Mock data support for testing
- Reachability checking

### Screen Orientation Support

The application supports both portrait and landscape orientations with dynamic layout constraints. The layout automatically adjusts when the device orientation changes, providing a seamless user experience in any orientation.

### Testing Support

The project includes:
- Mock API implementation for testing
- Protocol-based dependencies for easy mocking
- Separate testing targets
- Network response simulation

### Requirements

- iOS 13.0+
- Xcode 13.0+
- Swift 5.0+

### Installation

1. Clone the repository
2. Open Pokemon Challenge.xcodeproj
3. Build and run the project

### Credits

This project uses the [PokeAPI](https://pokeapi.co/) for Pokemon data.
