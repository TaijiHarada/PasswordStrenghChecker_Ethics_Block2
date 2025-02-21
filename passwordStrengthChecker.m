clear;
clc;
close all;

% Author: Taiji Harada
% Date: 2025-02-20
% License: MIT License
% Summary: This code reads a user inputed password and determines its
% strength based on a very simple algorithm.

userPasswordString = input("Please enter password to be strength tested: \n", "s");

fprintf("You entered: %s\n", userPasswordString);

passwordStrengthInt = 0;

% Add strength based on length of password
passwordStrengthInt = passwordStrengthInt + size(userPasswordString, 2);

for i = 1:size(userPasswordString, 2)
    passwordCharacter = userPasswordString(i);

    % Add one additional strength if a character is a number
    if passwordCharacter >= '0' && passwordCharacter <= '9'
        passwordStrengthInt = passwordStrengthInt + 1;

    elseif passwordCharacter >= ':' && passwordCharacter <= '@'
        % Add two additional strength if a character is a special character
        passwordStrengthInt = passwordStrengthInt + 1;
    elseif passwordCharacter >= 'A' && passwordCharacter <= 'z'
        % add nothing for basic characters
    else
        error("Passowrd contains invalid characters");
    end
end

if passwordStrengthInt <= 10
    fprintf("Your password is weak\n");
elseif passwordStrengthInt <= 20
    fprintf("Your password is medium\n");
else
    fprintf("Your password is strong\n");
end


