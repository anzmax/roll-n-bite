import UIKit

enum MenuSectionType: Int {
    case highlights = 0
    case categories = 1
    case menu = 2
}

class MenuViewController: UIViewController {
    
    let categoryService = CategoryService()
    var storyService = StoryService()
    var productService = ProductService()
    
    var categories: [Category] = []
    var stories: [Story] = []
    var products: [Product] = []
    
    //MARK: - UI
    lazy var deliveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("В донерной ❯", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.addTarget(self, action: #selector(showDeliveryAdresses), for: .touchUpInside)
        return button
    }()
    
    var adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Суворовский 56"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
//    lazy var scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        return scrollView
//    }()
//
//    lazy var contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = false
        collectionView.layer.cornerRadius = 20
        collectionView.isScrollEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(StoryContainerCell.self, forCellWithReuseIdentifier: StoryContainerCell.id)
        collectionView.register(CategoryContainerCell.self, forCellWithReuseIdentifier: CategoryContainerCell.id)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.id)
        
        return collectionView
    }()
    

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        fetchCategories()
        fetchStories()
        fetchProducts()
    }
    
    func setupViews() {
        view.backgroundColor = .systemGray5
        view.addSubview(deliveryButton)
        view.addSubview(adressLabel)
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        deliveryButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        adressLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(deliveryButton.snp.bottom).offset(10)
        }

        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(adressLabel.snp.bottom).offset(20)
        }
    }
    
    //MARK: - Actions
    @objc func showDeliveryAdresses() {
        let deliveryVC = DeliveryAdressesViewController()
        if let sheet = deliveryVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(deliveryVC, animated: true)
    }
}



//MARK: - Extensions

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let sectionType = MenuSectionType.init(rawValue: section) {
            switch sectionType {
            case .highlights: return 1
            case .categories: return 1
            case .menu: return products.count
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let sectionType = MenuSectionType(rawValue: indexPath.section) {
            switch sectionType {
                
            case .highlights:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryContainerCell.id, for: indexPath) as! StoryContainerCell
                cell.update(with: stories)
                return cell
            case .categories:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryContainerCell.id, for: indexPath) as! CategoryContainerCell
                cell.update(with: categories)
                return cell
            case .menu:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.id, for: indexPath) as! ProductCell
                let product = products[indexPath.row]
                cell.update(with: product)
                return cell
            }
        }
        return UICollectionViewCell()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if let sectionType = MenuSectionType(rawValue: indexPath.section) {
            switch sectionType {
            case .highlights: return CGSize(width: UIScreen.main.bounds.width, height: 200)
            case .categories: return CGSize(width: UIScreen.main.bounds.width, height: 50)
            case .menu: return CGSize(width: 170, height: 300)
            }
        }
         return CGSize(width: 0, height: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 10)
    }


}

extension MenuViewController {
    
    func fetchCategories() {
        categories = categoryService.fetchCategories()
        collectionView.reloadData()
    }
    
    func fetchStories() {
        stories = storyService.fetchStories()
        collectionView.reloadData()
    }
    
    func fetchProducts() {
        products = productService.fetchProducts()
        collectionView.reloadData()
    }
}
