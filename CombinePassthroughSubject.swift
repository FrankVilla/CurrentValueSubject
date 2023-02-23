//
//  ViewController.swift
//  CombinePassthroughSubject
//
//  Created by KOVIGROUP on 23/02/2023.
//

import UIKit
import Combine

// Create a CurrentValueSubject with an initial value of 0
let subject = CurrentValueSubject<Int, Never>(0)

// Subscribe to the CurrentValueSubject and print each received value
let cancellable = subject.sink { value in
    print("Received value: \(value)")
}

// Publish values to the CurrentValueSubject
subject.send(1)
subject.send(2)
subject.send(3)

// Cancel the subscription
cancellable.cancel()

// Publish another value after cancellation (this won't be printed since the subscription was cancelled)
subject.send(4)


/*
 In the above example, we create a CurrentValueSubject that publishes integers and has an initial value of 0. We then subscribe to the subject using the sink method, which returns an AnyCancellable that we store in the cancellable constant. We print each received value using the closure passed to the sink method. We then publish some values to the subject using the send method. Finally, we cancel the subscription using the cancel method on the AnyCancellable instance. Note that unlike the PassthroughSubject example, the initial value of the CurrentValueSubject is emitted to the subscriber before any other values are emitted.
 
 */
