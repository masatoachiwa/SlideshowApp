//
//  ViewController.swift
//  SlideshowApp
//
//  Created by アプリ開発 on 2019/05/19.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    var timer: Timer!
    
    var imageArray = [UIImage]()
    
    var updateCount = 0
    
    @IBOutlet var imageZ: UIImageView!
    
    let image0 = UIImage(named:"tensi")
  
    let image1 = UIImage(named:"akuma")
    
    @IBOutlet var twoButton: UIButton!
    
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var backButton: UIButton!
    
    var start1: UIImage = UIImage(named:"start")!
    var stop1: UIImage = UIImage(named:"stop")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    
    imageArray = [image0!,image1!]
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let ssecondViewController: secondViewController = segue.destination as! secondViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
    
        ssecondViewController.imageview = self.imageZ.image!
        //置き換えたssecondViewにsecondViewの変数imageviewに、imazeZを代入
    
        
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func start(_ sender: Any) {
 
 
          if self.timer == nil {  // もしタイマーがnilだったら
         
            nextButton.isEnabled = false
            backButton.isEnabled = false
       
            twoButton.setTitle("停止", for: .normal)
            
            timer = Timer.scheduledTimer(withTimeInterval:0.5, repeats:
            true, block: { (timer) in
                
                if(self.updateCount > 1){
                    
                    self.updateCount = 0
                    self.imageZ.image = UIImage(named: "tensi")    //画像変更
                    
                }else{
                    
                    self.imageZ.image = self.imageArray[self.updateCount]   //2秒ごとにプラス１されてimage0,1を配列の中から交互に呼び出す
                    
                }
                self.updateCount = self.updateCount + 1
        })
    
         }else { //それ以外（nilじゃなかったら）
            
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil              //タイマーはnilになります
            nextButton.isEnabled = true    //ボタン使えなくなります
            backButton.isEnabled = true
            
            twoButton.setTitle("再生", for: .normal)//ボタンの画像変更
        }
        
        
        
}


    @IBAction func nextButton(_ sender: Any) {
        
  
        if imageZ.image == UIImage(named:"tensi"){
            imageZ.image = UIImage(named:"akuma")
        
        }else{
            imageZ.image = UIImage(named:"tensi")
        }
    
    
    }
    
    @IBAction func backButton(_ sender: Any) {
     
        if imageZ.image == UIImage(named:"tensi"){
            imageZ.image = UIImage(named:"akuma")
            
        }else{
            imageZ.image = UIImage(named:"tensi")
        }
    
    }
    


    @IBAction func tapImage(_ sender: Any) {
    
    
        performSegue(withIdentifier: "result", sender: nil)
    
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    }
    
    
    
    

    
    
    
    
    
    

        
        
        
        

    
    
    
    
    

    
    
    
