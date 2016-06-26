//
//  CustomTableViewCell.h
//  pfmApp
//
//  Created by Senthilkumar N on 20/06/16.
//  Copyright © 2016 Senthilkumar N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;

@end
