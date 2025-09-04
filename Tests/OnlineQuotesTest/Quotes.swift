//
//  Quotes.swift
//  OnlineQuotes
//
//  Created by Christian Norton on 9/3/25.
//

import Testing
@testable import OnlineQuotes

@Suite("QuotesSuite")
struct QuotesTester {
    @Test func forismatic() async throws {
        print(try await Quotes.getForismaticQuote())
    }
    
    @Test func kanye() async throws {
        print(try await Quotes.getKanyeQuote())
    }
    
    @Test func zen() async throws {
        print(try await Quotes.getZenQuote())
    }
    
    @Test func stoic() async throws {
        print(try await Quotes.getStoicQuote())
    }
    
    @Test func daddy() async throws {
        print(try await Quotes.getDadJoke())
    }
    
    @Test func advice() async throws {
        print(try await Quotes.getAdvice())
    }
    
    @Test func brbd() async throws {
        print(try await Quotes.getBreakingBadQuote())
    }
    
    @Test func tenBrdBd() async throws {
        print(try await Quotes.getBreakingBadQuotes(count: 10))
    }
    
    @Test func supernatural() async throws {
        print(try await Quotes.getSupernaturalQuote())
    }
    
    @Test func strangerThings() async throws {
        print(try await Quotes.getStrangerThingsQuote())
    }
    
    @Test func tenStrangerThings() async throws {
        print(try await Quotes.getStrangerThingsQuotes(count: 10))
    }
    
    @Test func southPark() async throws {
        print(try await Quotes.getSouthParkQuote())
    }
    
    @Test func tenSouthParks() async throws {
        print(try await Quotes.getSouthParkQuotes(count: 10))
    }
    
    @Test func lucifer() async throws {
        print(try await Quotes.getLuciferQuote())
    }
    
    @Test func tenLucifers() async throws {
        print(try await Quotes.getLuciferQuotes(count: 10))
    }
    
    @Test func favQs() async throws {
        print(try await Quotes.getFavQsQotd())
    }
    
    @Test func hub() async throws {
        print(try await Quotes.getQuoteFromHub())
    }
}
