//
//  FirstTestViewController.swift
//  MBTI_CAT
//
//  Created by 송윤근 on 2022/01/17.
//

import UIKit
import DLRadioButton

class FirstTestViewController: UIViewController {
    
    
    @IBOutlet weak var AButton: DLRadioButton!
    
    @IBOutlet weak var weakAButton: DLRadioButton!
    
    @IBOutlet weak var MiddleButton: DLRadioButton!
    @IBOutlet weak var weakBButton: DLRadioButton!
    @IBOutlet weak var BButton: DLRadioButton!
    @IBOutlet weak var ProgressTestLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var TestText_TV: UITextView!
    
    
    let testText : Array<String> = [
        "\n 1번 \n\n 나는 평소에 여기저기 돌아다니는 것을 좋아한다.",
        "\n 2번 \n\n 여행, 산책, 운동을 즐겨하는 편이다.",
        "\n 3번 \n\n 나는 처음 보는 사람과 쉽게 친해지는 편이다.",
        "\n 4번 \n\n 나는 다른 사람에게 정을 많이 준다.",
        "\n 5번 \n\n 나는 새로운 환경에 쉽게 적응하고 편해진다.",
        "\n 6번 \n\n 처음 접하는 것에 대해 거부감이 없다.",
        "\n 7번 \n\n 나는 혼자 놀아도 재미있게 놀 수 있다.",
        "\n 8번 \n\n 나는 주변에서 머리가 좋다는 말을 종종 듣는다.",
        "\n 9번 \n\n 나는 규칙적인 식단, 운동 등 자기관리가 철저하다.",
        "\n 10번 \n\n 나는 주변에서 말이 많다는 말을 자주 듣는다.",
        "\n 11번 \n\n 나는 다양한 것에 궁금증을 종종 느낀다.",
        "\n 12번 \n\n 나는 종종 다른사람들에게 장난을 친다.",
    ]
    
    
    var countresult : Int = 0
    var flagResult : Array<Float> = []
    
    var selectresultValue : Float = -1
    
    var progresstestcount = 0
    
    var all_test_count : Int = 0
    
    
    override func viewDidLoad() {
        
        countresult = 0
        selectresultValue = -1
        progresstestcount = 0
        
        all_test_count = testText.count
        
       
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        if progresstestcount + 1 == all_test_count {
            // print("프로그래스" ,progresstestcount)
            self.NextButton.setTitle("결과 확인", for: .normal)
        }
        AButton.isSelected = false
        BButton.isSelected = false
        weakAButton.isSelected = false
        weakBButton.isSelected = false
        MiddleButton.isSelected = false
        
        
        TestText_TV.text = testText[progresstestcount]
        ProgressTestLabel.text = String(progresstestcount + 1) + "/" + String(all_test_count)
        
    }

    
    
    @IBAction func onBtnNext(_ sender: UIButton) {
        
        
        
        guard selectresultValue != -1 else {
            print("다 입력되지 않음.")
            return
        }
        
        print(selectresultValue)
        
        flagResult.append( selectresultValue )
        
        
        
        selectresultValue = -1
        progresstestcount += 1
        
        if progresstestcount == all_test_count {
            
            let ResultVC = self.storyboard?.instantiateViewController(identifier: "TestResultVC") as! TestResultViewController
            
            ResultVC.TestResultARR = flagResult
            
            self.navigationController?.pushViewController(ResultVC, animated: true)
            
            
            
        }
        else {
            
            viewWillAppear(true)
            
        }
        
    }
    
    @IBAction func onBtnA(_ sender: DLRadioButton) {
        print("A")
        selectresultValue = 4
        
    }
    
   
    
    @IBAction func onBtnWeakA(_ sender: DLRadioButton) {
        
        print("weakA")
        selectresultValue = 3
    }
    
    @IBAction func onBtnM(_ sender: DLRadioButton) {
        
        print("Middle")
        selectresultValue = 2
        
    }
    
    @IBAction func onBtnWeakB(_ sender: DLRadioButton) {
        
        print("weakB")
        selectresultValue = 1
    }
    
    
    @IBAction func onBtnB(_ sender: DLRadioButton) {
        
        print("B")
        selectresultValue = 0
        
    }
    
    
   
    
    
    
}


// 이후 작업할 일
// 진행도가 9개씩 끊길 예정, 그래서 그 9개 마다 EI 판별인지 SN 판별인지 등등.
// 그래서 최종 완료 누를때 결과가 연산되게 할 예정, 그래고 그 결과를 저장할지 말지에 대해서 역시 만들 예정.

// 그럴려면 next와 prev 누를 때 어떤 함수가 들어갈지.
// 그리고 눌렀을 때 이전 결과값을 불러오고, 화면 새로 고침에 대해서도 구현.

// dl radio에서 셀렉트를 다 풀 수 있나 확인도 해봐야함.(안되면 그냥.. 이어나갈 예정.


