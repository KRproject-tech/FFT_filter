clc
clear all
close all hidden

delete( '*.asv')

%% generate data

time_m = 0:1e-3:10;
y = @(t)( 4*cos( 2*pi*t) + 2*cos( 2*pi*10*t) + sin( 2*pi*100*t));

data = [ time_m.' y(time_m).'];


%% filtering (0-20 Hz LPF)

filtered_data = FFT_filter_func( data, [0 20], 1);


%% plot

h_fig(1) = figure(1);
h_ax(1) = axes( 'Parent', h_fig(1), 'Fontsize', 15);
h_plot(1,:) = plot( h_ax(1), time_m, data(:,2), 'b', time_m, filtered_data, 'r');
xlim( h_ax(1), [0 2])
xlabel( h_ax(1), 'Time [s]', 'Fontsize', 20, 'FontName', 'Times New Roman');
ylabel( h_ax(1), 'Out [a.u.]', 'Fontsize', 20, 'FontName', 'Times New Roman')
legend( 'raw data', 'filtered data')

set( h_plot(1,2), 'LineWidth', 2)
set( h_ax(1), 'FontName', 'Times New Roman')



%% filtering (0-5 Hz LPF)

filtered_data = FFT_filter_func( data, [0 5], 1);


%% plot

h_fig(2) = figure(2);
h_ax(2) = axes( 'Parent', h_fig(2), 'Fontsize', 15);
h_plot(1,:) = plot( h_ax(2), time_m, data(:,2), 'b', time_m, filtered_data, 'r');
xlim( h_ax(2), [0 2])
xlabel( h_ax(2), 'Time [s]', 'Fontsize', 20, 'FontName', 'Times New Roman');
ylabel( h_ax(2), 'Out [a.u.]', 'Fontsize', 20, 'FontName', 'Times New Roman')
legend( 'raw data', 'filtered data')

set( h_plot(1,2), 'LineWidth', 2)
set( h_ax(1), 'FontName', 'Times New Roman')



%% filtering (5- Hz HPF)

filtered_data = FFT_filter_func( data, [5 Inf], 1);


%% plot

h_fig(3) = figure(3);
h_ax(3) = axes( 'Parent', h_fig(3), 'Fontsize', 15);
h_plot(1,:) = plot( h_ax(3), time_m, data(:,2), 'b', time_m, filtered_data, 'r');
xlim( h_ax(3), [0 2])
xlabel( h_ax(3), 'Time [s]', 'Fontsize', 20, 'FontName', 'Times New Roman');
ylabel( h_ax(3), 'Out [a.u.]', 'Fontsize', 20, 'FontName', 'Times New Roman')
legend( 'raw data', 'filtered data')

set( h_plot(1,2), 'LineWidth', 2)
set( h_ax(1), 'FontName', 'Times New Roman')



