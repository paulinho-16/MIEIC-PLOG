% ------------------------------------------------------------------------------------------------------------------------- %
%                                                 Display Problems Menu                                                     %
%   Prototype:                                                                                                              %
%       display_menu/0                                                                                                      %
%                                                                                                                           %
%   Description:                                                                                                            %
%       Display the Problems Menu, asking the user the Chess-Num problem to be solved                                       %
%       (Problem 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 or 11)                                                                       %
% ------------------------------------------------------------------------------------------------------------------------- %

display_menu :-
    nl,nl,
    write('\x250c\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2510\'),nl,
    write('\x2502\                                                                       \x2502\'),nl,
    write('\x2502\                                                                       \x2502\'),nl,
    write('\x2502\          ___ _                             __                         \x2502\'),nl,
    write('\x2502\         / __\\ |__   ___  ___ ___        /\\ \\ \\_   _ _ __ ___          \x2502\'),nl,
    write('\x2502\        / /  | \'_ \\ / _ \\/ __/ __|_____ /  \\/ / | | | \'_ ` _ \\         \x2502\'),nl,
    write('\x2502\       / /___| | | |  __/\\__ \\__ \\_____/ /\\  /| |_| | | | | | |        \x2502\'),nl,
    write('\x2502\       \\____/|_| |_|\\___||___/___/     \\_\\ \\/  \\__,_|_| |_| |_|        \x2502\'),nl,
    write('\x2502\                                                                       \x2502\'),nl,
    write('\x2502\                            Problem to solve?                          \x2502\'),nl,
    write('\x2502\                                                                       \x2502\'),nl,
    write('\x2502\               \x250c\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2510\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [1]   Problem 1                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [2]   Problem 2                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [3]   Problem 3                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [4]   Problem 4                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [5]   Problem 5                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [6]   Problem 6                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [7]   Problem 7                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [8]   Problem 8                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [9]   Problem 9                 \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [10]   Problem 10               \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\        [11]   Problem 11               \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\                                        \x2502\              \x2502\'),nl,
    write('\x2502\               \x2502\             [0] Exit Game              \x2502\              \x2502\'),nl,
    write('\x2502\               \x2514\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2518\              \x2502\'),nl,
    write('\x2502\                                                                       \x2502\'),nl,
    write('\x2514\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2500\\x2518\'),nl,nl,nl.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Codes to Number                                                     %
%   Prototype:                                                                                                              %
%       codes_to_number(+Codes, +Exponent, +Acc, -FloatNumber)                                                              %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Codes -> The ASCII codes of the characters in the string entered by the user                                        %
%       Exponent -> The current Exponent to indicate digits position in final number                                        %
%       Acc -> Contains the value of the number being constructed, at a certain call. Begins with value 0                   %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       FloatNumber -> Number entered by the user, in float format                                                          %
% ------------------------------------------------------------------------------------------------------------------------- %

codes_to_number([], _, Number, Number).
codes_to_number([Code|Codes], Exponent, Acc, Number) :-
    NewAcc is Acc + (10**Exponent) * (Code - 48),
    NewExponent is Exponent - 1,
    codes_to_number(Codes, NewExponent, NewAcc, Number).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Read Input                                                          %
%   Prototype:                                                                                                              %
%       read_input(-Number)                                                                                                 %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Number -> Reads a number, entered by the user                                                                       %
% ------------------------------------------------------------------------------------------------------------------------- %

read_input(Number) :-
    read_line(Codes),
    length(Codes, NrCodes),
    Exponent is NrCodes - 1,
    codes_to_number(Codes, Exponent, 0, FloatNumber),
    Number is round(FloatNumber).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                         Input                                                             %
%   Prototype:                                                                                                              %
%       input(-N, +FirstOpt, +LastOpt, +String, +Type)                                                                      %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       FirstOpt -> Minimal value of the Option that can be entered                                                         %
%       LastOpt -> Maximal value of the Option that can be entered                                                          %
%       String -> The String to be presented to the screen if the user enters an invalid option                             %
%       Type -> The type of the input, to return the wanted option value                                                    %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       N -> The value of the option chosen by the user                                                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

input(N, FirstOpt, LastOpt, String, Type) :-
    write('Option: '),
    read_input(Number),
    check_option(Number, N, FirstOpt, LastOpt, String, Type).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                  Check Option                                                             %
%   Prototype:                                                                                                              %
%       check_option(+O, -N, +FirstOpt, +LastOpt, +String, +Type)                                                           %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       O -> Option chosen by the user                                                                                      %
%       FirstOpt -> Minimal value of the Option that could be entered                                                       %
%       LastOpt -> Maximal value of the Option that could be entered                                                        %
%       String -> The String to be presented to the screen if the user entered an invalid option                            %
%       Type -> The type of the input, to return the wanted option value                                                    %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       N -> The value of the option chosen by the user                                                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

check_option(O, N, FirstOpt, LastOpt, _, Type) :- O >= FirstOpt, O =< LastOpt, option(O, N, Type), !.
check_option(_, N, FirstOpt, LastOpt, String, Type) :-
    write('Invalid Option. '),
    write(String),
    read_input(Number),
    check_option(Number, N, FirstOpt, LastOpt, String, Type).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                        Option                                                             %
%   Prototype:                                                                                                              %
%       option(+Option, -Value, +Type)                                                                                      %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Option -> Option chosen by the user                                                                                 %
%       Type -> The type of the input, to return the wanted option value                                                    %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Value -> The correspondent value of the option chosen by the user                                                   %
% ------------------------------------------------------------------------------------------------------------------------- %

option(0, exit, problems).
option(Problem, Problem, problems).