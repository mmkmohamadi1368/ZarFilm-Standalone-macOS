# ZarFilm Standalone for macOS

A lightweight native macOS application for opening ZarFilm in its own desktop window, built with Swift, Cocoa, and WebKit.

<div align="center">

**[⬇️ Download ZarFilm 1.0 for Intel Macs](https://github.com/mmkmohamadi1368/ZarFilm-Standalone-macOS/releases/download/v1.0.0/ZarFilm-1.0-Intel.dmg)**

[All releases](https://github.com/mmkmohamadi1368/ZarFilm-Standalone-macOS/releases)

</div>

> **Compatibility:** Intel (x86_64) Macs · macOS 12 Monterey or later  
> **Current release:** v1.0.0

---

## فارسی

### معرفی
ZarFilm Standalone یک برنامهٔ سبک و مستقل برای macOS است که وب‌سایت را در یک پنجرهٔ اختصاصی با استفاده از WebKit اجرا می‌کند. برای استفاده از برنامه لازم نیست مرورگر جداگانه‌ای باز کنید.

### دانلود
از لینک زیر نسخهٔ مخصوص مک‌های Intel را دریافت کنید:

**[دانلود ZarFilm 1.0 برای مک‌های Intel](https://github.com/mmkmohamadi1368/ZarFilm-Standalone-macOS/releases/download/v1.0.0/ZarFilm-1.0-Intel.dmg)**

### نصب
1. فایل DMG را دانلود و باز کنید.
2. آیکون **ZarFilm.app** را به پوشهٔ **Applications** بکشید.
3. برنامه را از پوشهٔ Applications اجرا کنید.
4. از بخش **«تنظیم آدرس»**، نشانی فعلی وب‌سایت را وارد و ذخیره کنید.

**نکته:** نشانی پیش‌فرض برنامه صرفاً نمونه است. پس از نصب، آدرس معتبر و فعلی موردنظر خودتان را در تنظیمات وارد کنید.

### اگر macOS اجازهٔ اجرای برنامه را نداد
این نسخه با امضای محلی (Ad-hoc) ساخته شده و با Developer ID اپل امضا یا Notarize نشده است؛ بنابراین ممکن است Gatekeeper هنگام اولین اجرا هشدار دهد.

- ابتدا مطمئن شوید فایل را از همین صفحهٔ رسمی GitHub دریافت کرده‌اید.
- روی برنامه در Finder کلیک راست کنید و **Open** را بزنید؛ اگر پیام تأیید نمایش داده شد، دوباره **Open** را انتخاب کنید.
- در صورت نمایش گزینهٔ **Open Anyway**، فقط در صورتی از آن استفاده کنید که از منبع فایل مطمئن هستید.

برای اجرای این نسخه، قابلیت‌های امنیتی macOS را به‌طور کلی غیرفعال نکنید.

---

## English

### Features
- Native macOS application window
- Embedded WebKit browser
- Back navigation and page reload
- Full-screen mode
- Editable website address
- Remembers the selected address locally
- Opens external URL schemes with the macOS default handler
- Supports popup links inside the existing window

### Installation
1. Download **[ZarFilm-1.0-Intel.dmg](https://github.com/mmkmohamadi1368/ZarFilm-Standalone-macOS/releases/download/v1.0.0/ZarFilm-1.0-Intel.dmg)**.
2. Open the DMG file.
3. Drag **ZarFilm.app** to **Applications**.
4. Launch the app and use **تنظیم آدرس** to enter and save the current website address.

The default website address is only a placeholder and must be replaced in the app settings.

### macOS security notice
This release is ad-hoc signed. It is **not signed with an Apple Developer ID and is not notarized by Apple**. Gatekeeper may therefore show a warning on first launch.

If you trust the downloaded file and obtained it from this official GitHub repository, use Finder's **right-click → Open** flow and confirm **Open**. Do not disable macOS security protections globally.

---

## Compatibility

- macOS 12 Monterey or later
- Intel Mac (x86_64)
- Apple Silicon (M1/M2/M3) is not supported by this Intel-only release

## Build from source

Requirements:
- macOS 12 or later
- Xcode Command Line Tools
- Swift compiler

Build:

```bash
./Scripts/build.sh
```

The generated application will be placed at:

```text
build/ZarFilm.app
```

## Project structure

```text
ZarFilm-Standalone-macOS/
├── Sources/
│   └── ZarFilmStandalone.swift
├── Scripts/
│   └── build.sh
├── .gitignore
└── README.md
```

## Release integrity

**Release:** v1.0.0  
**File:** `ZarFilm-1.0-Intel.dmg`  
**SHA-256:**

```text
d7655af214b2970290464866b6822addd6e9858e57e0f6b08663867484c35709
```

To verify the downloaded file on macOS, run:

```bash
shasum -a 256 ~/Downloads/ZarFilm-1.0-Intel.dmg
```

Compare the output with the SHA-256 value above.

## Disclaimer

This is an independent software project. It is not affiliated with, endorsed by, or officially connected to ZarFilm or any website operator.

No website content, credentials, or proprietary website assets are included. Users are responsible for configuring a website address they are authorized to access.

## License

All rights reserved. No open-source license is granted at this time.
