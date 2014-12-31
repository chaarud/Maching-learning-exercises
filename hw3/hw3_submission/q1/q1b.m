Xtest = load('Xtest.txt');
Ytest = load('Ytest.txt');

d_vec = [3, 10];
errors = [0, 0];

for a = 1 : size(d_vec, 2)
    d = d_vec(a);
    m = size(Xtest);
    m = m(1);
    A = zeros(m, d);

    for i = 1 : d
        A(:, i) = Xtest.^i;
    end

    w = A \ Ytest;

    y3 = zeros(m, 1);
    for j = 1 : m
        sum = 0;
        for k = 1 : d
            sum = sum + (w(k) * Xtest(j)^k);
        end
        y3(j, 1) = sum;
    end

    temp = (y3 - Ytest).^2;
    error = 0;
    for i = 1 : m
        error = error + temp(i);
    end

    errors(a) = error
end

