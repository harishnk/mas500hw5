#include "testApp.h"

#define NUM_POINTS 50
#define BOUNCE_FACTOR 0.8
#define ACCELEROMETER_FORCE 0.2
#define RADIUS 50

class BouncingBalls {
public:
    ofPoint pos;
    ofPoint vel;
    ofColor col;
    
    void init() {
        pos.set(ofRandomWidth(), ofRandomHeight(), 0);
        vel.set(ofRandomf(), ofRandomf(), 0);
        
        col.r = ofRandom(0, 255);
        col.g = ofRandom(0, 255);
        col.b = ofRandom(0, 255);
        col.a = ofRandom(0, 255);
    }
    
    void update() {
        vel.x += ACCELEROMETER_FORCE * ofxAccelerometer.getForce().x * ofRandomuf();
        vel.y += -ACCELEROMETER_FORCE * ofxAccelerometer.getForce().y * ofRandomuf();
        
        // add vel to pos
        pos += vel;
        
        // check boundaries
        if(pos.x < RADIUS) {
            pos.x = RADIUS;
            vel.x *= -BOUNCE_FACTOR;
        } else if(pos.x >= ofGetWidth() - RADIUS) {
            pos.x = ofGetWidth() - RADIUS;
            vel.x *= -BOUNCE_FACTOR;
        }
        
        if(pos.y < RADIUS) {
            pos.y = RADIUS;
            vel.y *= -BOUNCE_FACTOR;
        } else if(pos.y >= ofGetHeight() - RADIUS) {
            pos.y = ofGetHeight() - RADIUS;
            vel.y *= -BOUNCE_FACTOR;
        }
    }
    
    void draw() {
        ofSetColor(col.r, col.g, col.b, col.a);
        ofCircle(pos.x, pos.y, 10);
    }
    
    void moveTo(int x, int y) {
        pos.set(x, y, 0);
        vel.set(0, 0, 0);
    }
};

BouncingBalls bouncingBalls[NUM_POINTS];

//--------------------------------------------------------------
void testApp::setup(){	
    ofBackground(255, 255, 255); // set background
    ofSetBackgroundAuto(true); // automatically clear background
    ofSetFrameRate(60); // set desired framerate
    
    ofxAccelerometer.setup();
    
    // touch events listener
    ofxMultiTouch.addListener(this);
    
    // initialize all of the Balls particles
    for(int i=0; i<NUM_POINTS; i++) bouncingBalls[i].init();
}

//--------------------------------------------------------------
void testApp::update(){
    for(int i=0; i<NUM_POINTS; i++) bouncingBalls[i].update();
}

//--------------------------------------------------------------
void testApp::draw(){
	for(int i=0; i<NUM_POINTS; i++) bouncingBalls[i].draw();
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    bouncingBalls[touch.id].moveTo(touch.x, touch.y);
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    bouncingBalls[touch.id].moveTo(touch.x, touch.y);
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){
    ofToggleFullscreen();
}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}
