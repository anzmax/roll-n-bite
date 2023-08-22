import UIKit

class StoryContainerCell: UICollectionViewCell {
    
    static let id = "StoryContainerCell"
   
    var stories = [Story]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        //layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
        layout.itemSize = CGSize(width: 130, height: 170)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.id)
        
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .yellow
        contentView.addSubview(collectionView)
        //contentView.addSubview(categoriesCollectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func update(with stories: [Story]) {
        self.stories = stories
        collectionView.reloadData()
    }
    
}

extension StoryContainerCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.id, for: indexPath) as! StoryCell
        let story = stories[indexPath.row]
        cell.update(with: story)
        return cell
    }
    
    
}


class StoryCell: UICollectionViewCell {
    
    static let id = "StoryCell"
    
    var storyImageView: UIImageView = {
        let storyImage = UIImageView()
        storyImage.image = UIImage(named: "1")
        return storyImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .red
        layer.cornerRadius = 17
        layer.masksToBounds = true
        contentView.addSubview(storyImageView)
    }
    
    func setupConstraints() {

        storyImageView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(contentView)
        }
    }
    
    func update(with story: Story) {
        storyImageView.image = story.image
    }
}
