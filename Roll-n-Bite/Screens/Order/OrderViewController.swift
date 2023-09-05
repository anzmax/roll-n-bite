import UIKit

class OrderViewController: UIViewController, AddressCellDelegate {
    func didSelectAddressCell() {
        let deliveryVC = DeliveryAdressesViewController()
        if let sheet = deliveryVC.sheetPresentationController {
            sheet.detents = [.medium()]
            self.present(deliveryVC, animated: true)
        }
    }
    
    
    var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .systemIndigo
        return button
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .systemIndigo
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGreen.withAlphaComponent(0.7)
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 200
        //tableView.separatorStyle = .none

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AddressTableViewCell.self, forCellReuseIdentifier: AddressTableViewCell.id)
        tableView.register(PromocodeTableViewCell.self, forCellReuseIdentifier: PromocodeTableViewCell.id)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(topView)
        topView.addSubview(trashButton)
        topView.addSubview(closeButton)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(50)
        }
        
        trashButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(16)
            make.left.equalTo(view).offset(16)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(16)
            make.right.equalTo(view).inset(16)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.left.right.equalTo(view).inset(16)
            make.bottom.equalTo(view)
        }
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.id, for: indexPath) as! AddressTableViewCell
            cell.addressDelegate = self
            return cell
        }
        
        if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PromocodeTableViewCell.id, for: indexPath) as! PromocodeTableViewCell
            
            cell.arrowButtonAction = {
                let enterVC = EnterPromoViewController()
                if let sheet = enterVC.sheetPresentationController {
                    sheet.detents = [.medium()]
                }
                self.present(enterVC, animated: true)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}


