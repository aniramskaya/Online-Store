import UIKit

class MainTableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    //MARK: - flow funcs
    func configure(with item: Item){
        guard let name = item.image,
              let price = item.price,
              let discription = item.description,
              let label = item.name else {return}

        configureImage(with: name)
        configurePrice(with: price)
        configureDiscriptionLabel(with: discription)
        configureLabel(with: label)

    }

    func configureImage(with name: String) {
        icon.rounded()
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.image = UIImage(named: name)
    }

    func configureLabel(with text: String) {
        nameLabel.text = text
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont(name: "Arial-BoldMT", size: 17)
    }

    func configureDiscriptionLabel(with text: String) {
        discriptionLabel.font = UIFont(name: "ArialMT", size: 13)
        discriptionLabel.numberOfLines = 0
        discriptionLabel.text = text
    }

    func configurePrice(with price: Int) {
        priceView.rounded()
        priceView.layer.borderWidth = 1
        priceView.layer.borderColor = UIColor.darkPink.cgColor

        priceLabel.text = "от \(price) руб"
        priceLabel.font = UIFont(name: "ArialMT", size: 13)
        priceLabel.textColor = .darkPink
        priceLabel.contentMode = .center
    }
}
