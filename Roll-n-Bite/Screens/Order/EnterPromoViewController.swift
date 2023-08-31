import UIKit

class EnterPromoViewController: UIViewController {
    
    lazy var applyButton = YellowButton.init(title: "Применить")
    
    var promoLabel = HeadlineLabel(text: "Промокод")
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.clearButtonMode = .never
        textField.text = "Введи его сюда"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.cornerRadius = 14
        textField.clipsToBounds = true
        
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = leftView
        textField.leftViewMode = .always

        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .systemGray5
        view.addSubview(applyButton)
        view.addSubview(textField)
        view.addSubview(promoLabel)
    }
    
    func setupConstraints() {
        applyButton.snp.makeConstraints { make in
            make.left.right.equalTo(view).inset(16)
            make.top.equalTo(textField.snp.bottom).offset(24)
            make.height.equalTo(50)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(promoLabel.snp.bottom).offset(24)
            make.centerX.equalTo(view)
            make.left.right.equalTo(view).inset(16)
            make.height.equalTo(50)
        }
        
        promoLabel.snp.makeConstraints { make in
            make.left.equalTo(view).inset(16)
            make.top.equalTo(view).inset(32)
        }
    }
}


