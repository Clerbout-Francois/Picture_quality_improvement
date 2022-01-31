function G = my_gaussian_mask(sigma)
Ns2 = ceil(3*sigma);
G = zeros(2*Ns2+1,2*Ns2+1);
for lin = -Ns2:Ns2
   for col = -Ns2:Ns2
      G(lin+Ns2+1,col+Ns2+1)= exp(-(lin^2+col^2)/(2*sigma^2));
   end
end
G = G / sum(G(:)); % standardization

end
