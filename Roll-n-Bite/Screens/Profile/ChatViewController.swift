import UIKit

class ChatViewController: UIViewController {

    let enter = EnterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    func setupViews() {
       
        view.addSubview(enter.view)
    }
    
    func setupConstraints() {
        
    }
}
