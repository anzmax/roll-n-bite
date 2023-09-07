import UIKit

class CategoryContainerCell: UICollectionViewCell {
    
    static let id = "CategoryContainerCell"
    
    var categories = [Category]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .green
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView)
        }
    }
    
    func update(with category: [Category]) {
        categories = category
    }
}

//MARK: - Extensions
extension CategoryContainerCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as! CategoryCell
        
        let category = categories[indexPath.row]
        cell.update(with: category)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

//MARK: - Cell
class CategoryCell: UICollectionViewCell {
    
    static let id = "CategoryCell"
    
    var titleButton: UIButton = {
        let button = UIButton()
        button.setTitle("ДОНЕРЫ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        layer.cornerRadius = 17
        layer.masksToBounds = true
        contentView.addSubview(titleButton)
        contentView.backgroundColor = .green
    }
    
    func setupConstraints() {
        titleButton.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView)
            make.width.equalTo(20)
        }
    }
    
    func update(with category: Category) {        
        titleButton.setTitle(category.title, for: .normal)
    }
}
