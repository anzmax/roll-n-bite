import UIKit

class ProductCell: UICollectionViewCell {
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
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
        label.textAlignment = .center
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    static let id = "ProductCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .brown
        contentView.addSubview(stackView)
        contentView.addSubview(productImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.left.right.equalTo(contentView).inset(16)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).offset(30)
            make.height.equalTo(150)
            make.width.equalTo(300)
        }
    }
}
