//
//  Instantiatable.swift
//  BirthdayApp
//

import UIKit

public protocol Instantiatable: class {
    static func instantiate() -> Self
}
