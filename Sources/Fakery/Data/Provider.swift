import Foundation

public final class Provider {
    // MARK: - Locale data

    public func dataForLocale(_ locale: String) -> Data? {
        var translation: Data?

        if let translationData = translations[locale] {
            translation = translationData
        } else {
            let bundle = Bundle.module
            let path = bundle.path(
                forResource: locale,
                ofType: Config.pathExtension,
                inDirectory: Config.dirPath
            )

            guard let path else {
                return nil
            }

            let fileURL = URL(fileURLWithPath: path)

            if let data = try? Data(contentsOf: fileURL) {
                translation = data
                translations[locale] = data
            }
        }

        return translation
    }

    var translations: [String: Data] = [:]
}
