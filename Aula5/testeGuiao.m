clear all, close all, clc;

img = imread('the-resort.jpg');
hsv = rgb2hsv(img);
h = hsv(:,:,1);
s = hsv(:,:,2);
imagesc(img)
detector(h,s,[3,10]/100,[25,59]/100);