//
//  CSButton.swift
//  Chapter03-CSButton
//
//  Created by prologue on 2017. 6. 8..
//  Copyright © 2017년 rubypaper. All rights reserved.
//

import UIKit

// 버튼 타입을 결정하는 열거형
public enum CSButtonType {
  case rect
  case circle
}

class CSButton: UIButton {
  
  var style: CSButtonType = .rect {
    didSet {
      switch style {
      case .rect :
        self.backgroundColor = UIColor.black // 배경을 검은색으로
        self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
        self.layer.borderWidth = 2 // 테두리 두께는 2
        self.layer.cornerRadius = 0 // 모서리는 전혀 둥글지 않게
        self.setTitleColor(UIColor.white, for: .normal) // 글씨는 흰색으로
        self.setTitle("Rect Button", for: .normal) // 기본 문구 설정
      case .circle :
        self.backgroundColor = UIColor.red // 배경을 빨간색으로
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 50 // 50만큼 둥글게 처리
        self.setTitle("Circle Button", for: .normal)
      }
    }
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    
    // 여기에 설정하는 속성들은 스토리보드를 통해 버튼을 정의할 때 기본 속성으로 적용됩니다.
    self.backgroundColor = UIColor.green // 배경을 녹색으로
    self.layer.borderWidth = 2 // 테두리는 조금 두껍게
    self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
    self.setTitle("버튼", for: .normal) // 기본 문구 설정
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = UIColor.gray // 배경을 회색으로
    self.layer.borderColor = UIColor.black.cgColor // 테두리는 검은색으로
    self.layer.borderWidth = 2 // 테두리는 조금 두껍게
    self.setTitle("코드로 생성된 버튼", for: .normal) // 기본 문구 설정
  }
  
  init() {
    super.init(frame: CGRect.zero)
  }
  
  convenience init(type: CSButtonType) {
    self.init()
    
    switch type {
    case .rect :
      self.backgroundColor = UIColor.black // 배경을 검은색으로
      self.layer.borderColor = UIColor.black.cgColor
      self.layer.borderWidth = 2
      self.layer.cornerRadius = 0 // 모서리는 전혀 둥글지 않게
      self.setTitleColor(UIColor.white, for: .normal) // 글씨는 흰색으로
      self.setTitle("Rect Button", for: .normal) // 기본 문구 설정
    case .circle :
      self.backgroundColor = UIColor.red // 배경을 빨간색으로
      self.layer.borderColor = UIColor.blue.cgColor
      self.layer.borderWidth = 2
      self.layer.cornerRadius = 50 // 50만큼 둥글게 처리
      self.setTitle("Circle Button", for: .normal)
    }
    
    self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
  }
  
  // 버튼이 클릭된 횟수를 카운트하여 타이틀에 표시해 주는 함수
  @objc func counting(_ sender: UIButton) {
    sender.tag = sender.tag + 1
    sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
  }
}
