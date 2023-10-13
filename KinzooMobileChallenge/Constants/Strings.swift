//
//  Strings.swift
//  KinzooMobileChallenge
//
//  Created by Waqas Naseem on 30/08/2023.
//

import Foundation
import Extensions

protocol StringKey {
    var rawValue: String { get }
    func get(suffix: String?) -> String
}

extension StringKey {
    func get(suffix: String? = nil) -> String {
        return (rawValue + (suffix ?? "")).localize()
    }
}

extension StringKey {
    typealias Generic = GenericStrings
    typealias Error = ErrorStrings
}

enum GenericStrings: String, StringKey {
    case screenTitle = "key_screen_title"
    case ok = "key_ok"
}

enum ErrorStrings: String, StringKey {
    case errorTitle = "key_error_title"
    case emptyResultMessage = "key_empty_result_message"
}
