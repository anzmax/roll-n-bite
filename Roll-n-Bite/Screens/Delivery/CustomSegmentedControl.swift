import UIKit

class CustomSegmentedControl: UISegmentedControl {
    
    private var backgroundview: UIView?
    
    override init(items: [Any]?) {
        super.init(items: items)
        
//        let backgroundView = UIView()
//        //backgroundView.backgroundColor = .systemIndigo.withAlphaComponent(0.8)
//        backgroundView.layer.cornerRadius = 17
//        //backgroundView.clipsToBounds = true
//        backgroundView.layer.masksToBounds = true
//        backgroundView.translatesAutoresizingMaskIntoConstraints = false
//        self.insertSubview(backgroundView, at: 0)
//        self.backgroundview = backgroundView
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15, weight: .regular),
            .foregroundColor: UIColor.black,
        ]
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15, weight: .heavy),
            .foregroundColor: UIColor.white
        ]
        
        self.setTitleTextAttributes(normalTextAttributes, for: .normal)
        self.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
//        backgroundView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
