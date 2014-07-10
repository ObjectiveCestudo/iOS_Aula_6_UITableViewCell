//
//  RCSViewController.m
//  TableViewController_celulas_dinamica
//
//  Created by Ramon Cruz on 7/9/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "RCSViewController.h"

@interface RCSViewController ()

@end

@implementation RCSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _refresh=[[UIRefreshControl alloc] init];
    [_tableview addSubview:_refresh];
    [_refresh addTarget:self action:@selector(alertNovoObjeto) forControlEvents:UIControlEventValueChanged];
    
    
    _imagens=[[NSMutableArray alloc]init];
    
    [_imagens addObject:[UIImage imageNamed:@"f_1.png"]];
    [_imagens addObject:[UIImage imageNamed:@"f_2.png"]];
    [self setRefresh:_refresh];
    
    //colocando titulo no topo
    self.title=@"Navigation Controller";
    
    
    //Adicionando botao de editar na NavigationController
    self.navigationItem.leftBarButtonItem=self.editButtonItem;
    
    //Preenchendo Array
    self.numbers=[[NSMutableArray alloc]initWithObjects:@"Um",@"Dois",@"Três",@"Quatro",@"Cinco",@"Seis",@"Sete",@"Oito",@"Nove",@"Dez", nil];
    
    
    //Adicionando botao Add
    UIBarButtonItem *addButton =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(alertNovoObjeto)];
    
    self.navigationItem.rightBarButtonItem=addButton;
    
    
    
    
}

//Adiciona itens no array
-(void) alertNovoObjeto
{
    //mostra a mensagem
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Digite um numero" message:@"" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"OK", nil];
    
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alert show];
    [_refresh endRefreshing];
    
    
    
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //botao ok =1 e cancelar =0
    
    if (buttonIndex==1)
    {
        //Pegando o valor do texto
        NSString *texto= [alertView textFieldAtIndex:0].text;
        
        //boas praticas-verificando  se existe um array de numeros ja escritos
        
        if (!self.numbers)
        {
            self.numbers =[[NSMutableArray alloc]init];
            
        }
        
        //Insere o valor do objeto no Array
        [self.numbers insertObject:texto atIndex:0];
        
        //gera um index para por na tableview
        NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:0];
        
        [self.tableview insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}



-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableview setEditing:editing animated:animated];
    
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {
        //Removendo no MutableArray
        [self.numbers removeObjectAtIndex:indexPath.row];
        
        //Removendo do nosso tableview
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numbers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier=@"Cell";
   // UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    RCSCustonCell *custonCell=[[RCSCustonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    
    
  //  if (cell==nil)
        if(custonCell==nil)
    {
       // cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
        
        custonCell=[[RCSCustonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];

        
    }
    
//    cell.textLabel.text=[self.numbers objectAtIndex:indexPath.row];
//   
//    //Adicionado imagem em cada celula
//    [cell.imageView setImage:[_imagens objectAtIndex:(indexPath.item%2)]];
//    
    
    return custonCell;
    //return cell;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
