//
//  File.swift
//  
//
//  Created by Tobi Schweiger on 1/29/22.
//

import Foundation

public struct Entry: Codable {
    let word: String
    let meanings: [Meaning]
}

public struct Meaning: Codable {
    let partOfSpeech: String // <-- enum?
    let definitions: [Definition]
}

public struct Definition: Codable {
    let definition: String
    let example: String?
}

//[
//   {
//     "word": "hello",
//     "phonetics": [
//       {
//         "text": "/həˈloʊ/",
//         "audio": "https://lex-audio.useremarkable.com/mp3/hello_us_1_rr.mp3"
//       },
//       {
//         "text": "/hɛˈloʊ/",
//         "audio": "https://lex-audio.useremarkable.com/mp3/hello_us_2_rr.mp3"
//       }
//     ],
//     "meanings": [
//       {
//         "partOfSpeech": "exclamation",
//         "definitions": [
//           {
//             "definition": "Used as a greeting or to begin a phone conversation.",
//             "example": "hello there, Katie!"
//           }
//         ]
//       },
