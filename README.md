
# FaceAnwer

Welcome to the setup guide for the FaceAnswer which is a quiz app implemented using Google MLKit. Follow these steps to seamlessly integrate the feature into your Swift project, designed with SwiftUIKit and Storyboard for the user interface.


## Integrating GoogleMLKit

To integrate Google ML Kit's Face Detection feature into the project, please follow these steps:

Step 1: Navigating to the Project Directory
Use the cd command to navigate to the root directory of your project:

```bash
  cd /path/to/the/project
```
Step 2: Installing CocoaPods Dependencies

If you don't have a Podfile, run 
```bash
  pod init
```
to create a Podfile for your project.

Step 3: Adding Google ML Kit Face Detection Dependency
Open the Podfile in a text editor. An add the line below to the Podfile
```bash
  pod 'GoogleMLKit/FaceDetection', '3.2.0'
```
Step 4: Installing the Dependency
Run the below to install the Google ML Kit Face Detection dependency.
 ```bash
  pod install
```
Important: From now on, always use the .xcworkspace file to open your project.



    
## Demo

Please refer to the link below for the demo video.
https://drive.google.com/file/d/1jooNXiZ7gzKPSiBmN1ugoWi8GHNcsOB-/view?usp=drivesdk


## Appendix

For further information about MLKit refer to: 
https://developers.google.com/ml-kit/vision/face-detection
