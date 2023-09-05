import UIKit

protocol ProductCellDelegate: AnyObject {
    
    func plusButtonTapped(in cell: ProductCell)
    
    func minusButtonTapped(in cell: ProductCell)
}

class ProductCell: UICollectionViewCell {
    
    var delegate: ProductCellDelegate?
    
    let menuVC = MenuViewController()
    
    static let id = "ProductCell"
    
    var count = 0 {
        didSet {
            if count > 0 {
                minusButton.isHidden = false
                countLabel.isHidden = false
                countLabel.text = "\(count)"
            } else {
                minusButton.isHidden = true
                countLabel.isHidden = true
            }
        }
    }
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.spacing = 10
        return stack
    }()
    
    var productImageView: UIImageView = {
        let productImage = UIImageView()
        productImage.image = UIImage(named: "аджика")
        return productImage
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    var weightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(plusButtonTapped(button: )), for: .touchUpInside)
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(minusButtonTapped(button: )), for: .touchUpInside)
        return button
    }()
    
    var countLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return label
    }()
    
    var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = .systemYellow
        stack.layer.cornerRadius = 17
        stack.clipsToBounds = true
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        count = 0
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with product: Product) {
        count = 0
        titleLabel.text = product.title
        priceLabel.text = "\(product.price) P"
        productImageView.image = product.image
        weightLabel.text = "\(product.weight) г"
    }
    
    func setupViews() {
        contentView.backgroundColor = .white
        layer.cornerRadius = 17
        layer.masksToBounds = true
        contentView.addSubview(stackView)
        contentView.addSubview(productImageView)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(titleLabel)
        contentView.addSubview(weightLabel)
        
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(minusButton)
        horizontalStackView.addArrangedSubview(countLabel)
        horizontalStackView.addArrangedSubview(plusButton)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.left.equalTo(contentView).inset(16)
            make.right.equalTo(contentView)
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(16)
            make.left.right.equalTo(contentView).inset(16)
            //make.bottom.equalTo(contentView).inset(50)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).inset(16)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView).inset(10)
        }
    }
    
    //MARK: - Actions
    @objc func plusButtonTapped(button: UIButton) {
        count += 1
        delegate?.plusButtonTapped(in: self)
    }
    
    @objc func minusButtonTapped(button: UIButton) {
        count -= 1
        if count == 0 {
            delegate?.minusButtonTapped(in: self)
        }
    }
}
