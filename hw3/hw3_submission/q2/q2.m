subtract = true;    %edit as necessary
f=figure(1);
mu = [1 1];         %edit as necessary
sigma = [1 0; 0 2]; %edit as necessary
[x1, x2] = meshgrid(-6:0.1:6, -6:0.1:6); %edit bounds as necessary
[r c] = size(x1);
data = [x1(:) x2(:)];
p = mvnpdf(data, mu, sigma);
if subtract
    mu2 = [-1 -1];              %edit as necessary
    sigma2 = [2 1 ; 1 2];       %edit as necessary
    p2 = mvnpdf(data, mu2, sigma2);
    p = p - p2;
end
p = reshape(p, r, c);
contour(x1, x2, p, 15);
colorbar;
str = input('Enter a name for this image: ', 's');
if isempty(str)
    str = strcat('tmp', datestr(now));
end
print('-dpng', str);