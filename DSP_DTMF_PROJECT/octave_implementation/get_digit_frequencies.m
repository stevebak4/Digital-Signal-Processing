
function [f1,f2] = get_digit_frequencies(digit)
    if digit == 0
        f1 = 941;
        f2 = 1336;
    elseif digit == 1
        f1 = 697;
        f2 = 1209;
    elseif digit == 2
        f1 = 697;
        f2 = 1336;
    elseif digit == 3
        f1 = 697;
        f2 = 1477;
    elseif digit == 4
        f1 = 770;
        f2 = 1209;
    elseif digit == 5
        f1 = 770;
        f2 = 1336;
    elseif digit == 6
        f1 = 770;
        f2 = 1477;
    elseif digit == 7
        f1 = 852;
        f2 = 1209;
    elseif digit == 8
        f1 = 852;
        f2 = 1336;
    elseif digit == 9
        f1 = 852;
        f2 = 1477;
    end
end