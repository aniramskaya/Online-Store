import UIKit

final class BannersViewCell: UICollectionViewCell {

    //MARK: - var\let
    let imageView = UIImageView()

    //MARK: - life cycle funcs
    func configure(with name: String) {
        contentView.addSubview(imageView)

        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.rounded()

        setConstraint()
    }

    func setConstraint() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
