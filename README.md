# ZarFilm Standalone for macOS

A lightweight native macOS web application wrapper built with Swift, Cocoa, and WebKit.

## Features

- Native macOS application window
- Embedded WebKit browser
- Back navigation and page reload
- Full-screen mode
- Editable website address
- Remembers the selected address locally
- Opens external URL schemes with the macOS default handler
- Supports popup links inside the existing window

## Requirements

- macOS 12.0 or later
- Xcode Command Line Tools
- Swift compiler
- Intel Mac (x86_64)

## Build

Run:

    ./Scripts/build.sh

The generated application will be placed in:

    build/ZarFilm.app

The build is ad-hoc signed for local testing. Apple Developer ID signing and notarization are not included.

## Website configuration

The default address is a placeholder.

Launch the application and select "تنظیم آدرس" to enter the website address you want to use.

The selected address is saved locally using macOS UserDefaults.

## Project structure

    ZarFilm-Standalone-macOS/
    ├── Sources/
    │   └── ZarFilmStandalone.swift
    ├── Scripts/
    │   └── build.sh
    ├── .gitignore
    └── README.md

## Disclaimer

This is an independent software project. It is not affiliated with, endorsed by, or officially connected to ZarFilm or any website operator.

No website content, credentials, or proprietary website assets are included.

Users are responsible for configuring a website address they are authorized to access.

## License

All rights reserved. No open-source license is granted at this time.
