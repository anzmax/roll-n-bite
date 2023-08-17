import UIKit

class KzDeliveryTableViewCell: UITableViewCell {
    
    static let id = "KzDeliveryTableViewCell"
    
    var delegate: DeliveryTableViewcellDelegate?
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    var scheduleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "record.circle"), for: .selected)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .gray
        button.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = .lightGray
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(locationLabel)
        contentView.addSubview(scheduleLabel)
        contentView.addSubview(selectButton)
        contentView.addSubview(infoButton)
    }
    
    func update(with adress: Adress) {
        locationLabel.text = adress.location
        scheduleLabel.text = adress.schedule
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        selectButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(15)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        infoButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(15)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(selectButton.snp.right).offset(20)
            make.top.equalToSuperview().inset(15)
        }
        
        scheduleLabel.snp.makeConstraints { make in
            make.left.equalTo(selectButton.snp.right).offset(20)
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
            make.bottom.lessThanOrEqualToSuperview().inset(10)
        }
    }
    
    //MARK: - Actions
    @objc func selectButtonTapped() {
        selectButton.isSelected.toggle()
    }
    
    @objc func infoButtonTapped() {
        delegate?.infobuttonTapped()
    }
}
