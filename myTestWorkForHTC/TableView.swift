import UIKit
var studentList = [StudentModel]()
class TableView : UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentCell = tableView.dequeueReusableCell(withIdentifier: "studentCellId", for: indexPath) as! StudentCell
        let thisStudent: StudentModel!
        thisStudent = studentList[indexPath.row]
        studentCell.oldUserNameTF.text = thisStudent.userName
        studentCell.oldUserMarkTF.text = thisStudent.userMark
        return studentCell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editUser", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editUser"){
            let indexPath = tableView.indexPathForSelectedRow!
            let studentDetail = segue.destination as? DetailVC
            let selectedStudent: StudentModel!
            selectedStudent = studentList[indexPath.row]
            studentDetail!.selectedStudent = selectedStudent
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
