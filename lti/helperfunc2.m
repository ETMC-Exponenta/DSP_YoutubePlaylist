function helperfunc2(b,a,fs)

% TRANSFERPLOT Plots a transfer function in the z-plane and shows the
% frequency response around the unit circle.

% Plotting range (polar coordinates):
omega = linspace(-pi,pi);
freq_vector = fs*omega./2*pi;
r = linspace(0,2);
[OM,R] = meshgrid(omega,r);

% Transfer function:
z = R.*exp(1i*OM);
H = (b(1)*z+b(2))./(a(1)*z.^2+a(2)*z+a(3));
M = abs(H);

% Transform polar coordinates to Cartesian:
[X,Y] = pol2cart(OM,R);

z = exp(1i*omega);
FREQZ = (b(1)*z+b(2))./(a(1)*z.^2+a(2)*z+a(3));
F = abs(FREQZ);

% Plot transfer function:
figure
surf(X,Y,M);
shading interp
set(gca, 'CLim', [0 20])
axis([-2 2 -2 2 0 20])
axis square
xlabel('Действительная ось')
ylabel('Мнимая ось')
title('Передаточная функция');
hold on

plot3(cos(omega), sin(omega), F, 'r', 'LineWidth', 3)
hold off

% Plot transfer function:
figure
surf(X,Y,M);
shading interp
set(gca, 'CLim', [0 1.2])
axis([-2 2 -2 2 0 1.2])
axis square
xlabel('Действительная ось')
ylabel('Мнимая ось')
title('Передаточная функция');
hold on


plot3(cos(omega), sin(omega), F, 'r', 'LineWidth', 3)
hold off


% Unwrap the frequency response and plot:
figure
plot(freq_vector, F, 'r', 'LineWidth', 3)
grid on
xlabel('Частота')
ylabel('Отклик') 
title('Развёрнутая АЧХ');

