import UIKit

class SumTableViewCell: UITableViewCell {
    
    static let id = "SumTableViewCell"
    
    var sumLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого 777 ₽"
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
        contentView.addSubview(sumLabel)
    }
    
    func setupConstraints() {
        sumLabel.snp.makeConstraints { make in
            make.right.equalTo(contentView)
            make.top.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(5)
        }
    }
}
