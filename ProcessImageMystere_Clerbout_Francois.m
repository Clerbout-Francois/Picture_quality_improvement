clear all;
close all;
clc;

%% Parameters of the different filters:

% Median filters
    MedS1 = 3; 
    % Median filter size (squares), with 2 as MedS1 value, there were still some
    % dots on the image...so we take the higher integer value and so MedS1 = v3
    % The higher the value, the more the image is blurred, the more detail is lost
    
% Contour enhancement by Gaussian difference
    DOGsigma1 = 0.25; DOGsigma2 = 1.5; % Sigma filters for DOG
    alpha1 = 0.3; alpha2 = 3; % addition coefficients
    % It can be seen that the larger alpha is, the more pronounced the contrasts and the more blurred the image will be
    % However, the image will move away from the image to be found until the elements are indistinguishable
   
    
    
    
%% Settings for the histogram display

dyn_out = 255.0; % dynamic of the output image (displayed between 0 and 255)
ifig = 1; % counter for figure numbers
ifigInc = 10; % increment for figure numbers




%% Importing the mystery image 

ImDegradee = imread('Ima_Mystere.tiff');
ImDegradee = double(ImDegradee(:,:,1));
[m,n] = size(ImDegradee);

% Display of the initial image
ifig = F_TD2_1_2_HistoVisu( uint8(ImDegradee), ...
    'Image Ima Mystere originale, à améliorer ', ifig, ifigInc);




%% Equalization

histo = histc(ImDegradee(:),0:(max(ImDegradee(:))+1)); % We work with the initial ImDegradee

% Construction of the cumulative histogram
histo_cum = histo;
for i = 2:numel(histo)
    histo_cum(i) = histo_cum(i-1) + histo(i);
end
FR = uint8(histo_cum / numel(ImDegradee) * dyn_out);
Im_egalisee = FR(uint16(ImDegradee+1));

% Display of the resulting image and its histogram
ifig = F_TD2_1_2_HistoVisu( uint8(Im_egalisee), ...
    'egalisation ', ifig, ifigInc);




%% Application of a median filter

% In order to suppress the observed impulse noise
Im_filtree = medfilt2(Im_egalisee,[MedS1 MedS1]);

% Display of the resulting image and its histogram
ifig = F_TD2_1_2_HistoVisu( uint8(Im_filtree), ...
    'Lissage par filtre médian', ifig, ifigInc);




%% Inverting the colours of the image

% I can see a possible inversion of the colours, I try to and I see that it is more correct
Im_inversion = imcomplement(uint8(Im_filtree)); % this line simply reverses the colours of the image

% Display of the resulting image and its histogram
ifig = F_TD2_1_2_HistoVisu( Im_inversion, 'Image inversée ', ifig, ifigInc);




%% Contour enhancement

% Construction of two Gaussian filters of standard deviation sigma1 and sigma 2 in order to increase the contrast on the image

Im_inversion = double(uint8(Im_inversion)); % the image must be changed to a double type for further operations
G1 = my_gaussian_mask(DOGsigma1); 
G2 = my_gaussian_mask(DOGsigma2);

% Comparison by parameters alpha1, alpha2, DOGsigma1 and DOGsigma2
ImOut = uint8(Im_inversion + alpha1 * (filter2(G1,Im_inversion) - filter2(G2,Im_inversion)));

% Display of the resulting image and its histogram (the better of the two as it is clearer for visual analysis)
ifig = F_TD2_1_2_HistoVisu( uint8(ImOut), ...
    'Rehausse contours filtres gaussiens (alpha = 0.3)', ifig, ifigInc);


ImOut = uint8(Im_inversion + alpha2 * (filter2(G1,Im_inversion) - filter2(G2,Im_inversion)));

% Display of the resulting image and its histogram
ifig = F_TD2_1_2_HistoVisu( uint8(ImOut), ...
    'Rehausse contours filtres gaussiens (alpha = 3)', ifig, ifigInc);
