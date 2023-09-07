import UIKit

class AddToOrderTableViewCell: UITableViewCell {
    
    static let id = "AddToOrderTableViewCell"
    
    var addLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить к заказу"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
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
        contentView.addSubview(addLabel)
    }

    func setupConstraints() {
        addLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(10)
            make.top.equalTo(contentView).inset(30)
            make.bottom.equalTo(contentView).inset(16)
        }
    }
}
