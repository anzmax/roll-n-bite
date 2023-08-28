import UIKit

class AboutUsViewController: UIViewController {
    
    //MARK: - UI
    var aboutUsLabel = HeadlineLabel(text: "О нас")
    
    var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    var topViewLabel: UILabel = {
        let label = UILabel()
        label.text = "О нас"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.backgroundColor = .white
        return content
    }()
    
    var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = """
"Донер 42" - сеть донер-кафе
     быстрого питания
"""
        return label
    }()
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    var vkLogoImageView: UIImageView = {
        let vkLogo = UIImageView()
        vkLogo.image = UIImage(named: "vk")
        vkLogo.translatesAutoresizingMaskIntoConstraints = false
        vkLogo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        vkLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return vkLogo
    }()

    var telegramLogoImageView: UIImageView = {
        let telegramLogo = UIImageView()
        telegramLogo.image = UIImage(named: "telegram")
        telegramLogo.translatesAutoresizingMaskIntoConstraints = false
        telegramLogo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        telegramLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return telegramLogo
    }()
    
    var versionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.text = "Версия приложения 4.19.0 (1)"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(topView)
        topView.addSubview(topViewLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(aboutUsLabel)
        contentView.addSubview(logoImageView)
        contentView.addSubview(descriptionLabel)
        stackView.addArrangedSubview(vkLogoImageView)
        stackView.addArrangedSubview(telegramLogoImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(versionLabel)
        contentView.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(50)
        }
        
        topViewLabel.snp.makeConstraints { make in
            make.centerX.equalTo(topView)
            make.top.equalTo(view).offset(25)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.left.right.bottom.equalTo(view)
            //make.width.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(700)
        }
        
        aboutUsLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.left.equalTo(contentView).inset(16)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(aboutUsLabel.snp.bottom).offset(20)
            make.height.equalTo(150)
            make.width.equalTo(300)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(25)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(stackView.snp.bottom).offset(25)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(contentView)
            make.top.equalTo(versionLabel.snp.bottom).offset(45)
        }
    }
}

//MARK: - Extensions
extension AboutUsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.id, for: indexPath) as! InfoTableViewCell
        let info = information[indexPath.row]
        cell.update(with: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}
