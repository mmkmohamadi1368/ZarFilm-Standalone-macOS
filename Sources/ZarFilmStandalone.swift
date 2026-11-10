import Cocoa
import WebKit

class AppDelegate: NSObject, NSApplicationDelegate, WKNavigationDelegate, WKUIDelegate {
    let defaultURL = "https" + ":" + "/" + "/" + "example.com"
    let addressKey = "ZarFilmStartAddress"

    var window: NSWindow!
    var webView: WKWebView!

    var currentAddress: String {
        UserDefaults.standard.string(forKey: addressKey) ?? defaultURL
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
        webView.uiDelegate = self

        let back = NSButton(title: "‹ برگشت", target: self, action: #selector(goBack))
        let reload = NSButton(title: "↻ بارگذاری مجدد", target: self, action: #selector(reloadPage))
        let full = NSButton(title: "⛶ تمام‌صفحه", target: self, action: #selector(toggleFullScreen))
        let settings = NSButton(title: "⚙ تنظیم آدرس", target: self, action: #selector(changeAddress))

        let telegram = NSButton(title: "✈ تلگرام و آدرس جدید", target: self, action: #selector(openTelegram))
        let toolbar = NSStackView(views: [back, reload, full, settings, telegram])
        toolbar.orientation = .horizontal
        toolbar.spacing = 10

        let root = NSView()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        webView.translatesAutoresizingMaskIntoConstraints = false
        root.addSubview(toolbar)
        root.addSubview(webView)

        NSLayoutConstraint.activate([
            toolbar.topAnchor.constraint(equalTo: root.topAnchor, constant: 8),
            toolbar.leadingAnchor.constraint(equalTo: root.leadingAnchor, constant: 12),
            toolbar.trailingAnchor.constraint(lessThanOrEqualTo: root.trailingAnchor, constant: -12),
            toolbar.heightAnchor.constraint(equalToConstant: 32),
            webView.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 8),
            webView.leadingAnchor.constraint(equalTo: root.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: root.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: root.bottomAnchor)
        ])

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 1100, height: 750),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )

        window.title = "ZarFilm"
        window.center()
        window.contentView = root
        window.makeKeyAndOrderFront(nil)

        openAddress(currentAddress)
    }

    func openAddress(_ value: String) {
        guard let url = URL(string: value),
              let scheme = url.scheme?.lowercased(),
              (scheme == "https" || scheme == "http"),
              url.host != nil else {
            showMessage("آدرس معتبر نیست.")
            return
        }
        webView.load(URLRequest(url: url))
    }

    @objc func openTelegram() {
        if let url = URL(string: "https://t.me/zarfilmzz") {
            NSWorkspace.shared.open(url)
        }
    }

    @objc func goBack() {
        if webView.canGoBack { webView.goBack() }
    }

    @objc func reloadPage() {
        webView.reload()
    }

    @objc func toggleFullScreen() {
        window.toggleFullScreen(nil)
    }

    @objc func changeAddress() {
        let destination = webView.url?.absoluteString ?? "هنوز مشخص نیست"

        let alert = NSAlert()
        alert.messageText = "مدیریت آدرس زرفیلم"
        alert.informativeText =
        """
        آدرس ورودی فعلی برنامه:
        \(currentAddress)

        آدرس مقصدی که اکنون باز است:
        \(destination)

        آدرس جدید را در کادر زیر وارد کن.
        برای وارد کردن آدرس، از ابتدای https استفاده کن.
        """

        let field = NSTextField(string: "")
        field.placeholderString = "آدرس جدید زرفیلم را اینجا وارد کن"
        field.frame = NSRect(x: 0, y: 0, width: 420, height: 30)
        alert.accessoryView = field

        alert.addButton(withTitle: "ذخیره آدرس جدید")
        alert.addButton(withTitle: "بازگشت به لینک اصلی")
        alert.addButton(withTitle: "انصراف")

        let response = alert.runModal()

        if response == .alertFirstButtonReturn {
            let value = field.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)

            guard let url = URL(string: value),
                  let scheme = url.scheme?.lowercased(),
                  (scheme == "https" || scheme == "http"),
                  url.host != nil else {
                showMessage("آدرس واردشده معتبر نیست. آدرس باید با https:// یا http:// شروع شود.")
                return
            }

            UserDefaults.standard.set(value, forKey: addressKey)
            openAddress(value)
            showMessage("آدرس جدید ذخیره شد.")

        } else if response == .alertSecondButtonReturn {
            UserDefaults.standard.removeObject(forKey: addressKey)
            openAddress(defaultURL)
            showMessage("برنامه دوباره از لینک اصلی زرفیلم استفاده می‌کند.")
        }
    }

    func showMessage(_ message: String) {
        let alert = NSAlert()
        alert.messageText = "ZarFilm"
        alert.informativeText = message
        alert.addButton(withTitle: "باشه")
        alert.runModal()
    }

    func webView(_ webView: WKWebView,
                 createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction,
                 windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }

        let scheme = url.scheme?.lowercased() ?? ""
        if scheme == "http" || scheme == "https" {
            decisionHandler(.allow)
        } else {
            NSWorkspace.shared.open(url)
            decisionHandler(.cancel)
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.regular)
app.run()
