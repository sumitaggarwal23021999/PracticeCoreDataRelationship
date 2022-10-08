
import UIKit

class AddCollegeVC: UIViewController {

    @IBOutlet weak var txtfldCollegeName: UITextField!
    @IBOutlet weak var txtfldAddress: UITextField!
    @IBOutlet weak var txtfldCity: UITextField!
    @IBOutlet weak var txtfldUniversity: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnSaveTapped(_ sender: Any) {
        guard let collegeName = txtfldCollegeName.text, let collegeAddress = txtfldAddress.text, let collegeCity = txtfldCity.text, let university = txtfldUniversity.text else { return }
        let dict: [String: Any] = [
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeCity": collegeCity,
            "collegeUniversity": university
        ]
        DatabaseHelper.sharedObject.saveCollege(collegeDict: dict)
        navigationController?.popViewController(animated: true)
    }
}
