%% EXERCISE 11 – FIR Filter Types (Type I–IV)
clear; close all; clc;

%% Define impulse responses for four FIR types
h1 = [1 2 3 4 4 3 2 1];     % Type I: M even, symmetric
h2 = [1 2 3 4 3 2 1];       % Type II: M odd, symmetric
h3 = [-1 -2 -3 -4 3 3 2 1]; % Type III: M even, antisymmetric
h4 = [-1 -2 -3 0 3 2 1];    % Type IV: M odd, antisymmetric

H_all = {h1, h2, h3, h4};
titles = {'Type I (Even, Symmetric)', ...
          'Type II (Odd, Symmetric)', ...
          'Type III (Even, Antisymmetric)', ...
          'Type IV (Odd, Antisymmetric)'};

%% Plot results
figure('Name','Exercise 11 – FIR Filter Types','NumberTitle','off','Position',[100 100 1200 800]);

for k = 1:4
    h = H_all{k};
    [H, w] = freqz(h, 1, 512);
    
    % Magnitude Response
    subplot(4,3,(k-1)*3 + 1);
    plot(w/pi, abs(H), 'LineWidth', 1.5);
    grid on;
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('|H(e^{j\omega})|');
    title(['Magnitude - ' titles{k}]);
    
    % Phase Response (unwrapped)
    subplot(4,3,(k-1)*3 + 2);
    plot(w/pi, unwrap(angle(H)), 'LineWidth', 1.5);
    grid on;
    xlabel('Normalized Frequency (\times\pi rad/sample)');
    ylabel('Phase (radians)');
    title(['Phase - ' titles{k}]);
    
    % Pole–Zero Diagram
    subplot(4,3,(k-1)*3 + 3);
    zplane(h,1);
    title(['Zero Plot - ' titles{k}]);
end

sgtitle('Exercise 11 – FIR Filter Types I–IV');

