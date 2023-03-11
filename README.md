![図1](https://user-images.githubusercontent.com/114337358/220586933-99d9dcf2-ca75-4198-b216-380defbd2c4e.png)

# <p align=center>FFT_filter</p>

**Communication**

<a style="text-decoration: none" href="https://twitter.com/hogelungfish" target="_blank">
    <img src="https://img.shields.io/badge/twitter-%40hogelungfish-1da1f2.svg" alt="Twitter">
</a>
<p>

__MATLAB code for Low Pass Filter (LPF) and High Pass Filter (HPF) based on Fast Fourier Transform (FFT) [^1].__


# Usage

`filtered_data = FFT_filter_func( raw_data, [f_min f_max], plot_flag);`

where

`raw_data = [ time_vec data_vec]`: time data `time_vec` [s] and time series of raw data `data_vec` [a.u.].

`[f_min f_max]`: bandpass [Hz]. 

`plot_flag`: When the argument is present, the FFT spectrum is plotted.

## Source codes

* FFT_filter_func.m: FFT fliter function.

* demo.m: demonstration for FFT_filter_func.m.

## Images

__Input data example__: 

$f(t) = 4\cos( 2\pi t) + 2\cos( 2\pi 10t) + \sin( 2\pi 100t)$


* __Power spectrum of input data__

![untitled](https://user-images.githubusercontent.com/114337358/220673079-b0f8f224-5e1d-44c1-9614-5b839af66961.png)


* __0-20Hz LPF__: `FFT_filter_func( data, [0 20], 1);`
![0-20_Hz](https://user-images.githubusercontent.com/114337358/220587034-48051427-612d-439a-89a8-79bae1d1d11b.png)

* __0-5Hz LPF__: `FFT_filter_func( data, [0 5], 1);`
![0-5_Hz](https://user-images.githubusercontent.com/114337358/220587056-f01819bb-b3d4-415f-9ca2-cd9457806963.png)

* __5- Hz HPF__: `FFT_filter_func( data, [5 Inf], 1);`
![5-Inf_Hz](https://user-images.githubusercontent.com/114337358/220587069-ba2c7ec2-f5d2-4643-a984-b148220bb3e9.png)




### References

[^1]: . 
