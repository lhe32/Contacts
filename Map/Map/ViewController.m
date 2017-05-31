//
//  ViewController.m
//  Map
//
//  Created by Detective Lawliet on 5/22/17.
//  Copyright © 2017 Detective Lawliet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

MKMapView *mapView;
CLLocationManager *locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mapView = [[MKMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    
    [mapView addAnnotation:[mapView userLocation]];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(createPin:)];
    [mapView addGestureRecognizer:longPress];
    
    CLLocationCoordinate2D initLocation = CLLocationCoordinate2DMake(39.5442, -119.8164);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(initLocation, 800, 800);
    [mapView setRegion:[mapView regionThatFits:region] animated:true];
    
    [self.view addSubview:mapView];
    
    MKUserTrackingBarButtonItem *button = [[MKUserTrackingBarButtonItem alloc] initWithMapView:mapView];
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 20, self.view.frame.size.width, 50);
    [toolbar setItems:[NSArray arrayWithObject:button] animated:YES];
    [toolbar setBackgroundImage:[UIImage new] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    [toolbar setBackgroundColor:[UIColor clearColor]];
    toolbar.clipsToBounds = YES;
    
    [self.view addSubview:toolbar];
}

- (void)createPin:(UILongPressGestureRecognizer *)gesture {
    if(gesture.state != UIGestureRecognizerStateBegan) {
        return;
    }
    [mapView removeAnnotations:mapView.annotations];
    CGPoint touchPoint = [gesture locationInView:mapView];
    CLLocationCoordinate2D touchCoordinate = [mapView convertPoint:touchPoint toCoordinateFromView:mapView];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = touchCoordinate;
    NSString *longitude = [NSString stringWithFormat:@"longitude: %f", [point coordinate].longitude];
    NSString *latitude = [NSString stringWithFormat:@"latitude: %f", [point coordinate].latitude];
    point.title = [NSString stringWithFormat:@"%@, %@", longitude, latitude];
    [mapView addAnnotation:point];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
