import UIKit

class TransparentCell: UICollectionViewCell {
    
    static let id = "TransparentCell"
    //var menuViewController: MenuViewController? 
    var deliveryButtonTapped: (()-> Void)?
    
    lazy var deliveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("В донерной ❯", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.addTarget(self, action: #selector(deliveryButtonAction), for: .touchUpInside)
        return button
    }()
    
    var adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Суворовский 56"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
        backgroundColor = .clear
        contentView.addSubview(deliveryButton)
        contentView.addSubview(adressLabel)
    }
    
    func setupConstraints() {
        deliveryButton.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView)
        }
        
        adressLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(deliveryButton.snp.bottom).offset(10)
        }
    }
    
    @objc func deliveryButtonAction() {
        deliveryButtonTapped?()
//        let deliveryVC = DeliveryAdressesViewController()
//        if let sheet = deliveryVC.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//        }
//        present(deliveryVC, animated: true)
    }
}

