import UIKit

enum MenuSectionType: Int {
    case transparent = 0
    case highlights = 1
    case categories = 2
    case menu = 3
}

class MenuViewController: UIViewController, ProductCellDelegate {
    
    func plusButtonTapped(in cell: ProductCell) {
        basketView.isHidden = false
    }
    
    func minusButtonTapped(in cell: ProductCell) {
        basketView.isHidden = true
    }
        
    let categoryService = CategoryService()
    var storyService = StoryService()
    var productService = ProductService()
    
    var categories = [Category]()
    var stories = [Story]()
    var products = [Product]()
    
    //MARK: - UI
//    lazy var deliveryButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("В донерной ❯", for: .normal)
//        button.setTitleColor(.systemIndigo, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        button.addTarget(self, action: #selector(showDeliveryAdresses), for: .touchUpInside)
//        return button
//    }()
//
//    var adressLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Суворовский 56"
//        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//        return label
//    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = false
        collectionView.layer.cornerRadius = 20
        collectionView.isScrollEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(StoryContainerCell.self, forCellWithReuseIdentifier: StoryContainerCell.id)
        collectionView.register(CategoryContainerCell.self, forCellWithReuseIdentifier: CategoryContainerCell.id)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.id)
        collectionView.register(TransparentCell.self, forCellWithReuseIdentifier: TransparentCell.id)
        
        return collectionView
    }()
    
    var basketView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 17
        view.clipsToBounds = true
        return view
    }()
    
    lazy var basketButton = YellowButton(title: "КОРЗИНА")

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        fetchCategories()
        fetchStories()
        fetchProducts()
        setupActions()
        basketView.isHidden = true
    }
    
    func setupActions() {
        basketButton.onAction = {
            let orderVC = OrderViewController()
            if let sheet = orderVC.sheetPresentationController {
                sheet.detents = [.large()]
            }
            self.present(orderVC, animated: true)
        }
    }
    
    func setupViews() {
        view.backgroundColor = .systemGray5
        //view.addSubview(deliveryButton)
        //view.addSubview(adressLabel)
        view.addSubview(collectionView)
        view.addSubview(basketView)
        basketView.addSubview(basketButton)
    }
    
    func setupConstraints() {
//        deliveryButton.snp.makeConstraints { make in
//            make.centerX.equalTo(view)
//            make.top.equalTo(view.safeAreaLayoutGuide)
//        }
//        
//        adressLabel.snp.makeConstraints { make in
//            make.centerX.equalTo(view)
//            make.top.equalTo(deliveryButton.snp.bottom).offset(10)
//        }

        collectionView.snp.makeConstraints { make in
//            make.left.right.equalTo(view.safeAreaLayoutGuide)
//            make.bottom.equalTo(view)
//            make.top.equalTo(adressLabel.snp.bottom).offset(20)
            make.top.left.right.bottom.equalTo(view).inset(16)
        }
        
        basketView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(100)
        }
        
        basketButton.snp.makeConstraints { make in
            make.left.right.equalTo(basketView).inset(16)
            make.height.equalTo(45)
            make.bottom.equalTo(basketView).inset(36)
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
            case .transparent: return 1
            case .highlights: return 1
            case .categories: return categories.count
            case .menu: return products.count
            }
        }
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let sectionType = MenuSectionType(rawValue: indexPath.section) {
            switch sectionType {
            case .transparent:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransparentCell.id, for: indexPath) as! TransparentCell
                cell.deliveryButtonTapped = { [weak self] in
                    self?.showDeliveryAdresses()
                }
                return cell
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
                cell.delegate = self
                return cell
            }
        }
        return UICollectionViewCell()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
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
            case .transparent: return CGSize(width: UIScreen.main.bounds.width, height: 50)
            case .highlights: return CGSize(width: UIScreen.main.bounds.width, height: 200)
            case .categories: return CGSize(width: UIScreen.main.bounds.width, height: 50)
            case .menu: return CGSize(width: 172, height: 280)
            }
        }
         return CGSize(width: 0, height: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)
    }
}

//MARK: - Services
extension MenuViewController {
    
    func fetchCategories() {

        categoryService.fetchCategories { result in
            switch result {
                
            case .success(let categories):
                self.categories = categories
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchStories() {
        
        storyService.fetchStories { result in
            switch result {
            case .success(let stories):
                self.stories = stories
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchProducts() {
        
        productService.fetchProducts { result in
            
            switch result {
                
            case .success(let products):
                self.products = products
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}



