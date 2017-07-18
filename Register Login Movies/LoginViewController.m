//
//  ViewController.m


#import "LoginViewController.h"
#import "AppDelegate.h"
#import "RegisterViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _username.text=@"";
    _password.text=@"";
    
    [ [self username]setDelegate:self];
    [[self password]setDelegate:self];
   // self.navigationController.navigationBarHidden=YES;

 
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    
    if([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        
        
        
                        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Oops" message:@"You missed something, please check your details and try again." preferredStyle:UIAlertControllerStyleAlert];
        
                    UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:alert];
                    [self presentViewController:alertController animated:YES completion:nil];
                
    }
    
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=[appdelegate managedObjectContext];
    context =[appdelegate managedObjectContext];

    NSEntityDescription *entitydese=[NSEntityDescription entityForName:@"Detail" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entitydese];
    
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"(username=%@) && (password=%@)",_username.text,_password.text];
    [request setPredicate:predicate];
    NSManagedObject *matches=nil;
    
    NSError *error;
    NSArray *matchingdata=[context executeFetchRequest:request error:&error];
    if([matchingdata count]==0)
    {
        
                        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"User not found" message:@"Please Register First" preferredStyle:UIAlertControllerStyleAlert];
        
                    UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:alert];
                    [self presentViewController:alertController animated:YES completion:nil];
                
    }
    else {
        matches =matchingdata[0];
        _username.text=[matches valueForKey:@"username"];
        _password.text=[matches valueForKey:@"password"];
        NSLog(@"%@",matchingdata);
        
        UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc=[story instantiateViewControllerWithIdentifier:@"first"];
        [self presentViewController:vc animated:true completion:nil];
        

    }
    
    }



    -(BOOL)textFieldShouldReturn:(UITextField *)textField
    {
        return [textField resignFirstResponder];
    }
  


@end
