//
//  CameraView.swift
//  FaceAnswerBgm
//
//  Created by Begum Sen on 5.08.2023.
//


import UIKit
import AVFoundation
import CoreVideo
import MLKit

class CameraView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var presenter: GamePresenter!
    
    lazy var options : FaceDetectorOptions = {
            let o = FaceDetectorOptions()
            o.performanceMode = .accurate
            o.classificationMode = .all
            o.isTrackingEnabled = false
            
            return o
        }()
        
        
        private lazy var videoDataOutput: AVCaptureVideoDataOutput = {
            let v = AVCaptureVideoDataOutput()
            v.alwaysDiscardsLateVideoFrames = true
            v.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
            v.connection(with: .video)?.isEnabled = true
            return v
        }()
        
        private let videoDataOutputQueue: DispatchQueue = DispatchQueue(label: "VideoDataOutputQueue")
        
        private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
            let l = AVCaptureVideoPreviewLayer(session: session)
            l.videoGravity = .resizeAspect
            return l
        }()
        
        private let captureDevice: AVCaptureDevice? = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        private lazy var session: AVCaptureSession = {
            return AVCaptureSession()
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        public func beginSession() {
            guard let captureDevice = captureDevice else { print("can't capture"); return }
            guard let deviceInput = try? AVCaptureDeviceInput(device: captureDevice) else { return }
            
            if session.canAddInput(deviceInput) {
                session.addInput(deviceInput)
            }

            if session.canAddOutput(videoDataOutput) {
                session.addOutput(videoDataOutput)
            }
            
            layer.masksToBounds = true
            layer.addSublayer(previewLayer)
            previewLayer.frame = bounds
            DispatchQueue.global().async {
                self.session.startRunning()
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            previewLayer.frame = bounds
        }
    }

    extension CameraView: AVCaptureVideoDataOutputSampleBufferDelegate {
        
        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
      
            
            guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
                print("Failed to get image buffer from sample buffer.")
                return
            }
            let visionImage = VisionImage(buffer: sampleBuffer)
            visionImage.orientation = imageOrientation(
              deviceOrientation: UIDevice.current.orientation,
              cameraPosition: .front)

            
            let imageWidth = CGFloat(CVPixelBufferGetWidth(imageBuffer))
            let imageHeight = CGFloat(CVPixelBufferGetHeight(imageBuffer))
            
            DispatchQueue.global().async {
                self.detectFacesOnDevice(in: visionImage, width: imageWidth, height: imageHeight)
            }
        }
        
        func imageOrientation(
          deviceOrientation: UIDeviceOrientation,
          cameraPosition: AVCaptureDevice.Position
        ) -> UIImage.Orientation {
          switch deviceOrientation {
          case .portrait:
            return cameraPosition == .front ? .leftMirrored : .right
          case .landscapeLeft:
            return cameraPosition == .front ? .downMirrored : .up
          case .portraitUpsideDown:
            return cameraPosition == .front ? .rightMirrored : .left
          case .landscapeRight:
            return cameraPosition == .front ? .upMirrored : .down
          case .faceDown, .faceUp, .unknown:
            return .up
          @unknown default:
              fatalError()
          }
        }
        
        
        private func detectFacesOnDevice(in image: VisionImage, width: CGFloat, height: CGFloat) {
            
            let faceDetector = FaceDetector.faceDetector(options: options)
            
            weak var weakSelf = self
            faceDetector.process(image) { faces, error in
              guard let strongSelf = weakSelf else {
                print("Self is nil!")
                return
              }
              guard error == nil, let faces = faces, !faces.isEmpty else {
               
                return
              }

                if let face = faces.first{
                    self.presenter.processFaceTilt(headEulerAngleY: face.headEulerAngleY, headEulerAngleZ: face.headEulerAngleZ)
                }
            }
            
        }


}
