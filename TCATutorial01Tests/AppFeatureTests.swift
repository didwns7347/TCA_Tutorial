//
//  AppFeatureTests.swift
//  TCATutorial01Tests
//
//  Created by yangjs on 2/18/25.
//

import ComposableArchitecture
import Testing

@testable import TCATutorial01

struct AppFeatureTests {

    @Test func incrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
        }
    }

}
