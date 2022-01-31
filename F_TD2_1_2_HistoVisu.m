function ifigOut = F_TD2_1_2_HistoVisu( img, TitleString, ifigIn, ifigIncr)

figure(ifigIn); image(img); colormap(gray(256));
title(TitleString);

% Input image dynamics
dyn_in = max(max(img(:)),255);
% Calculation and visualisation of the histogram
histo = histc(img(:),0:dyn_in+1);
figure(ifigIn+1); plot(histo);
title(strcat('Histogramme - ',TitleString));

ifigOut = ifigIn + ifigIncr;

end
