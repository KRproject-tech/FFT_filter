function filtered_data = FFT_filter_func( data, Freq_through_width, verify_flag)

%
%       FFT_filter( data, Freq_through_width, verify_flag)
%       data: �����ƃf�[�^���܂񂾔z��CFreq_through_width: ���g���ʉߑш� [f_low f_high],
%       verify_flag: ���������݂���Ƃ���fft�X�y�N�g����plot.
%

%% FFT filter

%%[0] �f�[�^�̌����𒲐�
[row col] = size( data);
if row < col
    data2 = data.';
else
    data2 = data;
end

%%[1] �ʉߑш�ݒ� [Hz]
Fcut_low = Freq_through_width(1);
Fcut_high = Freq_through_width(2);

%%[2] ���g���̈� [Hz]
time_m = data2(:,1);%% �ǂݍ��݃f�[�^���ڂ͎��� [s]
t_samp = mean( diff( time_m));%% �T���v�����O���� [s]
f_vec = (1:length(time_m))/length(time_m)*t_samp^-1;%% ���g���̈� (�T���v�����O���g���̔����܂ł��L��) [Hz]

%%[3] fft�t�B���^�����O
FFT_data = fft( data2(:,2));
fcut_width = ( f_vec < Fcut_low | Fcut_high < f_vec & f_vec < 1/t_samp - Fcut_high | 1/t_samp - Fcut_low < f_vec);

if exist( 'verify_flag', 'var') == 1

    figure(1000)
    
    semilogx( f_vec, abs(FFT_data)*t_samp, 'b')
    xlim( [0 1/t_samp/2])
    ylim( [0 1.5*max( abs(FFT_data)*t_samp)])
    xlabel( 'Frequency [Hz]')
    hold on
    
    FFT_data( fcut_width) = nan;%% �ʉߑш�ȊO������
    
    semilogx( f_vec, abs(FFT_data)*t_samp, 'r--', 'LineWidth', 4)    
    legend( 'raw data', 'filtered data')
end

FFT_data( fcut_width) = 0;%% �ʉߑш�ȊO������
filtered_data = real( ifft( FFT_data));