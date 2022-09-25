//
//  AddExpenseViewController.swift
//  WalletApp
//
//  Created by Büşra Güneş on 8.09.2022.
//

import UIKit

class AddExpenseViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var walletIcon: UIImageView!
    @IBOutlet weak var textFieldStackView: UIStackView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var categoriesStackView: UIStackView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var categoriesIconStackView: UIStackView!
    @IBOutlet weak var coffeeIcon: UIImageView!
    @IBOutlet weak var travelIcon: UIImageView!
    @IBOutlet weak var medicalIcon: UIImageView!
    @IBOutlet weak var marketIcon: UIImageView!
    @IBOutlet weak var otherIcon: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedcategory:CategoryType? = nil
    public var completionHandler:((ExpenseModel)->Void)?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //save button style
        coffeeIcon.alpha = 0.5
        travelIcon.alpha = 0.5
        medicalIcon.alpha = 0.5
        marketIcon.alpha = 0.5
        otherIcon.alpha = 0.5
        saveButton.layer.cornerRadius = 16
        initGesturesConfig()
    }
    
    func initGesturesConfig(){
        configureGestures()
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        
        configureCategoryButtonGestures(view: coffeeIcon, action:  #selector(categoryCoffeeClickked))
        configureCategoryButtonGestures(view: travelIcon, action:  #selector(categoryTravelClickked))
        configureCategoryButtonGestures(view: medicalIcon, action:  #selector(categoryMedicalClickked))
        configureCategoryButtonGestures(view: marketIcon, action:  #selector(categoryMarketClickked))
        configureCategoryButtonGestures(view: otherIcon, action:  #selector(categoryOtherClickked))
    }
    
    func configureCategoryButtonGestures(view:UIImageView,action: Selector?){
        let gesture = UITapGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(gesture)
        view.isUserInteractionEnabled = true
    }
    
    @IBAction func saveButtonPressed(){
        saveButton.showAnimation {}
        let price = Double((priceTextField?.text)!)
        let date = dateTextField?.text
        let description = descriptionTextField?.text
        
        if (price == nil || date == nil || selectedcategory == nil) {
            showAlert()
            return
        }
        
        let expense = ExpenseModel(price:price,date:date, description: description,category: selectedcategory)
        completionHandler?(expense)
        dismiss(animated: true,completion: nil)
    }
    
    func showAlert(){
        
        let alert = UIAlertController(title: "Error", message: "Please fill in all fields and try again", preferredStyle: .alert)
        
        let evetAction = UIAlertAction(title: "Okey", style: .destructive){ action in
            print(" deleted")
        }
        alert.addAction(evetAction)
        self.present(alert, animated: true)
        
    }
    
    func clearSelected(){
        coffeeIcon.alpha = 0.5
        travelIcon.alpha = 0.5
        medicalIcon.alpha = 0.5
        marketIcon.alpha = 0.5
        otherIcon.alpha = 0.5
        switch selectedcategory!{
        case .coffee:
            coffeeIcon.alpha = 1
        
        case .travel:
            travelIcon.alpha = 1
        case .medical:
            medicalIcon.alpha = 1
        case .market:
            marketIcon.alpha = 1
        case .other:
            otherIcon.alpha = 1
        }
    }
    
    @objc func categoryCoffeeClickked(){
        self.coffeeIcon.showAnimation {}
        selectedcategory = CategoryType.coffee
        clearSelected()
    }
    @objc func categoryTravelClickked(){
        self.travelIcon.showAnimation {}
        selectedcategory = CategoryType.travel
        clearSelected()
    }
    
    @objc func categoryMedicalClickked(){
        self.medicalIcon.showAnimation {}
        selectedcategory = CategoryType.medical
        clearSelected()
    }
    
    @objc func categoryMarketClickked(){
        self.marketIcon.showAnimation {}
        selectedcategory = CategoryType.market
        clearSelected()
    }
    
    @objc func categoryOtherClickked(){
        self.otherIcon.showAnimation {}
        selectedcategory = CategoryType.other
        clearSelected()
    }
    
    //MARK: - It provide dissmis to keybord on screen
    func configureGestures(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissOutSide))
        gestureRecognizer.cancelsTouchesInView = true
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func dismissOutSide(){
        priceTextField.endEditing(true)
        dateTextField.endEditing(true)
        descriptionTextField.endEditing(true)
    }
}


