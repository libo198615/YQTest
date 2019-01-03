//
//  MenuVC.m
//  YQTest
//
//  Created by boli on 2019/1/2.
//  Copyright © 2019 boli. All rights reserved.
//

#import "LBMenuVC.h"
#import "LBMenuCell.h"
#import "LBMenuView.h"

@interface LBMenuVC ()   <UICollectionViewDelegate,
                        UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout,
                        LBMenuViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) LBMenuView *menuView;
@property (nonatomic, assign) NSInteger currentShowCellRow;

@end

@implementation LBMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)setTitles:(NSArray *)titles viewControllers:(NSArray *)viewControllers {
    _titles = titles;
    _viewControllers = viewControllers;
    for (UIViewController *vc in _viewControllers) {
        [self addChildViewController:vc];
    }
    
    float height = self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    _menuView = [[LBMenuView alloc] initWithFrame:CGRectMake(0, height, self.view.bounds.size.width, 80)];
    [self.view addSubview:_menuView];
    [_menuView setTitles:_titles];
    _menuView.backgroundColor = [UIColor redColor];
    _menuView.delegate = self;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, height+_menuView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-_menuView.frame.size.height) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[LBMenuCell class] forCellWithReuseIdentifier:@"LBMenuCell"];
    layout.itemSize = _collectionView.frame.size;
    _collectionView.pagingEnabled = YES;
    
    
//    _collectionView.backgroundColor = [UIColor redColor];
    [_collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LBMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LBMenuCell" forIndexPath:indexPath];
    
    UIViewController *vc = _viewControllers[indexPath.row];
    for (UIView *aview in cell.bgView.subviews) {
        [aview removeFromSuperview];
    }
    [cell.contentView addSubview:vc.view];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    _currentShowCellRow = indexPath.row;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_currentShowCellRow == -1) {
        return;
    }
    if (indexPath.row == _currentShowCellRow+1) {
        [_menuView setSelectedTitleAtIndex:_currentShowCellRow];
    } else if (indexPath.row == _currentShowCellRow-1) {
        [_menuView setSelectedTitleAtIndex:_currentShowCellRow];
    }
}


#pragma mark - UICollectionViewDelegate -
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

//#pragma mark - UICollectionViewDelegateFlowLayout -
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(collectionView.frame.size.width/2 - 0.5, collectionView.frame.size.height/2 - 0.5);
//}
//
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}



#pragma mark - LBMenuViewDelegate -
- (void)selectTitleAtIndex:(NSInteger)index {
    _currentShowCellRow = -1;
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

@end
