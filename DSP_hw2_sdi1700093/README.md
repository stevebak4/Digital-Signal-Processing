# DTMF Signal Processing Project

## Overview
This project, part of the "Ψηφιακή Επεξεργασία Σήματος (Κ32)" course, focuses on the generation, filtering, and decoding of Dual-Tone Multi-Frequency (DTMF) signals using MATLAB. The project implements several signal processing tasks related to phone number digit identification and manipulation based on DTMF tones.

## Project Details
- **Course**: Ψηφιακή Επεξεργασία Σήματος (Κ32)
- **Semester**: Winter Academic Semester 2019
- **Instructor**: Επικ. Καθ. Γεώργιος Χ. Αλεξανδρόπουλος
- **Submission Date**: January 22, 2020

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

## Usage
1. **MATLAB**: Load the project into your MATLAB environment and run the respective `.m` files.
2. **Functionality**:
   - `create_number.m`: Input the 10-digit number to generate the DTMF signal.
   - `filter_number.m`: Filters out digits 1, 2, and 3 from the generated DTMF signal.
   - `count_aces.m`: Counts the occurrences of the digit '1' in the generated signal.
   - `decode_DTMF.m`: Decodes the DTMF signal from `secret_number.wav`.

## Files
- `create_number.m`: Generates the DTMF signal and visualizes its frequency components.
- `filter_number.m`: Filters the DTMF signal to remove specified digits.
- `count_aces.m`: Counts occurrences of the digit '1'.
- `decode_DTMF.m`: Decodes a DTMF signal from an audio file.

## Conclusion
This project explores fundamental concepts of digital signal processing through practical application of DTMF signal generation, filtering, and decoding. It demonstrates the use of MATLAB for signal manipulation and provides insight into real-world communication systems.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
