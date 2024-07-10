import UIKit
let books: [Books] = [
    Books(title: "Три мушкитера", author: "Александр Дюма", image: "book1", description: "французкая литература", details: "100 книг, которые должен прочитать каждый"),
    Books(title: "Тихий Дон", author: "Михаил Шолохов", image: "book2", description: "Первая мировая война в литературе", details: "100 книг, которые должен прочитать каждый"),
    Books(title: "Трое в лодке, не считая собаки", author: "Джером Клапка", image: "book1", description: "Эксклюзивная классика", details: "100 книг, которые должен прочитать каждый")
    
]

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableViewLibrary: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewLibrary.rowHeight = 200
        TableViewLibrary.dataSource = self
        TableViewLibrary.delegate = self
        TableViewLibrary.register(UITableViewCell.self, forCellReuseIdentifier: "BooksCell")
        TableViewLibrary.reloadData()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return books.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BooksCell", for: indexPath)

            let book = books[indexPath.row]
            if book.isFavorite {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
                }
            let image = UIImage(named: book.image)
            cell.imageView?.image = image
            cell.textLabel?.text = book.title
            cell.detailTextLabel?.text = book.description
            

            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TableViewLibrary.deselectRow(at: indexPath, animated: true)
        let book = books[indexPath.row]
        let detailVC = DetailViewController(book: book)
        detailVC.book = book
        navigationController?.pushViewController(detailVC, animated: true)
        }

    @IBAction func addToFavorities(_ sender: Any) {
        if let indexPath: IndexPath = TableViewLibrary.indexPathForRow(at: (sender as AnyObject).convert((sender as AnyObject).frame.origin, to: TableViewLibrary)){
            var book = books[indexPath.row]
            book.isFavorite.toggle()
            TableViewLibrary.reloadRows(at: [indexPath], with: .automatic)
                }
    }
    
}
