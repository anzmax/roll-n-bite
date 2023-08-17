import UIKit

class CategoryContainerCell: UICollectionViewCell {
    
    static let id = "CategoryContainerCell"
    
    var categories = [Category]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 50)
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
        contentView.backgroundColor = .orange
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView)
        }
    }
    
    func update(with category: [Category]) {
        categories = category
        //titleLabel.text = category.title
    }
}

extension CategoryContainerCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as! CategoryCell
        
        let category = categories[indexPath.row]
        cell.update(with: category)
        
        return cell
    }
    
    
}


class CategoryCell: UICollectionViewCell {
    
    static let id = "CategoryCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ДОНЕРЫ"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
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
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .green
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView)
        }
    }
    
    func update(with category: Category) {
        titleLabel.text = category.title
    }
}
