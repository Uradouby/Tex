//
//  ViewController.swift
//  Tex
//
//  Created by njuios on 2021/1/16.
//

import UIKit

let G:Float = 9.8
let SCREEN_SIZE = UIScreen.main.bounds
typealias noBtnBlock = ()->()
typealias okBtnBlock = ()->()

class SkimView: UIView
{
    
    var bgView:UIView!
    var pinkView:UIView!
    var blueView:UIView!
    var tip:UILabel!
    var okBtn:UIButton!
    var noBtn:UIButton!
    
    var noBlock:noBtnBlock?
    var okBlock:okBtnBlock?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        self.bgView = UIView()
        self.bgView.layer.cornerRadius = 10
        self.bgView.clipsToBounds = true
        self.addSubview(self.bgView)
        
        self.blueView = UIView()
        self.bgView.addSubview(self.blueView)
        
        self.pinkView = UIView()
        self.bgView.addSubview(self.pinkView)
        
        self.tip = UILabel()
        self.tip.textAlignment = .center
        self.tip.text = "Skip this question?"
        self.blueView.addSubview(self.tip)
        
        self.noBtn = UIButton()
        self.noBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.noBtn.layer.cornerRadius = 3
        self.noBtn.clipsToBounds = true
        self.noBtn.addTarget(self, action: #selector(noBtnClick), for: .touchUpInside)
        self.noBtn.setTitle("NO", for: .normal)
        self.pinkView.addSubview(self.noBtn)
        
        self.okBtn = UIButton()
        self.okBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.okBtn.layer.cornerRadius = 3
        self.okBtn.clipsToBounds = true
        self.okBtn.addTarget(self, action: #selector(okBtnClick), for: .touchUpInside)
        self.okBtn.setTitle("YES", for: .normal)
        self.pinkView.addSubview(self.okBtn)
    }
    
    @objc func noBtnClick()
    -> Void
    {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        self.bgView = UIView()
        self.bgView.layer.cornerRadius = 10
        self.bgView.clipsToBounds = true
        self.addSubview(self.bgView)
        
        self.blueView = UIView()
        self.bgView.addSubview(self.blueView)
        
        self.pinkView = UIView()
        self.bgView.addSubview(self.pinkView)
        
        self.tip = UILabel()
        self.tip.textAlignment = .center
        self.tip.text = "Skip this question?"
        self.blueView.addSubview(self.tip)
        
        self.noBtn = UIButton()
        self.noBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.noBtn.layer.cornerRadius = 3
        self.noBtn.clipsToBounds = true
        self.noBtn.addTarget(self, action: #selector(noBtnClick), for: .touchUpInside)
        self.noBtn.setTitle("NO", for: .normal)
        self.pinkView.addSubview(self.noBtn)
        
        self.okBtn = UIButton()
        self.okBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.okBtn.layer.cornerRadius = 3
        self.okBtn.clipsToBounds = true
        self.okBtn.addTarget(self, action: #selector(okBtnClick), for: .touchUpInside)
        self.okBtn.setTitle("YES", for: .normal)
        self.pinkView.addSubview(self.okBtn)
        if((self.noBlock) != nil)
        {
            self.noBlock!()
        }
    }
    
    @objc func okBtnClick()
    -> Void
    {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        self.bgView = UIView()
        self.bgView.layer.cornerRadius = 10
        self.bgView.clipsToBounds = true
        self.addSubview(self.bgView)
        
        self.blueView = UIView()
        self.bgView.addSubview(self.blueView)
        
        self.pinkView = UIView()
        self.bgView.addSubview(self.pinkView)
        
        self.tip = UILabel()
        self.tip.textAlignment = .center
        self.tip.text = "Skip this question?"
        self.blueView.addSubview(self.tip)
        
        self.noBtn = UIButton()
        self.noBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.noBtn.layer.cornerRadius = 3
        self.noBtn.clipsToBounds = true
        self.noBtn.addTarget(self, action: #selector(noBtnClick), for: .touchUpInside)
        self.noBtn.setTitle("NO", for: .normal)
        self.pinkView.addSubview(self.noBtn)
        
        self.okBtn = UIButton()
        self.okBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.okBtn.layer.cornerRadius = 3
        self.okBtn.clipsToBounds = true
        self.okBtn.addTarget(self, action: #selector(okBtnClick), for: .touchUpInside)
        self.okBtn.setTitle("YES", for: .normal)
        self.pinkView.addSubview(self.okBtn)
        if((self.okBlock) != nil)
        {
            self.okBlock!()
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        self.bgView.frame = CGRect.init(x: 0, y: 0, width: 200, height: 120)
        self.bgView.center = self.center
        
        
        
        self.tip.frame = self.blueView.bounds
        
        let btnWidth =  0.5 * 0.5
        let btnHeight = 0.5
        self.noBtn.frame = CGRect.init(x: btnWidth * 0.5 , y: btnHeight * 0.5, width: btnWidth, height: btnHeight)
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}



class ViewController: UIViewController

{

    var timer:Timer?
    var timer2:Timer?
    var timer3:Timer?
    var i:Int = 0
    var bird:UIImageView!
    var t:Float = 0
    var isDown:Bool = false
    var isGameOver:Bool = false
    var view1:UIImageView!
    var view2:UIImageView!
    var view3:UIImageView!
    var view4:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.creatBackGroundView()
        self.creatWood()
        self.creatBird()
        self.creatTimer()
        
    }

    
    func creatBackGroundView()
    {
        //load the background view
        //let the image of the background add to the mainview
        
        let image = UIImage(named: "bg")
        
        view1 = UIImageView(image: image)
        
        view2 = UIImageView(image: image)
        
        view1.tag = 101
        //set view1 tag
        
        view2.tag = 102
        //set view2 tag
        
        view1.frame = CGRect(x: 0, y: 0, width: SCREEN_SIZE.width, height: SCREEN_SIZE.height)
        //set view1 frame
        
        view2.frame = CGRect(x: SCREEN_SIZE.width, y: 0, width: SCREEN_SIZE.width+1, height: SCREEN_SIZE.height)
        //set view2 frame
        
        self.view.addSubview(view1)
        
        self.view.addSubview(view2)
        
        let image2=UIImage(named: "land")
        view3 = UIImageView(image: image2)
        //set view3
        view4 = UIImageView(image: image2)
        
        view3.frame = CGRect(x: 0, y: SCREEN_SIZE.height-100, width: SCREEN_SIZE.width, height: 100)
        view4.frame = CGRect(x: SCREEN_SIZE.width, y: SCREEN_SIZE.height-100, width: SCREEN_SIZE.width+1, height: 100)
        //set view3 view4 frame
        
        view3.tag=103
        view4.tag=104
        //set view3 view4 tag
        self.view.addSubview(view3)
        self.view.addSubview(view4)
        
    }

    func creatTimer()
    {
        
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(appAction), userInfo: nil, repeats: true)
        //set timer1
        
        timer2 = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(appAction2), userInfo: nil, repeats: true)
        //set timer2
        
        timer3 = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(birdMove), userInfo: nil, repeats: true)
        //set timer3
    }
    
    @objc func appAction()
    {
        self.mainViewMove()
        self.isHitting()
    }
    
    
    @objc func appAction1(){
        let view1=self.view.viewWithTag(301)!
        
        
        let view2=self.view.viewWithTag(302)!
        let view3=self.view.viewWithTag(303)!
        
        let view4=self.view.viewWithTag(304)!
        
        let view5=self.view.viewWithTag(305)!
        
        let view6=self.view.viewWithTag(306)!
        let afloatNum : CGFloat = -350.0;
        let view1x = view1.frame.origin.x
        if view1x > afloatNum{
            var frame:CGRect=view1.frame
            frame.origin.x-=2
            view1.frame=frame
            var frame2:CGRect=view2.frame
            frame2.origin.x-=2
            view2.frame=frame2
        }else{
            var frame=view1.frame
            frame.origin.x=SCREEN_SIZE.width
            view1.frame=frame
            
            var frame2=view2.frame
            frame2.origin.x=SCREEN_SIZE.width
            view2.frame=frame2
            self.appearWood(view1: view1 as! UIImageView, view2: view2 as! UIImageView)
        }
        if view3.frame.origin.x > afloatNum{
            var frame:CGRect=view3.frame
            frame.origin.x-=2
            view3.frame=frame
            var frame2:CGRect=view4.frame
            frame2.origin.x-=2
            view4.frame=frame2
        }else{
            var frame=view3.frame
            frame.origin.x=SCREEN_SIZE.width
            view3.frame=frame
            
            var frame2=view4.frame
            frame2.origin.x=SCREEN_SIZE.width
            view4.frame=frame2
            self.appearWood(view1: view3 as! UIImageView, view2: view4 as! UIImageView)
        }
        if view5.frame.origin.x > afloatNum{
            var frame:CGRect=view5.frame
            frame.origin.x-=2
            view5.frame=frame
            var frame2:CGRect=view6.frame
            frame2.origin.x-=2
            view6.frame=frame2
        }else{
            var frame=view5.frame
            frame.origin.x=SCREEN_SIZE.width
            view5.frame=frame
            
            var frame2=view6.frame
            frame2.origin.x=SCREEN_SIZE.width
            view6.frame=frame2
            self.appearWood(view1: view5 as! UIImageView, view2: view6 as! UIImageView)
        }
    }
    
    
    @objc func appAction2(){
        let view1=self.view.viewWithTag(301)!
        let view2=self.view.viewWithTag(302)!
        let view3=self.view.viewWithTag(303)!
        let view4=self.view.viewWithTag(304)!
        let view5=self.view.viewWithTag(305)!
        let view6=self.view.viewWithTag(306)!
        //set view1..6
        
        let afloatNum : CGFloat = -350.0;
        let view1x = view1.frame.origin.x
        
        if view1x > afloatNum
        {
            var frame:CGRect=view1.frame
            frame.origin.x-=2
            view1.frame=frame
            var frame2:CGRect=view2.frame
            frame2.origin.x-=2
            view2.frame=frame2
        }else{
            var frame=view1.frame
            frame.origin.x=SCREEN_SIZE.width
            view1.frame=frame
            
            var frame2=view2.frame
            frame2.origin.x=SCREEN_SIZE.width
            view2.frame=frame2
            self.appearWood(view1: view1 as! UIImageView, view2: view2 as! UIImageView)
        }
        if view3.frame.origin.x > afloatNum{
            var frame:CGRect=view3.frame
            frame.origin.x-=2
            view3.frame=frame
            var frame2:CGRect=view4.frame
            frame2.origin.x-=2
            view4.frame=frame2
        }else{
            var frame=view3.frame
            frame.origin.x=SCREEN_SIZE.width
            view3.frame=frame
            
            var frame2=view4.frame
            frame2.origin.x=SCREEN_SIZE.width
            view4.frame=frame2
            self.appearWood(view1: view3 as! UIImageView, view2: view4 as! UIImageView)
        }
        if view5.frame.origin.x > afloatNum{
            var frame:CGRect=view5.frame
            frame.origin.x-=2
            view5.frame=frame
            var frame2:CGRect=view6.frame
            frame2.origin.x-=2
            view6.frame=frame2
        }else{
            var frame=view5.frame
            frame.origin.x=SCREEN_SIZE.width
            view5.frame=frame
            
            var frame2=view6.frame
            frame2.origin.x=SCREEN_SIZE.width
            view6.frame=frame2
            self.appearWood(view1: view5 as! UIImageView, view2: view6 as! UIImageView)
        }
    }
    
    func mainViewMove() {
        i = i + 1
        if i > 100{
            i = 1
        }
        
        if view1.frame.origin.x > -SCREEN_SIZE.width{
            var frame = view1.frame
            frame.origin.x -= 1
            view1.frame = frame
        }else{
            var frame = view1.frame
            frame.origin.x=SCREEN_SIZE.width
            view1.frame=frame
        }
        if view2.frame.origin.x > -SCREEN_SIZE.width{
            var frame=view2.frame
            frame.origin.x-=1
            view2.frame=frame
        }else{
            var frame=view2.frame
            frame.origin.x=SCREEN_SIZE.width
            view2.frame=frame
        }
        if view3.frame.origin.x > -SCREEN_SIZE.width{
            var frame=view3.frame
            frame.origin.x-=2
            view3.frame=frame
        }else{
            var frame=view3.frame
            frame.origin.x=SCREEN_SIZE.width
            view3.frame=frame
        }
        if view4.frame.origin.x > -SCREEN_SIZE.width{
            var frame=view4.frame
            frame.origin.x-=2
            view4.frame=frame
        }else{
            var frame=view4.frame
            frame.origin.x=SCREEN_SIZE.width
            view4.frame=frame
        }
        
    }
    
    func isHitting(){
        let view1=self.view.viewWithTag(301)!
        let view2=self.view.viewWithTag(302)!
        let view3=self.view.viewWithTag(303)!
        let view4=self.view.viewWithTag(304)!
        let view5=self.view.viewWithTag(305)!
        let view6=self.view.viewWithTag(306)!
        if  bird.frame.intersects(view1.frame) ||
            bird.frame.intersects(view2.frame) ||
            bird.frame.intersects(view3.frame) ||
            bird.frame.intersects(view4.frame) ||
            bird.frame.intersects(view5.frame) ||
            bird.frame.intersects(view6.frame) {
            
            timer!.fireDate = Date.distantFuture as Date
            timer2!.fireDate = Date.distantFuture as Date
            timer3!.fireDate = Date.distantFuture as Date
            bird?.stopAnimating()
            self.gameOver()
            
        }
    }
    
    func appearWood(view1:UIImageView,view2:UIImageView){
        let hight=arc4random()%222+30
        var rant1=view1.frame
        var rant2=view2.frame
        rant1.origin.y = (CGFloat)(-SCREEN_SIZE.height)+(CGFloat)(hight)
        rant2.origin.y = (CGFloat)(hight)+100.0
        view1.frame=rant1
        view2.frame=rant2
        
    }
    
    
    @objc func birdMove(){
        if !isDown{
            if bird.frame.origin.y < SCREEN_SIZE.height-100{
                var rant:CGRect=bird!.frame
                rant.origin.y += (CGFloat)(G*(t*t/2))
                bird?.frame=rant
                t+=0.025
            }
        }else{
            if t<0.24{
                var rant = bird?.frame
                rant?.origin.y -= 4.9-(CGFloat)(G*t*t/2)
                bird?.frame=rant!
                t+=0.025
            }else{
                isDown = false
            }
        }
    }
    
    
    func creatBird(){
        let images:NSMutableArray=NSMutableArray()
        
        for j in 1..<4 {
            let image = UIImage(named: String(format: "tex%d", j))
            images.add(image as Any)
        }
        bird=UIImageView(frame: CGRect(x: 50, y: 200, width: 35, height: 35) )
        bird?.animationImages = images as? [UIImage]
        bird?.animationRepeatCount=0
        bird?.animationDuration=0.3
        bird?.image=images[i] as? UIImage
        bird?.startAnimating()
        self.view.addSubview(bird!)
    }
    
    func creatWood(){
        let image:UIImage = UIImage(named: "block1")! //04
        let image2:UIImage = UIImage(named: "block2")! //05
        let view1:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
        let view2:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
        view1.image=image
        view2.image=image2
        view1.tag=301
        view2.tag=302
        
        let view3:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width+200, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
        let view4:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width+200, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
        view3.image=image
        view4.image=image2
        view3.tag=303
        view4.tag=304
        
        let view5:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width+400, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
        let view6:UIImageView=UIImageView(frame: CGRect(x: SCREEN_SIZE.width+400, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height))
        view5.image=image
        view6.image=image2
        view5.tag=305
        view6.tag=306
        
        let image0=self.view.viewWithTag(103)
        self.view.insertSubview(view1, belowSubview: image0!)
        self.view.insertSubview(view2, belowSubview: image0!)
        self.view.insertSubview(view3, belowSubview: image0!)
        self.view.insertSubview(view4, belowSubview: image0!)
        self.view.insertSubview(view5, belowSubview: image0!)
        self.view.insertSubview(view6, belowSubview: image0!)

    }
    
    func gameOver(){
        isGameOver=true
        let gameOver:UIImageView=UIImageView(frame: CGRect(x: 30, y: 100, width: SCREEN_SIZE.width-60, height: 60))
        gameOver.image=UIImage(named: "gameover")
        gameOver.tag=900
        self.view .addSubview(gameOver)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameOver {
            isGameOver=false
            let im = self.view.viewWithTag(900)
            im!.removeFromSuperview()
            self.reloadGame()
        }else {
            isDown = true
            t = 0
        }
    }
    
    func reloadGame(){
        //make the game reload
        i=0
        t=0
        let view1=self.view.viewWithTag(301)!
        let view2=self.view.viewWithTag(302)!
        let view3=self.view.viewWithTag(303)!
        let view4=self.view.viewWithTag(304)!
        let view5=self.view.viewWithTag(305)!
        let view6=self.view.viewWithTag(306)!
        view1.frame=CGRect(x: SCREEN_SIZE.width, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
        //set view1.frame
        view2.frame=CGRect(x: SCREEN_SIZE.width, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
        
        view3.frame=CGRect(x: SCREEN_SIZE.width+200, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
        view4.frame=CGRect(x: SCREEN_SIZE.width+200, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
        view5.frame=CGRect(x: SCREEN_SIZE.width+400, y: -SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
        view6.frame=CGRect(x: SCREEN_SIZE.width+400, y: SCREEN_SIZE.height, width: 54, height: SCREEN_SIZE.height)
        bird?.frame=CGRect(x: 50, y: 200, width: 35, height: 35)
        timer!.fireDate=Date.distantPast as Date
        timer2!.fireDate=Date.distantPast as Date
        timer3!.fireDate=Date.distantPast as Date
        bird?.startAnimating()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



