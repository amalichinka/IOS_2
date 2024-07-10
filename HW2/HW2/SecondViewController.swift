//
//  SecondViewController.swift
//  HW2
//
//  Created by Kremen Amalia on 02.07.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var moreInf: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet private weak var userEmail: UITextField!
    @IBOutlet weak var birthDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setup(name: String) {
        userName.text = name
    }
    func data(date: String, info: String, email: String) {
        birthDate.text = date
        moreInf.text = info
        userEmail.text = email
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
