function W = hat(w)
% Function W = hat(w)
% hat() maps an element of R3 to so(3) if w is 3x1, or
% R6 to se(3) if w is 6x1.

% [0 -w3 w2; w3 0 -w1; -w2 w1 0] = hat([w1; w2; w3])

s = length(w);

if (s==3)
    W = [0 -w(3) w(2); w(3) 0 -w(1); -w(2) w(1) 0];
end

if (s==6)
    W = [hat([w(4);w(5);w(6)]),[w(1);w(2);w(3)];...
        [0 0 0 0]];
end
        