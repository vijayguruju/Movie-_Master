//
//  RegisterViewController.m

#import "RegisterViewController.h"
#import "AppDelegate.h"

@interface RegisterViewController ()
{
    NSManagedObjectContext *context;
}

@end

@implementation RegisterViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    _status.text = @"";
    _username1.text=@"";
    _password1.text=@"";
    _confirmpassword.text=@"";

    [ [self username1]setDelegate:self];
    [[self password1]setDelegate:self];
    [[self confirmpassword]setDelegate:self];
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    context =[appdelegate managedObjectContext];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submit:(id)sender {
    
    if([_username1.text isEqualToString:@""]||[_password1.text isEqualToString:@""]||[_confirmpassword.text isEqualToString:@""])
    
    {
        
                UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:@"Please fill in all fields" preferredStyle:UIAlertControllerStyleAlert];
        
                UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:alert];
                [self presentViewController:alertController animated:YES completion:nil];
    }
            
    
 else if ([_password1.text isEqualToString:_confirmpassword.text])
     
 {
        NSLog(@"passwords match");
  
 }
    
    
    
    else{
        
        NSLog(@"password don't match");
        
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:@"Your entered passwords don't match" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alert];
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        }
    
    NSEntityDescription *entitydese =[NSEntityDescription entityForName:@"Detail" inManagedObjectContext:context];
    NSManagedObject *newuser =[[NSManagedObject alloc]initWithEntity:entitydese insertIntoManagedObjectContext:context];
    [newuser setValue:self.username1.text forKey:@"username"];
    [newuser setValue:self.password1.text forKey:@"password"];
    [newuser setValue:self.confirmpassword.text forKey:@"confirmpassword"];
    
    NSError *error;
    [context save:&error];
    //self.status.text=@"Registered";
    
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Success" message:@"You have registered successfully" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:alert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
        


}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
@end
