X = load('Xtrain.txt');
Y = load('Ytrain.txt');

max_d = 10;
n = size(X);
n = n(1);
Least_squared_losses = zeros(max_d, 1);

for d = 1 : max_d
    A = zeros(n, d);

    for i = 1 : d
        A(:, i) = X.^i;
    end

    w = A \ Y;

    L = 0;
    for i = 1 : 100
        local_sum = 0;
        for k = 1 : d
            local_sum = local_sum + (w(k) * (X(1)^k));
        end
        L = L + (Y(i) - local_sum)^2;
    end
    
    Least_squares_losses(d) = L;
    
    if d == 4
        y4 = zeros(n, 1);
        for j = 1 : n
            sum = 0;
            for k = 1 : d
                sum = sum + (w(k) * X(j)^k);
            end
            y4(j, 1) = sum;
        end
    end
    
    if d == 3
        y3 = zeros(n, 1);
        for j = 1 : n
            sum = 0;
            for k = 1 : d
                sum = sum + (w(k) * X(j)^k);
            end
            y3(j, 1) = sum;
        end
    end
    
    if d == 2
        y2 = zeros(n, 1);
        for j = 1 : n
            sum = 0;
            for k = 1 : d
                sum = sum + (w(k) * X(j)^k);
            end
            y2(j, 1) = sum;
        end
    end
    
    if d == 1
        y1 = zeros(n, 1);
        for j = 1 : n
            sum = 0;
            for k = 1 : d
                sum = sum + (w(k) * X(j)^k);
            end
            y1(j, 1) = sum;
        end
    end
end

Least_squares_losses

scatter(X,Y)
hold on
plot(X, y1, X, y2, X, y3, X, y4)
axis([-1 1 -0.4 0.7])
    