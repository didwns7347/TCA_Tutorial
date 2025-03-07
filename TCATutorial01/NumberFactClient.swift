//
//  NumberFactClient.swift
//  TCATutorial01
//
//  Created by yangjs on 2/18/25.
//

import Foundation
import ComposableArchitecture

struct NumberFactClient: Sendable {
    var fetch: @Sendable (Int) async throws -> String
}

extension NumberFactClient: DependencyKey {
    static let liveValue = Self(
      fetch: { number in
        let (data, _) = try await URLSession.shared
          .data(from: URL(string: "http://numbersapi.com/\(number)")!)
        return String(decoding: data, as: UTF8.self)
      }
    )
}



extension DependencyValues {
  var numberFact: NumberFactClient {
    get { self[NumberFactClient.self] }
    set { self[NumberFactClient.self] = newValue }
  }
}
