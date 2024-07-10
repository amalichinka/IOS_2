import UIKit
var users = [(username:"Pochocco", password:"111", dates:"17 января 2024",emails:"milashka@mail.ru",hobby:"хоббихорсинг"), (username:"Териан Лиза Амалиевна", password:"миньо",dates:"12 мая 2005",emails:"lizasupermilashka@mail.ru",hobby:"занимаюсь квадробикой")]

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var checkEnter: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func buttonSignIn(_ sender: Any) {
        var isCorrect = false
        var userDate: String?
        var userMail: String?
        var userHobby: String?
        for user in users {
            if username.text == user.username && password.text == user.password {
                isCorrect = true
                userDate = user.dates
                userMail = user.emails
                userHobby = user.hobby
                break
            }
        }
        
        if isCorrect, let dates = userDate, let emails = userMail, let hobby = userHobby{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondController = storyboard.instantiateViewController(withIdentifier: "second_controller") as! SecondViewController
            checkEnter.text = "Checking results"
            checkEnter.textColor = .black
            secondController.loadViewIfNeeded()
            secondController.setup(name: username.text!)
            secondController.data(date: dates, info: hobby, email: emails)
            navigationController?.pushViewController(secondController, animated: true)
        } else {
            checkEnter.text = "Wrong username or password"
            checkEnter.textColor = .red
        }
    }
}
