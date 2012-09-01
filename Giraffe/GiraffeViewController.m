//
//  GiraffeViewController.m
//  Giraffe
//
//  Created by Ran Tao on 8.31.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import "GiraffeViewController.h"
#import "GiraffePaperView.h"

@interface GiraffeViewController ()
@property (strong) UIPanGestureRecognizer* panGestureRecognizer;

@end

@implementation GiraffeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.panGestureRecognizer = [UIPanGestureRecognizer new];
    [self.panGestureRecognizer addTarget:self action:@selector(pan)];
    [self.view addGestureRecognizer:self.panGestureRecognizer];
}


-(void) viewWillAppear:(BOOL)animated {
    
    //  When the view first appears center the origin of the graph xy axis
    CGRect currentBounds = self.view.bounds;
    
    CGRect newBounds = CGRectMake(-currentBounds.size.width/2.0,
                                  -currentBounds.size.height/2.0,
                                  currentBounds.size.width, currentBounds.size.height);
    
    self.view.bounds = newBounds;

}

-(void) pan{
    CGPoint translation = [self.panGestureRecognizer translationInView:self.view];
    //  Reset the PanGestureRecognizer translate property so we can have smooth constant increments
    [self.panGestureRecognizer setTranslation:CGPointZero inView:self.view];
  
    //GiraffePaperView *view = (GiraffePaperView*) self.view;
    //view.giraffeOrigin = CGPointMake(view.giraffeOrigin.x+translation.x, view.giraffeOrigin.y+translation.y);

    CGRect currentBounds = self.view.bounds;
    
    CGRect newBounds = CGRectMake(currentBounds.origin.x - translation.x,
                                  currentBounds.origin.y - translation.y,
                                  currentBounds.size.width, currentBounds.size.height);
    
    self.view.bounds = newBounds;
    
    [self.view setNeedsDisplay];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
