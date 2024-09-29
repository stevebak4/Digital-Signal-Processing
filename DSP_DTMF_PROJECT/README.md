# DTMF Signal Processing Project

## Overview
This project, part of the "Digital Signal Processing (DSP)" course, focuses on the generation, filtering, and decoding of 
Dual-Tone Multi-Frequency (DTMF) signals using MATLAB. The project implements several signal processing tasks related to 
phone number digit identification and manipulation based on DTMF tones. In my case I used Gnu-Octave instead of Matlab.

## DTMF System
The DTMF system is used for telephone signaling, where each digit is represented by the sum of two cosine signals at specific frequencies. These frequencies are selected to avoid overlaps and interferences. Each number tone lasts for 0.5 seconds with a 0.1-second pause between tones.

| Frequencies  | 1209 Hz | 1336 Hz | 1477 Hz | 1633 Hz |
|--------------|---------|---------|---------|---------|
| **697 Hz**   | 1       | 2       | 3       | A       |
| **770 Hz**   | 4       | 5       | 6       | B       |
| **852 Hz**   | 7       | 8       | 9       | C       |
| **941 Hz**   | *       | 0       | #       | D       |

## Functions Implemented
1. **`create_number.m`**  
   Generates and visualizes the DTMF signal corresponding to the last 10 digits of the student’s ID number. The frequency components of the signal are displayed to verify the correct generation of the tones.

2. **`filter_number.m`**  
   Filters the DTMF signal to remove the tones corresponding to the digits 1, 2, and 3. The filtered signal is analyzed to ensure the frequencies related to these digits have been successfully removed.

3. **`count_aces.m`**  
   Filters the DTMF signal and counts how many times the digit '1' (ace) appears. The function is designed using a custom filter to isolate and detect the presence of the digit '1'.

4. **`decode_DTMF.m`**  
   Decodes a DTMF signal from the file `secret_number.wav` and returns the corresponding telephone number. The function applies appropriate digital filters to identify the frequency pairs and map them to the respective digits.


