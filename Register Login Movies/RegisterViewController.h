//
//  RegisterViewController.h

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *username1;
@property (strong, nonatomic) IBOutlet UITextField *password1;
@property (strong, nonatomic) IBOutlet UITextField *confirmpassword;
@property (weak, nonatomic) IBOutlet UILabel *status;
- (IBAction)submit:(id)sender;

@end
