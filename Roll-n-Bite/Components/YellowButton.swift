import UIKit

class YellowButton: UIButton {
    
    var onAction: (()->())?
    
    init(title: String) {
        super.init(frame: .zero)
        
        commonInit(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(_ title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .systemYellow
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.layer.cornerRadius = 17
        
        
        self.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    //MARK: - Action
    @objc func buttonTapped(sender: UIButton) {
        self.onAction?()
    }
}
