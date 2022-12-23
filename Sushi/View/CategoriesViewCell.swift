import UIKit

final class CategoriesViewCell: UICollectionViewCell {

    //MARK: - var\let
    let view = UIView()
    let label = UILabel()

    //MARK: - flow funcs
    func configure(with name: String) {
        view.addSubview(label)
        contentView.addSubview(view)

        label.text = name
        label.textAlignment = .center
        label.textColor = .lightPink

        view.backgroundColor = .lightGray
        view.layer.borderColor = UIColor.lightPink.cgColor
        view.layer.borderWidth = 1
        view.rounded(radius: contentView.frame.height/2)

        setConstraint()
    }

    func setConstraint() {
        view.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func didSelectItem() {
        view.backgroundColor = .lightPink
        label.textColor = .darkPink
    }

    func didDeselectItem() {
        view.backgroundColor = .lightGray
        label.textColor = .lightPink
    }
}
