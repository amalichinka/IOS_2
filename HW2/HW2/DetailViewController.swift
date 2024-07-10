

import UIKit

class DetailViewController: UIViewController {
    var book: Books! = nil
    init(book: Books) {
               self.book = book
               super.init(nibName: nil, bundle: nil)
           }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImageView.image = UIImage(named: book.image)
        bookNameLabel.text = book.title
        bookDescriptionLabel.text = book.description
    }
    


}
