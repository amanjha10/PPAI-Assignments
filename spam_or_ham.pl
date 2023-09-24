% Define spam keywords
spam_keyword("buy now").
spam_keyword("limited time").
spam_keyword("earn money").
spam_keyword("free gift").
spam_keyword("click here").
spam_keyword("unsubscribe").

% Define suspicious sender domains
suspicious_sender_domain("example.com").
suspicious_sender_domain("spammydomain.com").

% Predicate to convert a string to lowercase
lowercase(String, LowercaseString) :-
    string_lower(String, LowercaseString).

% Predicate to check if an email contains a spam keyword
contains_spam_keyword(Email) :-
    spam_keyword(Keyword),
    sub_string(Email, _, _, _, Keyword).

% Predicate to check if an email contains a suspicious sender domain
contains_suspicious_domain(Email) :-
    suspicious_sender_domain(Domain),
    sub_string(Email, _, _, _, Domain).

% Predicate to check if an email is spam
is_spam(Email) :-
    lowercase(Email, LowercaseEmail),
    (contains_spam_keyword(LowercaseEmail) ; contains_suspicious_domain(LowercaseEmail)).

% Sample email text
email_text("Congratulations! Congratulations!! Congratulations!!!  You've won a free gift. Click here to claim it now.").

% Main initialization
:- initialization(main).
main :-
    email_text(EmailText),
    (is_spam(EmailText) -> writeln("This email is likely spam.") ; writeln("This email is not spam.")).
