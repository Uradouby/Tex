//
//  gameover.swift
//  Tex
//
//  Created by njuios on 2021/1/16.
//
import UIKit

typealias endBtnBlock = ()->()
typealias resetBtnBlock = ()->()
class GameOverView: UIView {
    
    var bgView:UIView!
    var pinkView:UIView!
    var blueView:UIView!
    var tip:UILabel!
    var endBtn:UIButton!
    var resetBtn:UIButton!
    
    var endBlock:endBtnBlock?
    var resetBlock:resetBtnBlock?
    
    override init(frame: CGRect) {
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
        self.tip.font = UIFont.systemFont(ofSize: 30)
        self.tip.textAlignment = .center
        self.tip.text = "Game Over"
        self.blueView.addSubview(self.tip)
        
        self.endBtn = UIButton()
        self.endBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.endBtn.layer.cornerRadius = 3
        self.endBtn.clipsToBounds = true
        self.endBtn.addTarget(self, action: #selector(noBtnClick), for: .touchUpInside)
        self.endBtn.setTitle("End", for: .normal)
        self.pinkView.addSubview(self.endBtn)
        
        self.resetBtn = UIButton()
        self.resetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.resetBtn.layer.cornerRadius = 3
        self.resetBtn.clipsToBounds = true
        self.resetBtn.addTarget(self, action: #selector(okBtnClick), for: .touchUpInside)
        self.resetBtn.setTitle("Again", for: .normal)
        self.pinkView.addSubview(self.resetBtn)
        
    }
    
    @objc func noBtnClick() -> Void {
        if((self.endBlock) != nil){
            self.endBlock!()
        }
    }
    @objc func okBtnClick() -> Void {
        if((self.resetBlock) != nil){
            self.resetBlock!()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.bgView.frame = CGRect.init(x: 0, y: 0, width: 250, height: 140)
        self.bgView.center = self.center
        
        
        self.tip.frame = self.blueView.bounds
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
