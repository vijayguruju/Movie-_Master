//
//  ViewController.h


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *username;

@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;

@end

