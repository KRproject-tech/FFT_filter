function filtered_data = FFT_filter_func( data, Freq_through_width, verify_flag)

%
%       FFT_filter( data, Freq_through_width, verify_flag)
%       data: 時刻とデータを含んだ配列，Freq_through_width: 周波数通過帯域 [f_low f_high],
%       verify_flag: 引数が存在するときはfftスペクトルをplot.
%

%% FFT filter

%%[0] データの向きを調整
[row col] = size( data);
if row < col
    data2 = data.';
else
    data2 = data;
end

%%[1] 通過帯域設定 [Hz]
Fcut_low = Freq_through_width(1);
Fcut_high = Freq_through_width(2);

%%[2] 周波数領域 [Hz]
time_m = data2(:,1);%% 読み込みデータ一列目は時刻 [s]
t_samp = mean( diff( time_m));%% サンプリング周期 [s]
f_vec = (1:length(time_m))/length(time_m)*t_samp^-1;%% 周波数領域 (サンプリング周波数の半分までが有効) [Hz]

%%[3] fftフィルタリング
FFT_data = fft( data2(:,2));
fcut_width = ( f_vec < Fcut_low | Fcut_high < f_vec & f_vec < 1/t_samp - Fcut_high | 1/t_samp - Fcut_low < f_vec);

if exist( 'verify_flag', 'var') == 1

    figure(1000)
    
    semilogx( f_vec, abs(FFT_data)*t_samp, 'b')
    xlim( [0 1/t_samp/2])
    ylim( [0 1.5*max( abs(FFT_data)*t_samp)])
    xlabel( 'Frequency [Hz]')
    hold on
    
    FFT_data( fcut_width) = nan;%% 通過帯域以外を除去
    
    semilogx( f_vec, abs(FFT_data)*t_samp, 'r--', 'LineWidth', 4)    
    legend( 'raw data', 'filtered data')
end

FFT_data( fcut_width) = 0;%% 通過帯域以外を除去
filtered_data = real( ifft( FFT_data));