import UIKit

class StoryService {
    
    func fetchStories() -> [Story] {
        var stories: [Story] {
            Array(1...6).map { Story(image: UIImage(named: "\($0)") ?? UIImage()) }
        }
        return stories
    }
}
