//
//  PageLoaderViewController.m
//  eBook
//
//  Created by Dan Lynch on 4/25/11.
//  Copyright 2011 Pyramation Media. All rights reserved.
//

#import "PageLoaderViewController.h"
#import "PageLoaderView.h"
#import "PageModel.h"

@implementation PageLoaderViewController

@synthesize page;

- (id)initWithPage:(PageModel*)p NibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        PageLoaderView * pv = [[PageLoaderView alloc] initWithFrame:[[UIScreen mainScreen] bounds] page:p];
        self.page = p;
        [self setView:pv];
        
    }
    return self;
}


- (void)dealloc
{
    [page release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
