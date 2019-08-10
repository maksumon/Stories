//
//  ViewController.m
//  Stories
//
//  Created by Mohammad Ashraful Kabir on 09/08/2019.
//  Copyright © 2019 Mohammad Ashraful Kabir. All rights reserved.
//

#import "ViewController.h"
#import "UserDetail.h"
#import "UserDetailCell.h"
#import <SDWebImage/SDWebImage.h>
#import "Stories-Swift.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate> {
    NSMutableArray<UserDetail *> *arrayDetails;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchUserData];
}

- (void)fetchUserData {
    NSString *path = [NSBundle.mainBundle pathForResource:@"user-details" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    @try {
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSArray *userDetails = [json objectForKey:@"userDetails"];
        
        arrayDetails = [NSMutableArray new];
        
        for (int i = 0; i < userDetails.count; i++) {
            UserDetail *userDetail = [[UserDetail alloc] initWithDictionary:[userDetails objectAtIndex:i] error:nil];
            [arrayDetails addObject:userDetail];
        }
        
        NSLog(@"User Details: %@", arrayDetails);
        
        [self.usersCollectionView reloadData];
    } @catch (NSException *exception) {
        NSLog(@"Failed to load: %@", exception.description);
    }
}

#pragma mark UICollectionViewDataSourcec
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arrayDetails.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UserDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UserDetail *userDetail = [arrayDetails objectAtIndex:indexPath.item];
    
    cell.lblUserName.text = userDetail.name;
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:userDetail.imageUrl]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ContentViewController *contentVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentView"];
    contentVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    contentVC.pages = arrayDetails;
    contentVC.currentIndex = indexPath.item;
    
    [self presentViewController:contentVC animated:YES completion:nil];
}

@end
