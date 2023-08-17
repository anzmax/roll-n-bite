import UIKit

class DeliveryAdressesViewController: UIViewController {
    
    //MARK: - UI
    lazy var segmentedControl: CustomSegmentedControl = {
        let items = ["Доставка", "В донерной"]
        let control = CustomSegmentedControl(items: items)
        control.selectedSegmentIndex = 1
        control.selectedSegmentTintColor = .systemIndigo
        control.layer.cornerRadius = 17
        control.layer.masksToBounds = true
        
        control.addTarget(self, action: #selector(segmentControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RuDeliveryTableViewCell.self, forCellReuseIdentifier: RuDeliveryTableViewCell.id)
        tableView.register(KzDeliveryTableViewCell.self, forCellReuseIdentifier: KzDeliveryTableViewCell.id)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        return tableView
    }()
    
    var shopsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    var locationSearchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .systemIndigo.withAlphaComponent(0.8)
        return label
    }()
    
    var addressesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    var addLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .systemIndigo.withAlphaComponent(0.8)
        return label
    }()
    
    lazy var orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заказать отсюда", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.layer.cornerRadius = 17
        return button
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
        view.addSubview(shopsLabel)
        view.addSubview(locationSearchLabel)
        view.addSubview(addressesLabel)
        view.addSubview(addLabel)
        view.addSubview(orderButton)
        view.bringSubviewToFront(segmentedControl)
        tableView.isHidden = true
    }

    func setupConstraints() {
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
        
        shopsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.bottom.equalTo(tableView.snp.top).offset(10)
        }
        
        locationSearchLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.bottom.equalTo(tableView.snp.top).offset(10)
        }
        
        addressesLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalTo(segmentedControl.snp.bottom).offset(25)
        }
        
        addLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.top.equalTo(segmentedControl.snp.bottom).offset(25)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom).offset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        orderButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(45)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    //MARK: - Actions
    @objc func segmentControlValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            tableView.isHidden = true
            shopsLabel.text = nil
            locationSearchLabel.text = nil
            addressesLabel.text = "МОИ АДРЕСА"
            addLabel.text = "Добавить"
            orderButton.isHidden = true
        case 1:
            tableView.isHidden = false
            shopsLabel.text = "ДОНЕРНЫЕ"
            locationSearchLabel.text = "Посмотреть на карте"
            addressesLabel.text = nil
            addLabel.text = nil
            orderButton.isHidden = false
        default: break
        }
    }
}

//MARK: - Extensions
extension DeliveryAdressesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return ruAdresses.count
        } else {
            return kzAdresses.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RuDeliveryTableViewCell.id, for: indexPath) as! RuDeliveryTableViewCell
            cell.delegate = self
            let adress = ruAdresses[indexPath.row]
            cell.update(with: adress)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: KzDeliveryTableViewCell.id, for: indexPath) as! KzDeliveryTableViewCell
            cell.delegate = self
            let adress = kzAdresses[indexPath.row]
            cell.update(with: adress)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 0, width: tableView.frame.width - 32, height: 20)
        
        if section == 0 {
            label.text = "РОССИЯ"
        } else {
            label.text = "КАЗАХСТАН"
        }
        
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .gray
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
}

extension DeliveryAdressesViewController: DeliveryTableViewcellDelegate {
    func infobuttonTapped() {
        let infoVC = InfoViewController()
        if let sheet = infoVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(infoVC, animated: true, completion: nil)
    }
}

