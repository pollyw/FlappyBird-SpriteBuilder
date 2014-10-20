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
}

-(void)update:(CCTime)delta
{
    // put update code here
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //this will be called everytime the player touches the screen
    //whenever screen touch, method flap will apply to character
    [character flap];

}

@end
