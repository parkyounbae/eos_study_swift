//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 박윤배 on 2021/04/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
        //미리 지정된 스타일이 아닌 우리가 임의로 설정한 스타일로 반환하고 싶다면
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker ){
        print("value changed")
        
        let date: Date = sender.date //sender는 datePicker
        //sender.date 대신에 우리가 데이트 피커를 프로퍼티로 만들어 놓았기 때문에
        //self.datePicker.date 로해도 가능
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //만약 인터페이스 뷰에서 didDatePickerValueChanged의 액션을 날짜피커와 연결해주지 않고
        //코드를 통해 연결해 준다면
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        //target : ViewController
        
    }


}

