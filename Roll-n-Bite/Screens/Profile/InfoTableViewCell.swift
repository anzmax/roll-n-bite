
import UIKit

class InfoTableViewCell: UITableViewCell {
    
    static let id = "InfoTableViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
    
    func update(with info: Info) {
        titleLabel.text = info.title
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(16)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).inset(10)
        }
    }
}
