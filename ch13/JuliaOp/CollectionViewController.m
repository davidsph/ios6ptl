//
//  CollectionViewController.m
//  Mandel
//
//  Created by Rob Napier on 8/6/12.
//

#import "CollectionViewController.h"
#import "JuliaCell.h"

@interface CollectionViewController ()
@property (nonatomic, readwrite, strong) NSOperationQueue *queue;
@end

@implementation CollectionViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.queue = [[NSOperationQueue alloc] init];
  self.queue.maxConcurrentOperationCount = 2; // NOTE ME
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  JuliaCell *
  cell = [self.collectionView
          dequeueReusableCellWithReuseIdentifier:@"Julia"
          forIndexPath:indexPath];
  [cell configureWithSeed:indexPath.row queue:self.queue];
  return cell;
}

@end
