//
//  MiscQuotes.swift
//  OnlineQuotes
//
//  Created by Christian Norton on 9/3/25.
//

import Testing
@testable import OnlineQuotes

@Suite("MiscQuotes")
struct MiscQuotes {
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
    
    @Test func favQs() async throws {
        print(try await Quotes.getFavQsQotd())
    }
    
    @Test func hub() async throws {
        print(try await Quotes.getQuoteFromHub())
    }
}
