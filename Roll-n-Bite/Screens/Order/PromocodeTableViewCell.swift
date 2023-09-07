import UIKit

class PromocodeTableViewCell: UITableViewCell {
    
    static let id = "PromocodeTableViewCell"
    
    var arrowButtonAction: (() -> Void)?
    
    var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 17
        view.clipsToBounds = true
        return view
    }()
    
    var promoLabel: UILabel = {
        let label = UILabel()
        label.text = "Ввести промокод"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    lazy var arrowButton: UIButton = {
        let button = UIButton()
        button.setTitle("❯", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        return button
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
        contentView.addSubview(grayView)
        grayView.addSubview(promoLabel)
        grayView.addSubview(arrowButton)
    }
    
    func setupConstraints() {
        grayView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        promoLabel.snp.makeConstraints { make in
            make.left.equalTo(grayView).inset(16)
            make.centerY.equalTo(grayView)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.right.equalTo(grayView).inset(16)
            make.centerY.equalTo(grayView)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    
    @objc func arrowButtonTapped() {
        arrowButtonAction?()
    }

}
