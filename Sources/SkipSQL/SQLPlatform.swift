// Copyright 2023–2026 Skip
@_exported import SkipSQLCore

extension SQLiteConfiguration {
    /// The platform-provided SQLite library.
    ///
    /// This will use the the vendored sqlite libraries that are provided by the operating system.
    /// The version will vary depending on the OS version.
    public static let platform: SQLiteConfiguration = {
        #if SKIP && SKIP_SQL_KOTLIN
        SQLiteConfiguration(library: SQLiteJNALibrary.shared)
        #elseif canImport(SQLite3)
        SQLiteConfiguration(library: SQLiteCLibrary.shared)
        #elseif !SKIP
        // on Android you need to use SQLPlus
        fatalError("no platform SQLiteCLibrary available; use SkipSQLPlus instead")
        #endif
    }()
}
