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
    
    let image2 = UIImage(named:"background.jpg")
  
   
    @IBOutlet var twoButton: UIButton!
    
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var backButton: UIButton!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    
    imageArray = [image0!,image1!,image2!]
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
            
            timer = Timer.scheduledTimer(withTimeInterval:2, repeats:
            true, block: { (timer) in
               
                self.updateCount = self.updateCount + 1
             
                if(self.updateCount >   2){ //２を上回ったら
                    
                    self.updateCount = 0
                    
                    self.imageZ.image = UIImage(named: "tensi")    //画像変更
                    
                }else{  //２を上回らなかったら
                    
                    self.imageZ.image = self.imageArray[self.updateCount]   //2秒ごとにプラス１されてimage0,1を配列の中から交互に呼び出す
                    
                }
               
        })
    
         }else { //それ以外（nilじゃなかったら）
            
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil              //タイマーはnilになります
            nextButton.isEnabled = true    //ボタン使えるようになります
            backButton.isEnabled = true
            
            twoButton.setTitle("再生", for: .normal)//ボタンの画像変更
        }
        
        
        
}


    @IBAction func nextButton(_ sender: Any) {
    
       
        
        updateCount = updateCount + 1
  
        if updateCount > 2 {
            
            updateCount  = 0
        }
        
        imageZ.image = imageArray[updateCount]
   
     
        }
        
    
    
    @IBAction func backButton(_ sender: Any) {
      
       updateCount = updateCount - 1
        
        if updateCount < 0 {
            
            updateCount = 2
        }
        
        
        imageZ.image = imageArray[updateCount]
        
     
}
        
    

    @IBAction func tapImage(_ sender: Any) {
        if timer != nil{
        timer.invalidate()   // タイマーを停止する
        timer = nil
         
            if  nextButton.isEnabled == false { //{ボタン使えなかったら
                
                nextButton.isEnabled = true
                }
            
            if  backButton.isEnabled == false{
            
                backButton.isEnabled = true
            
                  }
            
            
        }
     
        
        
        twoButton.setTitle("再生", for: .normal)//ボタンの画像変更
        
        performSegue(withIdentifier: "result", sender: nil)
    
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }


    
}
    
    

    
    
    
