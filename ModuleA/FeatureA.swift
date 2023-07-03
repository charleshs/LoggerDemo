//
//  FeatureA.swift
//  ModuleA
//
//  Created by Charles Hsieh on 2023/7/3.
//

import Foundation
import OSLog

public class FeatureA {
    let logger = Logger(subsystem: "com.charleshs.LoggerDemo-FeatureA", category: "Feature")

    public init() {}

    public func run() {
        logger.log("FeatureA is started.")
    }
}
