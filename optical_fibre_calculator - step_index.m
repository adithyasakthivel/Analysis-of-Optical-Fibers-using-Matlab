%Calculator for Multi-mode Step Index Optical Fibres
%Adithya Vikram Sakthivel

n1=input('Enter the permitivity of the core:   ');
n2=input('Enter the permitivity of the cladding:   ');
lamda=input('Enter the wavelength of the light source being used:   ');
d=input('Enter the diameter of the core:   ');
n=n1/n2;
delta=0.5-0.5*(n^(-2)); %To calculate the core-cladding index difference
thetac=acosd(1/n); %To calculate the critical angle
na=n1*(sqrt(2*delta)); %To calculate the numerical aoerture (NA)
modes=2*(pi*na*(d/2)/lamda)^2; %To calculate the number of modes 
normfreq=2*pi*n*d/(2*lamda); %To calculate the normalized frequency of the optical fibre
k=2*pi*n1/lamda; %To calculate the number of modes that the optical fibre can operate in

for theta=1:ceil(thetac)
    sn(theta)=2*atand(sqrt(((n*cosd(theta))^2))/(n*sind(theta))); %To calculate the Phase Shift perpendicular to the plane of incidence for various angles
    sp(theta)=2*atand(n*sqrt(((n*cosd(theta))^2))/(sind(theta))); %To calculate the Phase Shift parallel to the plane of incidence for various angles
    pc(theta)=n1*k*2*d/(sind(theta)); %To calculate the phase shift before reflection
end;

figure
hold on;
title('Phase shift with respect to angle of incidence (after reflection)'); 
a1=plot(sp,'k'); 
M1='Phase Shift parallel to the plane of incidence';
a2=plot(sn,'r'); 
M2='Phase Shift perpendicular to the plane of incidence';
legend([a1;a2],M1,M2);
xlabel('Input angle in degrees');
ylabel('Degree of phase shift');
hold off;

figure
title('Phase shift with respect to angle of incidence (without reflection)');
plot(pc,'k');
xlabel('Input angle in degrees');
ylabel('Degree of phase shift');

fprintf('\n The core-cladding index difference is %d \n', delta);
fprintf(' The critical angle is %d \n', thetac);
fprintf(' The numerical aperture is %d \n', na);
fprintf(' There are %d modes in the fiber \n', modes);