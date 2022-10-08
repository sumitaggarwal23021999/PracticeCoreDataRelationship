
import UIKit

class CollegeListingTVC: UITableViewCell {

    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!
    @IBOutlet weak var lblNumberOfStudents: UILabel!
    
    var college: College? {
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

        // Configure the view for the selected state
    }
    
    private func showData() {
        if let college = college {
            lblCollegeName.text = college.name
            lblCollegeCity.text = college.city
            lblCollegeUniversity.text = college.university
            lblNumberOfStudents.text = "Number Of Students: \(college.students?.count ?? 0)"
        }
    }

}
