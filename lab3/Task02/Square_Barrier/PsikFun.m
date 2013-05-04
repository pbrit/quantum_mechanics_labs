function Psik = PsikFun(k,x,q0,x1,x2)
%  calculate eigenfunction of Hamilton operator  
 
    q = sqrt(k.^2 - q0^2);
  
    d = x2 - x1;
    det = ((k.^2 + q.^2).*sin(q*d) + 2*i*k.*q.*cos(q*d));

    n1 = find(abs(q(:,1)*d) == 0);
    n2 = find(abs(q(:,1)*d) > 0);

   
    rc(n2,:) = q0^2*sin(q(n2,:)*d)./det(n2,:).*exp(2*i*k(n2,:)*x1);
    tc(n2,:) = 2*i*k(n2,:).*q(n2,:)./det(n2,:).*exp(-i*k(n2,:)*d);
 
    if(length(n1) > 0)
    rc(n1,:) = k(n1,:)*d./(k(n1,:)*d + 2*i).*exp(2*i*k(n1,:)*x1);
    tc(n1,:) = 2*i./(k(n1,:)*d + 2*i).*exp(-i*k(n1,:)*d);
    end
    
    m1 = find( x(1,:) < x1);
    Psik(:,m1) = exp(i*k(:,m1).*x(:,m1))...
        + rc(:,m1).*exp(-i*k(:,m1).*x(:,m1));
    
    m3 = find( x(1,:) > x2);
     Psik(:,m3) = tc(:,m3).*exp(i*k(:,m3).*x(:,m3));

    
    
    m2 = find( x(1,:) >= x1 & x(1,:) <= x2);

    Psik(n2,m2) = i*k(n2,m2).*exp(i*k(n2,m2)*x1).*(...
        (k(n2,m2) + q(n2,m2)).*exp(i*q(n2,m2).*(x(n2,m2)-x1-d))...
        -(k(n2,m2) - q(n2,m2)).*exp(-i*q(n2,m2).*(x(n2,m2)-x1-d))...
        )./det(n2,m2);

    if(length(n1) > 0)

    Psik(n1,m2) = (-2*k(n1,m2).*(x(n1,m2)-x1-d) + 2*i)...
        ./(k(n1,m2)*d + 2*i).*exp(i*k(n1,m2)*x1);
    end


    Psik = 1/sqrt(2*pi)*Psik;
    
    