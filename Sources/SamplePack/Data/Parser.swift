import Foundation

public final class Parser {
    // MARK: - Initialization

    public init(locale: String = Config.defaultLocale) {
        self.locale = locale
        provider = Provider()
        loadData(forLocale: locale)

        if locale != Config.defaultLocale {
            loadData(forLocale: Config.defaultLocale)
        }
    }

    public var locale: String {
        didSet {
            if locale != oldValue {
                loadData(forLocale: locale)
            }
        }
    }

    // MARK: - Parsing

    public func fetch(_ key: String) -> String {
        var parsed = ""

        guard let keyData = fetchRaw(key) else {
            return parsed
        }

        let subject = getSubject(key)

        if let value = keyData as? String {
            parsed = value
        } else if let array = keyData as? [String], let item = array.random() {
            parsed = item
        }

        if parsed.range(of: "#{") != nil {
            parsed = parse(parsed, forSubject: subject)
        }

        return parsed
    }

    public func fetchRaw(_ key: String) -> Any? {
        let result = fetchRaw(key, forLocale: locale)

        guard locale != Config.defaultLocale else {
            return result
        }

        return result ?? fetchRaw(key, forLocale: Config.defaultLocale)
    }

    let provider: Provider

    func parse(_ template: String, forSubject subject: String) -> String {
        var text = ""
        let string = template as NSString
        var regex: NSRegularExpression

        do {
            try regex = NSRegularExpression(
                pattern: "(\\(?)#\\{([A-Za-z]+\\.)?([^\\}]+)\\}([^#]+)?",
                options: .caseInsensitive
            )
            let matches = regex.matches(
                in: string as String,
                options: .reportCompletion,
                range: NSRange(location: 0, length: string.length)
            )

            guard !matches.isEmpty else {
                return template
            }

            for match in matches {
                if match.numberOfRanges < 4 {
                    continue
                }

                let prefixRange = match.range(at: 1)
                let subjectRange = match.range(at: 2)
                let methodRange = match.range(at: 3)
                let otherRange = match.range(at: 4)

                if prefixRange.length > 0 {
                    text += string.substring(with: prefixRange)
                }

                var subjectWithDot = subject + "."

                if subjectRange.length > 0 {
                    subjectWithDot = string.substring(with: subjectRange)
                }

                if methodRange.length > 0 {
                    let key = subjectWithDot.lowercased() + string.substring(with: methodRange)
                    text += fetch(key)
                }

                if otherRange.length > 0 {
                    text += string.substring(with: otherRange)
                }
            }
        } catch {}

        return text
    }

    private var data = [String: Any]()

    private func fetchRaw(_ key: String, forLocale locale: String) -> Any? {
        let parts = key.components(separatedBy: ".")

        guard
            var localData = data[locale] as? [String: Any],
            localData.isEmpty == false
        else {
            return nil
        }

        var result: Any?

        for part in parts {
            guard let parsedPart = localData[part] as? [String: Any] else {
                result = localData[part]
                continue
            }

            localData = parsedPart
            result = parsedPart
        }

        return result
    }

    private func getSubject(_ key: String) -> String {
        var subject = ""
        let parts = key.components(separatedBy: ".")

        if parts.isEmpty == false {
            subject = parts[0]
        }

        return subject
    }

    // MARK: - Data loading

    private func loadData(forLocale locale: String) {
        guard
            let localeData = provider.dataForLocale(locale),
            let parsedData = try? JSONSerialization.jsonObject(with: localeData, options: .allowFragments),
            let json = parsedData as? [String: Any]
        else {
            print("JSON file for '\(locale)' locale was not found.")
            return
        }

        data[locale] = json
    }
}
