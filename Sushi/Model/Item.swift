struct Item: Codable {
    let id: Int?
    let name, category, image, description: String?
    let price: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, category, image, description, price
    }
}
