//
//  ViewController.swift
//  Alert
//
//  Created by 박윤배 on 2021/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchUpShowAlertButton(_ sender: UIButton){
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton){
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    //스타일은 이 두가지가 존재함 : actionSheet, alert
    
    func showAlertController(style : UIAlertController.Style){
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        //이런식으로 핸들러를 상수로 선언할수 있다.
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler)
            //이 핸들러는 사용자가 오케이 버튼을 눌렀을때 실행되는 코드)
        
        //액션으로 대체된다.
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        //핸들러가 nil이면 아무런 행동을 안하고 무시
        //캔슬 액션은 단 하나의 함수만 사용 가능하다
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "someAction", style: UIAlertAction.Style.destructive, handler: handler)
        //이 스타일은 무언가 삭제를할 때... 선택지에는 빨간색으로 나타나게 된다.
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addAction(someAction)
        //이 액션들을 컨트롤러에 추가
        
        if style == UIAlertController.Style.alert {
            alertController.addTextField {(field: UITextField) in
                field.placeholder = "placegholder"
                field.textColor = UIColor.red
                //텍스트 필드 안을 어떻게 꾸밀지 
            }
        }
        
        //모달 호출
        self.present(alertController, animated: true, completion: {
            //호출 직후에 실행될 코드
            print("Alert Controller Shown")
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

