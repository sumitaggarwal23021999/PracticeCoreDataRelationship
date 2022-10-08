
import UIKit

class StudentListingTVC: UITableViewCell {
    
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblStudentCity: UILabel!
    @IBOutlet weak var lblStudentPhone: UILabel!
    @IBOutlet weak var lblStudentCollegeName: UILabel!
    
    var student: Student? {
        didSet {
            showData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func showData() {
        if let student = student {
            lblStudentName.text = "Name: \(student.name ?? "")"
            lblStudentCity.text = "Name: \(student.address ?? "")"
            lblStudentPhone.text = "Name: \(student.phone ?? "")"
            lblStudentCollegeName.text = "Name: \(student.universities?.name ?? "")"
        }
    }

}
