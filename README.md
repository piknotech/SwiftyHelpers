# SwiftySnippets

*SwiftySnippets* is collection of handy Swift snippets I use in most of my iOS apps. Some may be more broad, others might only make sense in conjunction with different iOS APIs.

As I consider them useful for others too, I've decided to put them up on GitHub. Yet, with them belonging into different categories, they aren't bundled in a single framework, but provided as single files. In order to be able to be able to build the project, all files are nonetheless part of a static cocoa touch library of no further use.

Please note that there are also some references across the files.

## Documentation

You'll find two types of code files in this repo – *Manager Classes* & *Info Structs*:
- **Manager Classes** are by design singleton classes that, *as you probably guessed*, manage something, e. g. app review requests.
- **Info Structs** are designed as purely static structs, that just provide static variables with information on a matter, e. g. the app's version.

As this repo is rather considered a collection of handy snippets that often have to be modified for different apps, no specific documentation is provided. Please refer to the source files on how to use the classes / structs.

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](https://github.com/fredpi/SwiftySnippets/blob/stable/CONTRIBUTING.md) for in-depth information.

## License
This library is released under the [MIT License](http://opensource.org/licenses/MIT). See [LICENSE.md](https://github.com/fredpi/SwiftySnippets/blob/stable/LICENSE.md) for details.
