//
//  TelevisionQuotes.swift
//  OnlineQuotes
//
//  Created by Christian Norton on 9/3/25.
//

import Testing
@testable import OnlineQuotes

@Suite("TVQuotes")
struct TelevisionQuotes {
    @Test func brbd() async throws {
        print(try await Quotes.getBreakingBadQuote())
    }
    
    @Test func supernatural() async throws {
        print(try await Quotes.getSupernaturalQuote())
    }
    
    @Test func strangerThings() async throws {
        print(try await Quotes.getStrangerThingsQuote())
    }
    
    @Test func southPark() async throws {
        print(try await Quotes.getSouthParkQuote())
    }
    
    @Test func lucifer() async throws {
        print(try await Quotes.getLuciferQuote())
    }
}


//@Test func southParkCartman() async throws {
//    print(try await Quotes.getSouthParkQuote(from: .cartman))
//}
//
//@Test func southParkRandy() async throws {
//    print(try await Quotes.getSouthParkQuote(from: .randy))
//}
//
//@Test func southParkTowelie() async throws {
//    print(try await Quotes.getSouthParkQuote(from: .towelie))
//}
//
//@Test func southParkButters() async throws {
//    print(try await Quotes.getSouthParkQuote(from: .butters))
//}

