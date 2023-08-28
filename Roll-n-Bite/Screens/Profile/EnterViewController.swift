import UIKit

class EnterViewController: UIViewController {
    
    //MARK: - UI
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    var addNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Введи номер"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.clearButtonMode = .never
        textField.text = "+7"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.cornerRadius = 14
        textField.clipsToBounds = true
        
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = leftView
        textField.leftViewMode = .always

        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    var notificationLabel: UILabel = {
        let label = UILabel()
        label.text = """
Настройки уведомлений будут
доступны в профиле
"""
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray3
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var personalDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Обработка персональных данных"
        label.textColor = .systemIndigo.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
//    lazy var getCodeButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Получить код", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.backgroundColor = .systemYellow
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        button.layer.cornerRadius = 17
//        return button
//    }()
    
    lazy var getCodeButton = YellowButton.init(title: "Получить код")
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        updatePlaceholder()
        setupActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        textField.becomeFirstResponder()

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.textField.becomeFirstResponder()
        }


    }


    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(addNumberLabel)
        contentView.addSubview(textField)
        contentView.addSubview(notificationLabel)
        contentView.addSubview(personalDataLabel)
        contentView.addSubview(getCodeButton)
    }
    
    func setupActions() {
        
        getCodeButton.onAction = {
            print("Get code")
        }
    }

    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
        
        addNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view).inset(185)
            make.centerX.equalTo(view)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(addNumberLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(50)
        }
        
        notificationLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(textField.snp.bottom).offset(20)
        }
        
        personalDataLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(notificationLabel.snp.bottom).offset(60)
        }
        
        getCodeButton.snp.makeConstraints { make in
            make.left.right.equalTo(view).inset(20)
            make.top.equalTo(personalDataLabel.snp.bottom).offset(20)
            make.height.equalTo(45)
        }
    }
    
    //MARK: - Actions
    @objc func textFieldDidChange(_ textField: UITextField) {
        updatePlaceholder()
    }
    
    
    
    func updatePlaceholder() {
        
         let placeholder = "+7 999 999-99-99"
         
         if let text = textField.text, text.isEmpty {
             textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
                 .foregroundColor: UIColor.lightGray,
                 .font: UIFont.systemFont(ofSize: 14, weight: .regular)
             ])
         } else {
             textField.attributedPlaceholder = nil
         }
     }
 }

//MARK: - Extensions
extension EnterViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text as NSString? ?? ""
        let updatedText = currentText.replacingCharacters(in: range, with: string)
        
        if updatedText.isEmpty {
            updatePlaceholder()
        }
        return true
    }
}
