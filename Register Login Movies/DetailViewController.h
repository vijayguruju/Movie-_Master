//
//  DetailViewController.h

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    UIScrollView *scroller;
}
@property NSDictionary *entry;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;


@end
