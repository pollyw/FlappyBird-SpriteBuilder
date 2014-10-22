#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    //load new character from ccb file made by spritebuilder
    character = (Character*)[CCBReader load:@"Character"];
    
    //add character as a child of physicsnode so physics will be applied ot it
    [physicsNode addChild:character];
    
    //add new obstacles at regular intervals
    timeSinceObstacle = 0.0f;
    
    //add obstacles
    [self addObstacle];
}

//appears when you use timeSinceObstacle method
-(void)update:(CCTime)delta
{
    // put update code here
    
    //increment the time since the last obstacle was added
    timeSinceObstacle += delta; //delta is approximately 1/60th of a second
    
    //check is 2 secs have passed
    if (timeSinceObstacle > 2.0f) {
        
        //add new obstacle
        [self addObstacle];
        
        //then reset the timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //this will be called everytime the player touches the screen
    //whenever screen touch, method flap will apply to character to make it fly up
    [character flap];

}

@end
