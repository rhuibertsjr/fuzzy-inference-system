%%% scratch.m - Intelligent Systems practicum
%%
%% Author: Rene Huiberts
%% Date:  09 - 01 - 2024
%%
%% Dependencies
%%   - pkg load fuzzy-logic-toolkit
%

%%% Plot configurations.
%%
x = 0:0.1:1

%% rhjr: trapezoid membership function.
params_close  = [-0.1 0.0 0.2 0.4];
y_close  = trapmf(x, params_close);

params_medium = [0.2 0.4 0.6 0.9];
y_medium = trapmf(x, params_medium);

params_far    = [0.8 0.9 1.0 1.1];
y_far    = trapmf(x, params_far);

%%% Creating figure
%%
figure_size = [1400 800]
figure(1, "position", [0 0 figure_size])

plot(x, y_close,  "k;close;", "LineWidth", 1);
hold on; % rhjr: plot in the same figure
plot(x, y_medium, "--k;medium;", "LineWidth", 1);
hold on;
plot(x, y_far,    "k;far;", "LineWidth", 2);

%% rhjr: figure additions
ylim([-0.1 1.1]);

xlabel("Distance (normalised)")
ylabel("Degree of membership");

title ("Fuzzy sets of Distance")

h = legend("close", "medium", "far")
legend (h, "location", "northeastoutside");

%%% Exporting
%%
grid on;
hold off;

%% rhjr: get current figure (gcf)
saveas(gcf, "fuzzy_sets_plot.png");

%%
%%% scratch.m ends here.
