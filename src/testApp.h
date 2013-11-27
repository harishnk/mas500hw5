#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxMultiTouch.h"
#include "ofxAccelerometer.h"

class testApp : public ofSimpleApp, public ofxMultiTouchListener{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
    
        void keyPressed(int key) {}
        void keyReleased(int key) {}
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);

};


