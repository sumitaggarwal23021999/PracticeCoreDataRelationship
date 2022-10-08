
import UIKit

class AddStudentVC: UIViewController {

    weak var college: College?
    
    @IBOutlet weak var txtfldStudentName: UITextField!
    @IBOutlet weak var txtfldStudentCity: UITextField!
    @IBOutlet weak var txtfldStudentPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        let dict: [String: Any] = [
            "studentName": txtfldStudentName.text ?? "",
            "studentCity": txtfldStudentCity.text ?? "",
            "studentPhone": txtfldStudentPhone.text ?? ""
        ]
        DatabaseHelper.sharedObject.saveStudent(dict: dict, college: college)
        navigationController?.popViewController(animated: true)
    }
}
