A = 273; %K
B = -0.001; %K/km
C = 1; %K
L = 1000;%km
k = 2*pi/L;


x = -00:10:1000;
y = -2000:30:1000;

[xgrid,ygrid] = meshgrid(x,y);

T = A + B*ygrid + C*sin(xgrid*k); % hPa
figure();
pcolor(x,y,T)
colormap jet
colorbar


y2 = (273 - A - C*sin(x*k))/B;
y3 = (274 - A - C*sin(x*k))/B;
hold on
h = plot(x,y2,'k',x,y3,'k');
set(h,'linewidth',3)




%%

h1 = [0,1500,3000,5000,7000,9000];
h2 = [1500,3000,5000,7000,9000,11000];

div = [-2,-1.2,-0.3,0.4,1.7,0.5]*1e-5;


dh = h2-h1;
hmean = (h1 + h2)/2;

dw = -div.*dh;
w = cumsum(dw);

figure()
h2  = plot([0,w],[0,h2]);

set(h2,'linewidth',3)
set_plot_font(gca,20)
ylabel('Korkeus (m)')
xlabel('Pystytuuli (ms^{-1})')









%%
A = 1000; %hPa
B = -0.02; %hPa/km
C = 10; %hPa
L = 1000;%km
k = 2*pi/L;


x = -00:10:1000; % km
y = -500:10:500; % km 

[xgrid,ygrid] = meshgrid(x,y);

p = A + B*ygrid + C*sin(xgrid*k); % hPa
figure()
pcolor(x,y,p)
colormap jet
colorbar
dpdx = C*k*cos(xgrid*k); % hPa/km
dpdy = B; % hPa/km

gradient_p = sqrt((dpdx/10).^2 + (dpdy/10).^2); % Pa/m

lat = 45; % degr
T = 283;%K

omega = 7.292e-5;
f = 2*omega*sind(lat); % s-1
rspec = 287.058;% J/(kg·K)




rho = p*100./(rspec*T); % kg/m3

Vg = gradient_p./(rho*f); % Pa/m/(kg/m3/s) = Pa m2 s /kg = N s / kg = kg ms-2 s kg-1 = ms-1

figure();
pcolor(x,y,Vg);
colormap jet
colorbar