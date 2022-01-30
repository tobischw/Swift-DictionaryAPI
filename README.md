# Swift-DictionaryAPI
Swift API client for the free dictionary API @ https://dictionaryapi.dev/

## Installation

### SwiftPM

```
https://github.com/tobischw/Swift-DictionaryAPI.git, :branch="main"
```

## Example Usage

```swift
import DictionaryAPI

DictionaryAPI().getDefinitions(forWord: "spicy") { result in
    switch result {
        case .success(let definitions):
            definitions.forEach { definition in
                print("--- \"\(definition.definition)\"")
                print("e.g. \(definition.example)")
            }
        case .failure(let error):
            print(error)
    }
}

/// Prints:
/// --- "flavoured with or fragrant with spice."
/// e.g. Optional("pasta in a spicy tomato sauce")

```
