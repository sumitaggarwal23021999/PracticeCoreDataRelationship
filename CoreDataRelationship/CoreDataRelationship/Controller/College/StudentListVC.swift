
import UIKit

class StudentListVC: UIViewController {

    @IBOutlet weak var tblvwStudents: UITableView!
    
    weak var college: College?
    private var arrStudentList: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblvwStudents.delegate = self
        tblvwStudents.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrStudentList = college?.students?.allObjects as! [Student]
        tblvwStudents.reloadData()
    }
    
    @IBAction func btnAddTapped(_ sender: Any) {
        let addStudentVC = storyboard?.instantiateViewController(withIdentifier: "AddStudentVC") as! AddStudentVC
        addStudentVC.college = college
        navigationController?.pushViewController(addStudentVC, animated: true)
    }
}

extension StudentListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrStudentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvwStudents.dequeueReusableCell(withIdentifier: "StudentListingTVC", for: indexPath) as! StudentListingTVC
        cell.student = arrStudentList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrStudentList = DatabaseHelper.sharedObject.deleteStudent(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
