//
//  SignUpViewController.swift
//  Login-Signup
//
//  Created by apple on 18/12/18.
//  Copyright © 2018 Seraphic. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var EmployeeID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordShow: UITextField!
    @IBOutlet weak var passwordShowLabel: UILabel!
    @IBOutlet weak var passwordMatch: UILabel!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var Gender: UISegmentedControl!
    @IBOutlet weak var showpassword: UILabel!
    
    @IBOutlet weak var error: UILabel!
    
     let DatePick = UIDatePicker()
    
    
    @IBAction func TextFieldAction(_ sender: UITextField) {
     }
    
    
    @IBAction func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func validate() -> Bool {
        
    if textFieldShouldReturn(passwordShow) == false
    {
 return false
        }
        
        if textFieldShouldReturn(Email) == false
        {
            return false
        }
        
        return true
    }
    
    
    @IBAction func SignUpClicked(_ sender: UIButton) {
        if(EmployeeID.text?.isEmpty == false && password.text?.isEmpty == false && passwordShow.text?.isEmpty == false  && Email.text?.isEmpty == false && DateTextField.text?.isEmpty == false )
        {

         if validate() == true
         {
            let alert = UIAlertController(title: "Validated !", message: "Sign up Succeeded", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            
            
            
            
            
            }
        }
        else{
            if EmployeeID.text?.isEmpty == true
            {
                let alert = UIAlertController(title: "Error", message: "Employee ID required", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else if password.text?.isEmpty == true
            {
                let alert = UIAlertController(title: "Error", message: "Password required", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else if passwordShow.text?.isEmpty == true
            {
                let alert = UIAlertController(title: "Error", message: "Re-Enter Passsword required", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }else if Email.text?.isEmpty ==  true
            {
                let alert = UIAlertController(title: "Error", message: "Email required", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }else if DateTextField.text?.isEmpty == true
            {
                let alert = UIAlertController(title: "Error", message: "Date of Birth required", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
          //  error.text = "All details are required"
//            let alert = UIAlertController(title: "Error", message: "All details are required", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            self.present(alert, animated: true)
        }
    }
    
    
    
    @IBAction func GenderSelect(_ sender: UISegmentedControl) {
      if(  Gender.selectedSegmentIndex == 0 )
      {
        GenderLabel.text! = "Male"
        }
        else if ( Gender.selectedSegmentIndex == 1)
      {
        GenderLabel.text! = "Female"
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let DatePick = UIDatePicker()
        
        self.EmployeeID.delegate=self
        self.Email.delegate=self
        self.password.delegate=self
        self.passwordShow.delegate=self
        
        set()
      
        GenderLabel.text! = "Male"
        error.textColor = UIColor.red
    
        //    DatePick.addTarget(self, action: #selector(SignUpViewController.set), for: UIControl.Event.valueChanged)
        // Do any additional setup after loading the view.
        
        
        //        EmployeeID.addTarget(self, action: #selector(SignUpViewController.textViewDidChange(_:)), for: UIControl.Event.editingChanged)
        //
        //        password.addTarget(self, action: #selector(SignUpViewController.textViewDidChange(_:)), for: UIControl.Event.editingChanged)
        //
        //        passwordShow.addTarget(self, action: #selector(SignUpViewController.textViewDidChange(_:)), for: UIControl.Event.editingChanged)
        //
        //
    }
        
        
  
        
       
    
    
   
    
    @objc func set()  {
        
        DatePick.datePickerMode = UIDatePicker.Mode.date
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        
        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self,  action: #selector(SignUpViewController.doneDatePicker));
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(SignUpViewController.cancelDatePicker))
        
        toolBar.setItems([doneButton,spaceButton,cancelButton], animated: true)
        
        
        
        
    
        // add toolbar to textField
        DateTextField.inputAccessoryView = toolBar
        // add datepicker to textField
        DateTextField.inputView = DatePick
        
      
    }
    
    @objc func doneDatePicker()
    {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        DateTextField.text! = dateFormat.string(from: DatePick.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    
     @objc func cancelDatePicker(){
        //cancel button dismiss datepicker dialog
        self.view.endEditing(true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
       
        
       
        
    }
    
    @objc func dismissPicker() {
        
        view.endEditing(true)
        
    }
    
    
    func textViewDidChange(_ textField: UITextView) {

        /*
        
        if textField == passwordShow
        {
            passwordShowLabel.text! = passwordShow.text!
            if(password.text == passwordShow.text)
            {
                passwordMatch.textColor = UIColor.green
                passwordMatch.text! = "Passwords Match !"
            }
            else
            {
                passwordMatch.textColor = UIColor.red
                passwordMatch.text! = "Passwords dont match"
            }
       
        }
        
      
       */
        
        
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


extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
         if textField == password {
            textField.resignFirstResponder()
            passwordShow.becomeFirstResponder()
            return true
        }
        
        
        
        
        if textField == passwordShow {

            if textField.text != password.text {
                
                let alert = UIAlertController(title: "Error", message: "Password not matching", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                return false
            }
                
            else
                
            {
              //   error.text! = ""
                textField.resignFirstResponder()
                Email.becomeFirstResponder()
                return true
            }
            
        }
        
        
        
         if textField == Email {
        if( isValidEmail(testStr: Email.text!) == false)
        {
            
         //   error.text! = "Email is not correct!"
            let alert = UIAlertController(title: "Error", message: "Email is not correct!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return false
        }
        else if (isValidEmail(testStr: Email.text!) == true)
        {
            // error.text! = ""
            textField.resignFirstResponder()
      //      DateTextField.becomeFirstResponder()
            return true
            }
        }
        
        return true
        
    }
}



