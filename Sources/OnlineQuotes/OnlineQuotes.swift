// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum Quotes {
    
    public static func getForismaticQuote() async throws -> String {
        guard var components = URLComponents(string: "http://api.forismatic.com/api/1.0/") else { throw QuotesError.badUrl }
        components.queryItems = [
            .init(name: "method", value: "getQuote"),
            .init(name: "format", value: "json"),
            .init(name: "lang", value: "en")
        ]
        
        guard let url = components.url else { throw QuotesError.badUrl }
        async let (data, _) = URLSession.shared.data(from: url)
        
        let response = try await JSONDecoder().decode(ForismaticQuote.self, from: data)
        return response.quoteText
    }
    
    public static func getKanyeQuote() async throws -> String {
        guard let url = URL(string: "https://api.kanye.rest/") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(KanyeQuote.self, from: data)
        return response.quote
    }
    
    public static func getZenQuote(mode: ZenQuoteMode = .random, key: String? = nil) async throws -> String {
        var urlString = "https://zenquotes.io/api/\(mode.rawValue)"
        if let key { urlString += "/\(key)" }
        
        guard let url = URL(string: urlString) else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try await JSONDecoder().decode([ZenQuote].self, from: data)
        guard let first = response.first else { throw QuotesError.badResponse }
        return first.q
    }
    
    public static func getStoicQuote() async throws -> String {
        guard let url = URL(string: "https://stoic.tekloon.net/stoic-quote") else { throw QuotesError.badUrl }
        async let (data, _) = URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(StoicQuote.self, from: data)
        return response.quote
    }
    
    public static func getDadJoke() async throws -> String {
        guard let url = URL(string: "https://icanhazdadjoke.com/") else { throw QuotesError.badUrl }
        var req = URLRequest(url: url)
        req.setValue("application/json", forHTTPHeaderField: "Accept")
        
        async let (data, _) = URLSession.shared.data(for: req)
        let response = try await JSONDecoder().decode(DadJoke.self, from: data)
        return response.joke
    }
    
    public static func getAdvice() async throws -> String {
        guard let url = URL(string: "https://api.adviceslip.com/advice") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(Advice.self, from: data)
        return response.advice
    }
    
    public static func getBreakingBadQuote() async throws -> String {
        guard let url = URL(string: "https://api.breakingbadquotes.xyz/v1/quotes") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([BreakingBadQuote].self, from: data)
        guard let first = response.first else { throw QuotesError.badResponse }
        return first.quote
    }
    
    public static func getBreakingBadQuotes(count: Int = 1) async throws -> [String] {
        guard let url = URL(string: "https://api.breakingbadquotes.xyz/v1/quotes/\(count)") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([BreakingBadQuote].self, from: data)
        return response.map(\.quote)
    }
    
    public static func getSupernaturalQuote() async throws -> String {
        guard let url = URL(string: "https://supernatural-api.onrender.com/quotes/random") else { throw QuotesError.badUrl }
        async let (data, _) = URLSession.shared.data(from: url)
        return try await JSONDecoder().decode(SupernaturalQuote.self, from: data).quote
    }
    
    public static func getStrangerThingsQuote() async throws -> String {
        guard let url = URL(string: "https://strangerthings-quotes.vercel.app/api/quotes") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([StrangerThingsQuote].self, from: data)
        guard let first = response.first else { throw QuotesError.badResponse }
        return first.quote
    }
    
    public static func getStrangerThingsQuotes(count: Int = 1) async throws -> [String] {
        guard let url = URL(string: "https://strangerthings-quotes.vercel.app/api/quotes/\(count)") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([StrangerThingsQuote].self, from: data)
        return response.map(\.quote)
    }
    
    public static func getSouthParkQuote() async throws -> String {
        guard let url = URL(string: "https://southparkquotes.onrender.com/v1/quotes") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([SouthParkQuote].self, from: data)
        guard let first = response.first else { throw QuotesError.badResponse }
        return first.quote
    }
    
    public static func getSouthParkQuote(from character: SouthParkCharacter) async throws -> String {
        guard
            let term = character.searchTerm.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
            let url = URL(string: "https://southparkquotes.onrender.com/v1/quotes/search/\(term)")
        else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([GenericQuote].self, from: data)
        guard let first = response.first else { throw QuotesError.badResponse }
        return first.quote
    }
    
    public static func getSouthParkQuotes(count: Int = 1) async throws -> [String] {
        guard let url = URL(string: "https://southparkquotes.onrender.com/v1/quotes/\(count)") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([SouthParkQuote].self, from: data)
        return response.map(\.quote)
    }
    
    public static func getLuciferQuote() async throws -> String {
        guard let url = URL(string: "https://lucifer-quotes.vercel.app/api/quotes") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([LuciferQuote].self, from: data)
        guard let first = response.first else { throw QuotesError.badResponse }
        return first.quote
    }
    
    public static func getLuciferQuotes(count: Int = 1) async throws -> [String] {
        guard let url = URL(string: "https://lucifer-quotes.vercel.app/api/quotes/\(count)") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode([LuciferQuote].self, from: data)
        return response.map(\.quote)
    }
    
    public static func getFavQsQotd() async throws -> String {
        guard let url = URL(string: "https://favqs.com/api/qotd") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        return try await JSONDecoder().decode(FavQsQuote.self, from: data).body
    }
    
    public static func getQuoteFromHub() async throws -> String {
        guard let url = URL(string: "https://thequoteshub.com/api/") else { throw QuotesError.badUrl }
        async let (data, _) = try await URLSession.shared.data(from: url)
        return try await JSONDecoder().decode(HubQuote.self, from: data).text
    }
}

struct GenericQuote: Sendable, Codable {
    let quote: String
}

typealias KanyeQuote          = GenericQuote
typealias BreakingBadQuote    = GenericQuote
typealias StrangerThingsQuote = GenericQuote
typealias SouthParkQuote      = GenericQuote
typealias LuciferQuote        = GenericQuote

struct ForismaticQuote: Sendable, Codable {
    let quoteText: String
}

struct ZenQuote: Sendable, Codable {
    let q: String
}

struct DadJoke: Sendable, Codable {
    let joke: String
}

struct HubQuote: Sendable, Codable {
    let text: String
}

struct FavQsQuote: Decodable, Sendable {
    let body: String
    
    private enum RootKeys: String, CodingKey { case quote }
    private enum QuoteKeys: String, CodingKey { case body }
    
    init(from decoder: Decoder) throws {
        let root = try decoder.container(keyedBy: RootKeys.self)
        let q = try root.nestedContainer(keyedBy: QuoteKeys.self, forKey: .quote)
        body = try q.decode(String.self, forKey: .body)
    }
}

struct SupernaturalQuote: Sendable, Codable {
    let quote: String
    
    private enum RootKeys: String, CodingKey { case line_0 }
    private enum LineKeys: String, CodingKey { case quote }
    
    init(from decoder: Decoder) throws {
        let root = try decoder.container(keyedBy: RootKeys.self)
        let line = try root.nestedContainer(keyedBy: LineKeys.self, forKey: .line_0)
        quote = try line.decode(String.self, forKey: .quote)
    }
}

struct Advice: Codable, Sendable {
    let advice: String
    
    private enum RootKeys: String, CodingKey { case slip }
    private enum SlipKeys: String, CodingKey { case advice }
    
    init(from decoder: Decoder) throws {
        let root = try decoder.container(keyedBy: RootKeys.self)
        let slip = try root.nestedContainer(keyedBy: SlipKeys.self, forKey: .slip)
        advice = try slip.decode(String.self, forKey: .advice)
    }
    
    func encode(to encoder: Encoder) throws {
        var root = encoder.container(keyedBy: RootKeys.self)
        var slip = root.nestedContainer(keyedBy: SlipKeys.self, forKey: .slip)
        try slip.encode(advice, forKey: .advice)
    }
}


struct StoicQuote: Codable, Sendable {
    let quote: String
    
    private enum RootKeys: String, CodingKey { case data }
    private enum DataKeys: String, CodingKey { case quote }
    
    init(from decoder: Decoder) throws {
        let root = try decoder.container(keyedBy: RootKeys.self)
        let data = try root.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        quote  = try data.decode(String.self, forKey: .quote)
    }
    
    func encode(to encoder: Encoder) throws {
        var root = encoder.container(keyedBy: RootKeys.self)
        var data = root.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        try data.encode(quote, forKey: .quote)
    }
}

extension Quotes {
    public enum ZenQuoteMode: String, Sendable {
        case quotes, today, author, random
    }
    
    enum QuotesError: Error, Sendable {
        case error(String)
        static let badUrl = URLError(.badURL)
        static let badResponse = URLError(.badServerResponse)
    }
    
    public enum SouthParkCharacter: String, CaseIterable, Sendable {
        case cartman
        case kyle
        case stan
        case butters
        case kenny
        case chef
        case randy
        case mrHankey = "mr-hankey"
        case mrGarrison = "mr-garrison"
        case mrMackey = "mr-mackey"
        case mrSlave = "mr-slave"
        case timmy
        case towelie
        case jimbo
        case matthewMcConaughey = "matthew-mcconaughey"
        case honeyBooBoo = "honey-boo-boo"
        case honeyBooBoosMom = "honey-boo-boos-mom"
        case scottMalkinson = "scott-malkinson"
        case newscasterNed = "newscaster-ned"
        case mrsBroflovski = "mrs-broflovski"
        case sharonMarsh = "sharon-marsh"
        
        // term for api
        var searchTerm: String {
            switch self {
                case .mrHankey: return "mr hankey"
                case .mrGarrison: return "mr garrison"
                case .mrMackey: return "mr mackey"
                case .mrSlave: return "mr slave"
                case .matthewMcConaughey: return "matthew mcconaughey"
                case .honeyBooBoo: return "honey boo boo"
                case .honeyBooBoosMom: return "honey boo boo's mom"
                case .scottMalkinson: return "scott malkinson"
                case .newscasterNed: return "newscaster ned"
                case .mrsBroflovski: return "mrs. broflovski"
                case .sharonMarsh: return "sharon marsh"
                default: return rawValue
            }
        }
    }
}
