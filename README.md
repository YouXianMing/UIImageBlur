# UIImageBlur

> Used to blur UIImage

* Normal Image

![normal图片](/normal.png) 

* Half-Blured Image

![half-blur图片](/half-blur.png) 

```
    // get Image
    UIImage *image = [UIImage imageNamed:@"people"];
    
    // init UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center       = self.view.center;
    [self.view addSubview:imageView];
    
    // blur Image at specified frame
    imageView.image        = [image blurImageAtFrame:CGRectMake(0, 0, image.size.width, image.size.height / 2.f)];

```

* Blured Image

![blur图片](/blur.png) 

```
    // get Image
    UIImage *image = [UIImage imageNamed:@"people"];
    
    // init UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center       = self.view.center;
    [self.view addSubview:imageView];
    
    // blur Image
    imageView.image = [image blurImage];
    
```
