//
//  Reachability.swift
//  MVVMPractice
//
//  Created by Mohammad  Talha on 23/03/2023.
//

import Reachability
import RxReachability
import RxSwift

class ViewControllerr: UIViewController {

  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()


    Reachability.rx.isConnected
      .subscribe(onNext: {
        print("Is connected")
      })
      .disposed(by: disposeBag)

    Reachability.rx.isDisconnected
      .subscribe(onNext: {
        print("Is disconnected")
      })
      .disposed(by: disposeBag)
  }
}
