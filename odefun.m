function dydt = odefun(t,x,par)
u = par(1);
D = par(2);
deltaz = par(3);
n = par(4);
J = zeros(1,n+1);
J(1) = 0; %no input from surface
J(n+1) = 0; %closed bottom

for i = 2:n
Ja(i) = u*x(i-1);
Jd(i) = -(D.*x(i)-x(i-1))./deltaz;
J(i) = Ja(i) + Jd(i);
end

%ix = 2:n
%Jadv(ix) = par(1)*x(i-1)

dydt =zeros(1,n)
for i = 1:n
dydt(i) = -(J(i+1)-J(i))./deltaz;
end
dydt = dydt';
end
