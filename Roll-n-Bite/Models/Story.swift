import UIKit

struct Story {
    var image: UIImage
}

var stories: [Story] {
    Array(1...20).map { Story(image: UIImage(named: "\($0)") ?? UIImage()) }
}
