# Picture quality improvement

<a name="table_of_contents"/>

## Table of Contents
1. [Objectives](#objectives_)
2. [Introduction and Development](#introduction_)
3. [Conclusion](#conclusion_)
4. [License](#license_) 



<a name="objectives_"/>

## Objectives

To correct the image provided (Ima_Mystere.tiff) in order to obtain an image of the best possible quality for future visual processing.

[Table of Contents](#table_of_contents)
<a name="introduction_"/>

## Introduction and Development

This README presents the strategy decided upon after many tests.  I realised that some strategies led to results very close to the one I will present in this report (each one has advantages and disadvantages and I will explain at the end of the report why I chose this strategy in particular). For the choice of variables, the comments in the code explain why a particular choice was made.

Throughout the development of my strategy, I relied on the study of the different histograms in order to choose what I thought was best for the future, i.e. a visual analysis and therefore the detection of elements in the image and their identification.

* I first display the image (Ima_Mystere.tiff) provided and its histogram :

![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image1.png?raw=true)
![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image2.png?raw=true)

* I then equalise the image, which gives me the following results :

![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image3.png?raw=true)
![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image4.png?raw=true)

* I observe an impulse noise and in order to remove it I apply a median filter on the image previously obtained, which gives :

![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image5.png?raw=true)
![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image6.png?raw=true)

* I invert the colours of the image to give the following image and histogram :

![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image7.png?raw=true)
![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image8.png?raw=true)

* Next, I try to increase the contrast on the image and to do this I will compare two images with different alpha values (see in the code). This gives the following images and histograms :

![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image9.png?raw=true)
![alt text](https://github.com/Clerbout-Francois/Picture_quality_improvement/blob/main/Image10.png?raw=true)

[Table of Contents](#table_of_contents)
<a name="conclusion_"/>

## Conclusion 

When we look at the two final images, we can detect many elements such as cables or even a mouse, glasses... However, we can observe that each image has its advantages and disadvantages.

Indeed, the image on the left is sharper than the image on the right but some elements are not as discernible as on the right (in some areas of the image). That is why I am attaching both pictures to this README.

To conclude, I chose this strategy because I found that the least amount of detail was lost when I started by equalizing the image and then filtering it. I also chose a median filter because it allowed me to keep as much information as possible on the image. Only then did I choose to invert the colours of the image and I finished by increasing the contrast in order to better discern certain elements of the image (I could have stopped at the colour inversion stage, however).

For the continuation of this project and within the framework of a larger project, we could consider training an Artificial Intelligence (U-Net or ResNet for example, which are two different types of neural networks) to recolour this image.

[Table of Contents](#table_of_contents)
<a name="license_"/>

## License

Please do not forget that this project is under [MIT license](https://choosealicense.com/licenses/mit/).



[Table of Contents](#table_of_contents)
