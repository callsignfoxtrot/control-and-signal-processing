% File: prob2_downsampler_timevarying.m
% Problem 2


clc;
clear all;


x = [1,2,3,4,3,2,1];


% Downsample with phase 0
y0 = downsample(x,2);


% Downsample with phase 1
y1 = downsample(x,2,1);


% Display results
x
y0
y1