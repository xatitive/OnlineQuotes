//
//  ManyQuotes.swift
//  OnlineQuotes
//
//  Created by Christian Norton on 9/3/25.
//

import Testing
@testable import OnlineQuotes

@Suite("ManyQuotes")
struct ManyQuotes {
    @Test func tenBrdBd() async throws {
        print(try await Quotes.getBreakingBadQuotes(count: 10))
    }
    
    @Test func tenStrangerThings() async throws {
        print(try await Quotes.getStrangerThingsQuotes(count: 10))
    }
    
    @Test func tenSouthParks() async throws {
        print(try await Quotes.getSouthParkQuotes(count: 10))
    }
    
    @Test func tenLucifers() async throws {
        print(try await Quotes.getLuciferQuotes(count: 10))
    }
}
