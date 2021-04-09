import UIKit
import CoreData


class DetailVC: UIViewController {

    @IBOutlet weak var newUserMarkTF: UITextField!
    @IBOutlet weak var newUserNameTF: UITextField!
  
    var selectedStudent: StudentModel? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectedStudent != nil){
            newUserMarkTF.text = selectedStudent?.userMark
            newUserNameTF.text = selectedStudent?.userName
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        if(selectedStudent == nil) {
            let entity = NSEntityDescription.entity(forEntityName: "StudentModel", in: context)
            let newStudent = StudentModel(entity: entity!, insertInto: context)
            newStudent.id = studentList.count as NSNumber
            newStudent.userName = newUserNameTF.text
            newStudent.userMark = newUserMarkTF.text
            do{
               try  context.save()
                studentList.append(newStudent)
                navigationController?.popViewController(animated: true)
            }
            catch {
                
            }
        } else
        {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentModel")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let student = result as! StudentModel
                    if(student == selectedStudent) {
                        student.userName = newUserNameTF.text
                        student.userMark = newUserMarkTF.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                    }
                }
            }
            catch {
                
            }
        }
        
    }
    
}

