//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceButtons1.layer.borderWidth = 3.0
        choiceButtons1.layer.borderColor = UIColor(red: 95/255, green: 178/255, blue: 255/255, alpha: 1.0).cgColor
        choiceButtons1.layer.cornerRadius = choiceButtons1.frame.size.height / 2.0
        choiceButtons2.layer.borderWidth = 3.0
        choiceButtons2.layer.borderColor = UIColor(red: 95/255, green: 178/255, blue: 255/255, alpha: 1.0).cgColor
        choiceButtons2.layer.cornerRadius = choiceButtons1.frame.size.height / 2.0
        choiceButtons3.layer.borderWidth = 3.0
        choiceButtons3.layer.borderColor = UIColor(red: 95/255, green: 178/255, blue: 255/255, alpha: 1.0).cgColor
        choiceButtons3.layer.cornerRadius = choiceButtons1.frame.size.height / 2.0
        
        //------------------------ここから下にクイズを書く------------------------//
//        quizArray.append(["Life is Tech!のロゴTシャツにない色は？", "赤", "オレンジ", "黄色", 2])
//        quizArray.append(["問題文", "選択肢1", "選択肢2", "選択肢3", 1])

        quizArray.append(["せんべいやスナック菓子の「サラダ味」とは、何の味のこと？", "サラッとした味", "サラダ油味", "グリーンサラダ味", 2])
        quizArray.append(["カルパッチョという料理の名前の由来となったのは？", "川の名前", "国王", "画家", 3])
        quizArray.append(["次のうち腐らないものは？", "ネギ", "コンソメスープ", "ハチミツ", 3])
        quizArray.append(["カルボナーラとはどういう意味？", "ベーコンのパスタ", "クリーミーなパスタ", "炭焼きのパスタ", 3])
        quizArray.append(["ラーメンの丼にある渦巻き模様は、何を意味している？", "雲", "渦潮", "雷", 3])
        //------------------------ここから上にクイズを書く------------------------//
        quizArray.shuffle()
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


