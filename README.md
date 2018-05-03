<p align="center">
    <img src="https://raw.githubusercontent.com/piknotech/SwiftyHelpers/stable/Logo.png" width=600>
</p>

<p align="center">
    <a href="https://travis-ci.org/piknotech/SwiftyHelpers">
        <img src="https://travis-ci.org/piknotech/SwiftyHelpers.svg?branch=stable" alt="Build Status">
    </a>
    <a href="#">
        <img src="https://img.shields.io/badge/Swift-4.1-FFAC45.svg" alt="Swift: 4.1">
    </a>
    <a href="https://github.com/piknotech/SwiftyHelpers/blob/stable/LICENSE.md">
        <img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="License: MIT">
    </a>
</p>

<p align="center">
    <a href="#documentation">Documentation</a>
  • <a href="https://github.com/piknotech/SwiftyHelpers/issues">Issues</a>
  • <a href="https://github.com/piknotech/SwiftyHelpers/pulls">Pull Requests</a>
  • <a href="#contributing">Contributing</a>
  • <a href="#license">License</a>
</p>

*SwiftyHelpers* is collection of handy Swift helper types we use in most of our iOS apps. Some are more broad, others only make sense in conjunction with common iOS / third-party APIs.

As we consider **these helpers** and **the corresponding helper categorization pattern** useful for others too, we've decided to put them up on GitHub. Yet, with them belonging into different categories and often requiring project-specific configuration, they aren't bundled in a single framework, but provided as single files (despite having some cross-references). In order to be able to build and test the project, all files are nonetheless part of a static cocoa touch library of no further use.

When using any of these types in an app, we suggest just using the same file structure as in this repo: Add a *Helpers* folder with three subfolders *Managers*, *Actors* and *Infos*. This way, even in larger projects, locating helpers will be straightforward.

## Documentation

### Helpers

As this repo is rather considered a loose collection of handy helpers that often even have to be modified depending on the app, single helpers aren't documented specifically. Please refer to the source files on how to use them.

### Helper Categorization Pattern

You'll find three types of helpers in this repo:
- A **Singleton Manager Class** is a `class` with a singleton `shared` property, a private initializer to disallow construction other than of the singleton `shared` property, and various non-static interfaces like methods or properties, e. g. `AppReviewManager`.
- A **Static Actor Class** is a `class` with solely static interfaces and a private initializer to disallow construction. In contrast to singleton manager classes, it is expected not to offer any interfaces other than methods or computed properties. It is expected to always deliver the same result on execution, independent on app state. This means that configuration e. g. is not allowed. Also methods that should only be executed once, don't fit here. An example for a static actor class is `Delay`, which only provides methods always doing the exact same thing without the need for any configuration.
- A **Static Info Struct** is a `struct` with a solely static interface and a private initializer to disallow construction. It should only offer information on a specific matter (e. g. the app version (`VersionInfo`)), but not do anything apart from possibly calculating some information.

Just looking at the helpers already included should help understanding this categorization pattern and gaining a feeling which helper type should be used for which need.

#### `class` and `struct`

**Note**: The use of `class` or `struct` for the different helper types is carefully considered. While `struct` is generally more lightweight and therefore encourageable to use, there are a few downsides to it:
- Only a `class` can inherit from `NSObject`, which is often needed for delegate conformances (`SKProductsRequestDelegate` for instance).
- Only a `class` can expose methods to the obj-c runtime using `@objc` (needed for selectors).
That's why both **Singleton Managers** and **Static Actors** are a `class` while **Static Infos** remain a `struct`.

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](https://github.com/piknotech/SwiftyHelpers/blob/stable/CONTRIBUTING.md) for in-depth information.

## License
This library is released under the [MIT License](http://opensource.org/licenses/MIT). See [LICENSE.md](https://github.com/piknotech/SwiftyHelpers/blob/stable/LICENSE.md) for details.
