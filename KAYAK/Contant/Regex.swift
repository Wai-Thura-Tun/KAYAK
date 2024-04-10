//
//  Regex.swift
//  KAYAK
//
//  Created by Wai Thura Tun on 09/04/2024.
//

import Foundation
import RegexBuilder

let emailRegex = Regex {
    /^/
    OneOrMore {
        CharacterClass(
            .anyOf("._%+-"),
            ("a"..."z"),
            ("A"..."Z"),
            ("0"..."9")
        )
    }
    "@"
    OneOrMore {
        CharacterClass(
            .anyOf(".-"),
            ("a"..."z"),
            ("A"..."Z"),
            ("0"..."9")
        )
    }
    "."
    Repeat(2...) {
        CharacterClass(
            ("a"..."z"),
            ("A"..."Z")
        )
    }
    /$/
}


