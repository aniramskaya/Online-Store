import UIKit

final class MainViewController: UIViewController {

    //MARK: - var\let
    private lazy var heightForRow: CGFloat = 180
    private lazy var heightForHeaderInSection: CGFloat = 58

    private var items: [Item]?
    private var banners: [String]?
    private var categories: [String]?

    private let tableView = UITableView()
    private let headerTableView = BannersView()
    private let viewForHeaderInSection = CategoriesView()

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchData()
    }

    override func viewDidLayoutSubviews() {
        tableView.frame = view.safeAreaLayoutGuide.layoutFrame
        headerTableView.frame = .init(x: 0, y: 0, width: tableView.bounds.width, height: 112)
    }

    //MARK: - flow funcs
    private func fetchData() {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1) { [unowned self] in

            let object = JSONManager.shared.jsonAutoParts()
            items = object.items
            banners = object.banners
            categories = object.categories

            viewForHeaderInSection.categoriesArray = categories ?? [String]()
            headerTableView.array = banners ?? [String]()


            DispatchQueue.main.async { [self] in
                tableView.reloadData()
                headerTableView.collectionView.reloadData()
                viewForHeaderInSection.collection.reloadData()
            }
        }
    }

    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib  = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .lightGray

        tableView.tableHeaderView = headerTableView

        tableView.backgroundColor = .lightGray
        view.backgroundColor = .lightGray
        view.addSubview(tableView)

        NotificationCenter.default.addObserver(self, selector: #selector(sendNotification), name: NSNotification.Name("didSelectCategory"), object: nil)
    }



    @objc private func sendNotification(_ notification: NSNotification) {
        guard var indexPath = notification.userInfo!["indexPath"] as? IndexPath else {return}

        guard let array = items,
              let categories = self.categories else {return}

        var counter = 0
        for element in array {
            if element.category == categories[indexPath.row] {
                break
            }
            counter += 1
        }
        indexPath.row = counter
        tableView.scrollToRow(at: indexPath as IndexPath,
                              at: .top,
                        animated: true)
    }
}

//MARK: - extension Delegate, DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.viewForHeaderInSection
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.heightForHeaderInSection
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let array = items else {return 0}
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {return UITableViewCell()}
        guard let array = items else {return UITableViewCell()}

        cell.configure(with: array[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
