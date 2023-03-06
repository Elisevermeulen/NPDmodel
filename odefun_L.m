function y = odefun_L(t,P,param)
v = param.v;                        %m*d^-1, transform from m*h^-1
D = param.D;                        %m²*d^-1, transform from cm²*s^-1
dz = param.dz;
z = param.z;                        %m
n = z/dz;

J = zeros(1,n+1);
J(1) = 0;
J(n+1) = 0;

   for i = 2:n  
       Ja(i) = v.*P(i-1);
       Jd(i) = -D.*(P(i)-P(i-1))./dz;
       J(i) = Ja(i) + Jd(i);
   end

   I = LightFunction_L(P,param);
   g = param.gmax*(I./(I+param.H))-param.m;
 
   y = -(J(2:n+1)-J(1:n))/dz+g.*(P');
  
   y = y';    
end
