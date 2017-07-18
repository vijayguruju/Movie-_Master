//
//  DetailViewController.m


#import "DetailViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 568)];
    
    self.titleLabel.text = [self.entry valueForKeyPath:@"im:name.label"];
    self.nameLabel.text = [self.entry valueForKeyPath:@"im:artist.label"];
    self.genreLabel.text = [self.entry valueForKeyPath:@"category.attributes.label"];
    self.summaryLabel.text = [self.entry valueForKeyPath:@"summary.label"];
    
 NSString *urlString = [[[self.entry valueForKeyPath:@"im:image"] lastObject] valueForKey:@"label"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    
    //
    NSURLSessionDataTask *dataTask =
    [session dataTaskWithURL:url
     
           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             
             self.imageView.image = [UIImage imageWithData:data];
         });
     }];
    
    [dataTask resume];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//UIImage *carphoto=[UIImage imageNamed:[img objectAtIndex:[indexPath row]]];
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
