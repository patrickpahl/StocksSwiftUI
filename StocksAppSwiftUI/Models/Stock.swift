import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String 
}
