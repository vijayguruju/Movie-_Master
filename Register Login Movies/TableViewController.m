//
//  TableViewController.m


#import "TableViewController.h"
#import "DetailViewController.h"



#define kMoviesURL  @"https://itunes.apple.com/us/rss/topmovies/limit=20/json"

@interface TableViewController ()

@end

@implementation TableViewController




- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.entries = @[];
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadFromURL:kMoviesURL];
}
- (void)loadFromURL:(NSString *)urlString;
    {
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        
        NSURLSessionDataTask *dataTask =
        [session dataTaskWithURL:url
               completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
         {
             NSError *jsonError = nil;
             id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
             
             NSDictionary *feed = [json objectForKey:@"feed"];
             self.entries = [feed objectForKey:@"entry"];
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.tableView reloadData];
             });
         }];
        
        [dataTask resume];
    }
    


    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
    {
        return 1;
    }
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        return [self.entries count];
    }
    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
        
        NSDictionary *entry = [self.entries objectAtIndex:indexPath.row];
        cell.textLabel.text = [entry valueForKeyPath:@"im:name.label"];
        
        return cell;
    }
    
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        DetailViewController *vc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        vc.entry = [self.entries objectAtIndex:indexPath.row];
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
}
- (IBAction)logout:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc=[story instantiateViewControllerWithIdentifier:@"ui"];
    [self presentViewController:vc animated:true completion:nil];
    //self.navigationController.navigationBarHidden=YES;
    
}


@end
