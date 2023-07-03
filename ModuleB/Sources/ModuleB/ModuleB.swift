// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import OSLog

public class FeatureB {
    let logger = Logger(subsystem: "com.charleshs.LoggerDemo-FeatureB", category: "Feature")

    public init() {}

    public func run() {
        logger.log("FeatureB is started.")
    }
}
