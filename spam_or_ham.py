(defun is-spam (email)
  (let ((spam-keywords '("buy now" "limited time" "earn money" "free gift" "click here" "unsubscribe"))
        (suspicious-sender-domains '("example.com" "spammydomain.com"))
        (email (string-downcase email)))
    
    (loop for keyword in spam-keywords
          until (not (search keyword email))
          do (return t))
    
    (loop for domain in suspicious-sender-domains
          until (not (search (format nil "@~a" domain) email))
          do (return t))
    
    nil))

(let ((email-text "Congratulations! Congratulations!! Congratulations!!! You've won a free gift. Click here to claim it now."))
  (if (is-spam email-text)
      (format t "This email is likely spam.~%")
      (format t "This email is not spam.~%")))
