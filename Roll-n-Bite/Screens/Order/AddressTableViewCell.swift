import UIKit

class AddressTableViewCell: UITableViewCell {
    
    static let id = "AddressTableViewCell"
    
    var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    var waitingLabel: UILabel = {
        let label = UILabel()
        label.text = "ЖДЕМ ТЕБЯ В ДОНЕРНОЙ"
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Тверская застава 7"
        return label
    }()
    
    var fastLabel: UILabel = {
        let label = UILabel()
        label.text = "Как можно скорее"
        return label
    }()
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.backgroundColor = .systemGray6
        stack.layer.cornerRadius = 17
        stack.clipsToBounds = true
        return stack
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
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(waitingLabel)
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(fastLabel)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        waitingLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView).inset(16)
            make.top.equalTo(stackView).inset(16)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView).inset(16)
        }
        
        fastLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView).inset(16)
            make.bottom.equalTo(stackView).inset(16)
        }

    }
}

