//
//  ViewController.m
//  pfmApp
//
//  Created by Senthilkumar N on 17/06/16.
//  Copyright © 2016 Senthilkumar N. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "JSONReader.h"
#import "BaseClass.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVPlayer.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *modelObjects;
@property (nonnull, strong) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    _modelObjects = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    [self initServiceCall];
}
-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void) initServiceCall {
    JSONReader *jsonReader = [[JSONReader alloc] init];
    id json = [jsonReader JSONParseFromBundle];
    if([json isKindOfClass:[NSArray class]]) {
        NSArray *jsonArray = (NSArray*) json;
        for(NSDictionary *dict in jsonArray) {
            BaseClass *model = [BaseClass modelObjectWithDictionary:dict];
            if(model) {
                [_modelObjects addObject:model];
            }
        }
        [_tblView reloadData];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(!cell) {
        cell = [[CustomTableViewCell alloc] init];
    }
    BaseClass *model = [_modelObjects objectAtIndex:indexPath.row];
    cell.lblTitle.text = model.title;
    cell.lblDesc.text = model.internalBaseClassDescription;
    
    NSString *strURL = [NSString stringWithFormat:@"http://periyar.fm/%@", model.pic];
    NSURL *urlImg = [NSURL URLWithString:strURL];
    [cell.imageView setShowActivityIndicatorView:YES];
    [cell.imageView setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [cell.imageView sd_setImageWithURL:urlImg
                      placeholderImage:[UIImage imageNamed:@"placeholder"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
    
//    [cell.imageView sd_setImageWithURL:urlImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        cell.imageView.image = image;
//
//    }];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseClass *model = [_modelObjects objectAtIndex:indexPath.row];
    NSString *strURL = [NSString stringWithFormat:@"http://periyar.fm/%@", model.soundFile];
    NSData *_objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc] initWithData:_objectData error:&error];
    _audioPlayer.numberOfLoops = 0;
    _audioPlayer.volume = 1.0f;
    [_audioPlayer prepareToPlay];
    
    if (_audioPlayer == nil) {
        NSLog(@"%@", [error description]);
    }
    else {
        [_audioPlayer play];
    }
//    AVPlayer *objAVPlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:strURL]];
//    [objAVPlayer play];
}



@end
