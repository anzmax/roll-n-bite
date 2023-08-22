import UIKit

class ProductCell: UICollectionViewCell {
    
    static let id = "ProductCell"
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with product: Product) {
        titleLabel.text = product.title.capitalized
        priceLabel.text = "\(product.price) P"
        productImageView.image = product.image
        weightLabel.text = "\(product.weight) г"
    }
    
    func setupViews() {
        contentView.backgroundColor = .systemGray5
        layer.cornerRadius = 17
        layer.masksToBounds = true
        contentView.addSubview(stackView)
        contentView.addSubview(productImageView)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(titleLabel)
        contentView.addSubview(weightLabel)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.left.right.equalTo(contentView).inset(16)
            make.height.equalTo(115)
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
    }
}
