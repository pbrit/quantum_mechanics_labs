function T = Trans(m,h,U0,a,E)
% calculate Transmission Factor for monochromatic electron


    k = 1/h*sqrt(2*m*E*1.6e-19)*1.e-10;
    q = 1/h*sqrt(2*m*(E - U0)*1.6e-19)*1.e-10;
    det = ((k.^2 + q.^2).*sin(q*a) + 2*i*k.*q.*cos(q*a));

    n1 = find(abs(q(:)*a) == 0);
    n2 = find(abs(q(:)*a) > 0);

   
    tc(n2) = 2*i*k(n2).*q(n2)./det(n2);

    if(length(n1) > 0)
        tc(n1) = 2*i./(k(n1)*a + 2*i);
    end

    T = abs(tc).^2;

    