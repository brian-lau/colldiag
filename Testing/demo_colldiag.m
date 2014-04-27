%% Example from Belsley et al. (1980) pg 163-167

% Data frame with 28 observations on the following 5 variables.
% year 1947 to 1974 
% c      - total consumption 1958 dollars
% r      - the interest rate (Moody?s Aaa)
% dpi    - disposable income, 1958 dollars
% d\_dpi - annual change in disposable income

% Source: pp 149-154 of Belsley (1991), Conditioning Diagnostics

% Load and format the data as per Belsley et al.
x = load('consumption.txt');
x(:,1) = [];
x = [x(:,1) x(:,3) x(:,2) x(:,4)];
x = [x(1:end-1,1) x(2:end,2) x(2:end,3) x(2:end,4)];

% Variable names
labels = {'C' 'DPI' 'R' 'dDPI'};

% Calling colldiag without outputs prints a table to stdout
colldiag(x,labels);

% Most of the VDP values are not shown by default (those <0.5)
% To see them, set fuzz to a smaller value
colldiag(x,labels,0);

% You can also add an interecept term, which reproduces Belsley et al.'s
% example
colldiag(x,labels,0.5,true);

% Calling with an output yields a struct array
info = colldiag(x,labels,0.5,true)

% That can be passed along for visualization
colldiag_tableplot(info);

% Flip the ordering so problems are at the top of the plot
colldiag_tableplot(info,1);

% Also sort the VDPs in decreasing order
colldiag_tableplot(info,1,[],1);

% Only keep a subset of the CI and VDPs
colldiag_tableplot(info,1,3,1,3);

%% Example from https://onlinecourses.science.psu.edu/stat501/node/83

x = load('bloodpress.txt');
x(:,1) = [];

labels = {'Age' 'Weight' 'BSA' 'Dur' 'Pulse' 'Stress'};

colldiag(x,labels);

