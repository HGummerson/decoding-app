
# Project: Note Decoder
Note Decoder is a Swift-based app that translates encoded notes into readable text and corrects any spelling errors. The app utilizes SwiftUI for its user interface and leverages UITextChecker to detect and correct misspelled words. Intended to help those who changes their IOS keyboard to the letters/symbols and type normally when in a situation they need to keep something private or secret

## Features

### Home Screen
- A welcome screen with navigation to the text input screen.
- Accessible via a clear "Begin Decoding" button.
- Text Input Screen

Allows users to paste or type encoded text.
Automatically translates and corrects spelling errors.
Includes a functional "Back" button to return to the home screen.
Technical Details
Text Parsing
The app uses a TextParser class to convert encoded input into readable text.

### Spell Checking
The UITextChecker framework is used to check for spelling errors and suggest corrections.

### SwiftUI Navigation

Navigation is managed using NavigationView and NavigationLink.
Accessibility identifiers are added for UI testing purposes.

## Accessibility
All buttons and UI elements are equipped with accessibility identifiers for easy testing using XCTest.

## How to Run
1. Open the project in Xcode.
2. Select a simulator or connect a physical device.
3. Click the Run button to launch the app.

## Future Improvements
- More accurate translations, multiple keys could be the same letter
- prediction and more personalized dictionary and spell checking
- Add support for more encoding formats.
- Improve error handling and user feedback for unsupported inputs.
- Keep history and store in a journal setting

## Testing
Unit tests are written using XCTest.
Navigation and core functionalities are verified with UI tests.

## Contributions
This project is currently a work in progress to learn swift and mobile development. 
