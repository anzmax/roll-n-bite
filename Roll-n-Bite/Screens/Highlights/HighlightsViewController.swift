
import UIKit

class HighlightsViewController: UIViewController {
    
    var highlights = [Highlights]()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    
    func setupViews() {
        view.addSubview(scrollView)
        for picture in highlights {
            let imageView = UIImageView(image: picture.image)
            scrollView.addSubview(imageView)
        }

    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(view)
        }
    }
}

