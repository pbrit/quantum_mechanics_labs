function Psi = PsiFun(x,x0,k0,h,m,d0,x1,x2,q0,Lx,t)
% calculate Psi-function of wave pacet
    
    kBegin = k0 - 3.2/d0;
    kEnd = k0 + 3.2/d0;
    dk = 2*pi/Lx/(7.0);
    k = kBegin:dk:kEnd;

    [X,K]=meshgrid(x,k);
    
    
    f = CkFun(d0,k0,x0,K).*PsikFun(K,X,q0,x1,x2).*TFun(h,m,K,t);
    Psi = trapz(k,f);
    
function Ck = CkFun(d0,k0,x0,k)
    Ck = sqrt(d0/pi^0.5)*exp(-((k-k0)*d0).^2/2 - i*k*x0);

    


function T = TFun(h,m,k,t) 
    T = exp(- i*h/2/m*k.^2*1.e+20*t*1.e-15);
    
