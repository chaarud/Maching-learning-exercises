t = load('train_small.mat');
training_sets = t.train;

a_errors = zeros(1,7);
b_errors = zeros(1,7);
set_sizes = [100 200 500 1000 2000 5000 10000];

for a = 1 : 7

    %================================================
    %Part i
    %================================================

% a = 7;
    train = training_sets(a);
    images = train{1}.images;
    labels = train{1}.labels;
    N = size(labels,1);
    feature_vectors = zeros(size(images, 3), 784);
    for x = 1 : size(images, 3)
        r = reshape(images(:,:,x), 1, 784);
        r = double(r);
        n = norm(r);
        feature_vectors(x, :) = r./n;
    end
    
    [e,f] = hist(labels,unique(labels));
    s0 = zeros(e(1),784);
    s0count = 1;
    s1 = zeros(e(2),784);
    s1count = 1;
    s2 = zeros(e(3),784);
    s2count = 1;
    s3 = zeros(e(4),784);
    s3count = 1;
    s4 = zeros(e(5),784);
    s4count = 1;
    s5 = zeros(e(6),784);
    s5count = 1;
    s6 = zeros(e(7),784);
    s6count = 1;
    s7 = zeros(e(8),784);
    s7count = 1;
    s8 = zeros(e(9),784);
    s8count = 1;
    s9 = zeros(e(10),784);
    s9count = 1;
    
    % Part b - compute the priors
    priors = e./N;
    
    for i = 1 : N
        lbl = labels(i);
        if lbl == 0
            s0(s0count,:) = feature_vectors(i,:);
            s0count = s0count + 1;
        elseif lbl == 1
            s1(s1count,:) = feature_vectors(i,:);
            s1count = s1count + 1;
        elseif lbl == 2
            s2(s2count,:) = feature_vectors(i,:);
            s2count = s2count + 1;
        elseif lbl == 3
            s3(s3count,:) = feature_vectors(i,:);
            s3count = s3count + 1;
        elseif lbl == 4
            s4(s4count,:) = feature_vectors(i,:);
            s4count = s4count + 1;
        elseif lbl == 5
            s5(s5count,:) = feature_vectors(i,:);
            s5count = s5count + 1;
        elseif lbl == 6
            s6(s6count,:) = feature_vectors(i,:);
            s6count = s6count + 1;
        elseif lbl == 7
            s7(s7count,:) = feature_vectors(i,:);
            s7count = s7count + 1;
        elseif lbl == 8
            s8(s8count,:) = feature_vectors(i,:);
            s8count = s8count + 1;
        elseif lbl == 9
            s9(s9count,:) = feature_vectors(i,:);
            s9count = s9count + 1;
        end
    end
    
    mus = zeros(10,784);
    epsilons = zeros(10,784,784);
    for i = 1 : 10
        if i == 1
            samples = s0;
        elseif i == 2
            samples = s1;
        elseif i == 3
            samples = s2;
        elseif i == 4
            samples = s3;
        elseif i == 5
            samples = s4;
        elseif i == 6
            samples = s5;
        elseif i == 7
            samples = s6;
        elseif i == 8
            samples = s7;
        elseif i == 9
            samples = s8;
        elseif i == 10
            samples = s9;
        end
        mu = mean(samples, 1);
        epsilon = cov(samples);
        mus(i, :) = mu;
        epsilons(i,:,:) = epsilon;
    end

    %================================================
    %Part iii
    %================================================

    img = squeeze(epsilons(8,:,:)); % class '7'
    %imagesc(img);
    %colorbar;

    %================================================
    %Part iv
    %================================================

    epsilon_average = squeeze(mean(epsilons, 1));
    epsilon_average = epsilon_average + eye(784) * .15;
    inv(epsilon_average);

    test = load('test.mat');
    test_imgs = test.test.images;
    test_lbls = test.test.labels;
    test_features = zeros(size(test_imgs, 3), 784);
    for x = 1 : size(test_imgs, 3)
        r = reshape(test_imgs(:,:,x),1,784);
        r = double(r);
        n = norm(r);
        test_features(x,:) = r./n;
    end

    %part a
    M = zeros(10000,10);
    for i = 1 : 10
        M(:,i) = mvnpdf(test_features, squeeze(mus(i,:)), epsilon_average);
    end
    Classification = zeros(10000,1);
    mistakes = 0;
    for i = 1 : 10000
        m = M(i,:);
        [likelihood, digit] = max(m);
        Classification(i,:) = digit-1;
        if digit-1 ~= test_lbls(i)
            mistakes = mistakes + 1;
        end
    end
    error = mistakes/10000

    %part b
    M_prime = zeros(10000,10);
    for i = 1 : 10
        eps = squeeze(epsilons(i,:,:)) + eye(784) * .15;
        M_prime(:,i) = mvnpdf(test_features, squeeze(mus(i,:)), eps);
    end
    Classification_prime = zeros(10000,1);
    mistakes_prime = 0;
    for i = 1 : 10000
        m = M_prime(i,:);
        [likelihood, digit] = max(m);
        Classification_prime(i,:) = digit-1;
        if digit-1 ~= test_lbls(i)
            mistakes_prime = mistakes_prime + 1;
        end
    end
    error_prime = mistakes_prime/10000

    a_errors(:,a) = error;
    b_errors(:,a) = error_prime;
end

% scatter(set_sizes, a_errors);
% scatter(set_sizes, b_errors);