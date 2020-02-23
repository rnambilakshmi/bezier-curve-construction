function [] = bezier_curve_construction()

%intial variables
n = 4; %no. of control points
t = 100; %no. of parametric points

%data input
for i = 1:n
    P(1,i) = input('Enter x coordinate: '); %x coordinate
    P(2,i) = input('Enter y coordinate: '); %y coordinate
end

index = 1; %counter for loop
for parameter = 0:(1/t):1
    sum = zeros(2,1);
    for i = 1:n
        bern = nchoosek(n,i-1)*(parameter^(i-1))*((1-parameter)^(n-i+1)); %bernstein polynomial
        sum = sum + bern*P(:,i);
    end
    bern = parameter^(n);
    sum = sum + bern*P(:,n);
    A(:,index) = sum; %matrix as [x y]
    index = index+1;  %index of pts
end

%plotting the pts
for j = 1:n 
    plot(P(1,j),P(2,j),'o');
    hold on;
end

P1 = P(:,1);

%characteristic polygon
for l = 1:n-1
    P2 = P(:,l+1)';
    lineplot(P1,P2); 
    P1 = P2;
end

%plotting the curve
x = A(1,:);
y = A(2,:);
plot(x,y);
axis equal;

end

%final plotting function
function [] = lineplot(A,B)

x = [A(1) B(1)]; 
y = [A(2) B(2)]; 
plot(x,y,'-'); 

end 

