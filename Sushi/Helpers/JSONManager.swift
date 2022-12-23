import Foundation

class JSONManager {

    static let shared = JSONManager()
    private init(){}

    func jsonAutoParts() -> Assortment {
        var object = Assortment(items: nil, categories: nil, banners: nil)
        guard let path = Bundle.main.path(forResource: "js", ofType: "json") else {
            return Assortment(items: nil, categories: nil, banners: nil) }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            object = try JSONDecoder().decode(Assortment.self, from: data)
        } catch {
            print("Data err")
        }
        return object
    }
}
