import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - UI
    var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Мой профиль"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.layer.cornerRadius = 17
        
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        return button
    }()
    
   lazy var aboutUsButton: UIButton = {
        let button = UIButton()
        button.setTitle("О нас", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(aboutUsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var chatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Чат", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(chatButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    var zenImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "zen2")
        return image
    }()
    
    var heyLabel: UILabel = {
        let label = UILabel()
        label.text = "Хэй-хэй!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
Здесь ты можешь смотреть историю
заказов, добавлять новые адреса и многое
другое
"""
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray3
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(topView)
        topView.addSubview(profileLabel)
        view.addSubview(bottomView)
        bottomView.addSubview(enterButton)
        bottomView.addSubview(aboutUsButton)
        bottomView.addSubview(chatButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(zenImageView)
        contentView.addSubview(heyLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(100)
        }
        
        profileLabel.snp.makeConstraints { make in
            make.centerX.equalTo(topView)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(70)
        }
        
        bottomView.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(160)
        }
        
        enterButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(35)
            make.left.equalTo(bottomView.snp.left).inset(30)
            make.right.equalTo(bottomView.snp.right).inset(30)
            make.height.equalTo(45)
        }
        
        aboutUsButton.snp.makeConstraints { make in
            make.bottom.equalTo(enterButton.snp.top).offset(-16)
            make.left.equalTo(bottomView.snp.left).inset(30)
            make.height.equalTo(45)
            make.width.equalTo(160)
        }
        
        chatButton.snp.makeConstraints { make in
            make.bottom.equalTo(enterButton.snp.top).offset(-16)
            make.right.equalTo(bottomView.snp.right).inset(30)
            make.height.equalTo(45)
            make.width.equalTo(160)
        }
        
        scrollView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(scrollView)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(700)
        }

        zenImageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.width.equalTo(contentView)
            make.height.equalTo(300)
        }
        
        heyLabel.snp.makeConstraints { make in
            make.top.equalTo(zenImageView.snp.bottom).offset(20)
            make.centerX.equalTo(contentView)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(heyLabel.snp.bottom).offset(20)
            make.left.equalTo(contentView).inset(20)
            make.right.equalTo(contentView).inset(20)
        }
    }

    //MARK: - Actions
    @objc func aboutUsButtonTapped() {
        let aboutUsVC = AboutUsViewController()
        if let sheet = aboutUsVC.sheetPresentationController {
            sheet.detents = [.large()]
        }
        present(aboutUsVC, animated: true)
    }
    
    @objc func chatButtonTapped() {
        let chatVC = ChatViewController()
        if let sheet = chatVC.sheetPresentationController {
            sheet.detents = [.large()]
        }
        present(chatVC, animated: true)
    }
    
    @objc func enterButtonTapped() {
        let enterVC = EnterViewController()
        if let sheet = enterVC.sheetPresentationController {
            sheet.detents = [.large()]
        }
        present(enterVC, animated: true)
    }
}
