import UIKit

class BasketTableViewCell: UITableViewCell {
    
    static let id = "BasketTableViewCell"

    var basketLabel: UILabel = {
        let label = UILabel()
        label.text = "Корзина"
        label.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(basketLabel)
    }
    
    func setupConstraints() {
        basketLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.top.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(30)
        }
    }
}
