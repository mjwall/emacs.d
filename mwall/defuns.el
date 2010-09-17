;;; defuns.el
;;
;; Misc functions from defunkt and ESK

;; Use a more interesting startup message
(defun startup-echo-area-message ()
  "By your command...")

(defun turn-on-whitespace ()
  (whitespace-mode t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defun turn-on-hideshow () (hs-minor-mode t))

(defun turn-on-linum () (linum-mode t))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(FIX\\|FIXME\\|TODO\\|BUG\\|XXX\\):"
      1 font-lock-warning-face t))))

(add-hook 'coding-hook 'turn-on-whitespace)
(add-hook 'coding-hook 'add-watchwords)
(add-hook 'coding-hook 'turn-on-hideshow)
(add-hook 'coding-hook 'turn-on-linum)


(defun run-coding-hook ()
  (interactive)
  (run-hooks 'coding-hook))

;; for loading libraries in from the vendor directory
;; TODO: look at this again to see if it is useful
;; (defun vendor (library)
;;   (let* ((file (symbol-name library))
;;          (normal (concat "~/.emacs.d/vendor/" file))
;;          (suffix (concat normal ".el"))
;;          (mwall (concat "~/.emacs.d/mwall/" file)))
;;     (cond
;;      ((file-directory-p normal) (add-to-list 'load-path normal) (require library))
;;      ((file-directory-p suffix) (add-to-list 'load-path suffix) (require library))
;;      ((file-exists-p suffix) (require library)))
;;     (when (file-exists-p (concat mwall ".el"))
;;       (load mwall))))

(defun clean-slate ()
    "Kills all buffers except *scratch*"
    (interactive)
    (let ((buffers (buffer-list)) (safe '("*scratch*")))
      (while buffers
        (when (not (member (car buffers) safe))
          (kill-buffer (car buffers))
          (setq buffers (cdr buffers))))))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

;; grabbed from http://blog.tuxicity.se/elisp/emacs/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))



;; The following two function are taken from textmate.el package
;; by defunkt.
(defun textmate-shift-right (&optional arg)
  "Shift the line or region to the ARG places to the right.

A place is considered `tab-width' character columns."
  (interactive)
  (let ((deactivate-mark nil)
        (beg (or (and mark-active (region-beginning))
                 (line-beginning-position)))
        (end (or (and mark-active (region-end)) (line-end-position))))
    (indent-rigidly beg end (* (or arg 1) tab-width))))

(defun textmate-shift-left (&optional arg)
  "Shift the line or region to the ARG places to the left."
  (interactive)
  (textmate-shift-right (* -1 (or arg 1))))


;; taken from http://github.com/superbobry/emacs/blob/master/rc/emacs-rc-defuns.el
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun move-line (arg)
  "Moves line up or down, depending on the arg."
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines arg))
    (if (eql arg 1) (forward-line))
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (move-line -1))

(defun move-line-down ()
  (interactive)
  (move-line 1))

;; show-ascii-chart
;; ----------------
;; Display a helpful ASCII reference chart when called.  Useful for quickly
;; double checking or looking up character codes.  Usually the
;; what-cursor-position (C-x =) is faster for spot lookups of the number
;; for a character here and there.  It's terrible, however, for finding the
;; character given a number.
;;
(defun show-ascii-chart ()
  "Display a helpful ASCII chart."
  (interactive)
  (let ((chart (concat
                "==============================================================================\n"
                "                        Common ASCII Codes And Escapes\n"
                "==============================================================================\n"
                "Char  Dec Hex Oct Esc Name             | Char  Dec Hex Oct Esc Name\n"
                "------------------------------------------------------------------------------\n"
                "(nul)   0  00 000 \\0  Null             | (np)   12  0c 014 \\f  Form Feed\n"
                "(bel)   7  07 007 \\a  Audible Alert    | (cr)   13  0d 015 \\r  Carriage Return\n"
                "(bs)    8  08 010 \\b  Backspace        | (sp)   32  20 040     Space\n"
                "(ht)    9  09 011 \\t  Horizontal Tab   | 0      48  30 060     Zero\n"
                "(nl)   10  0a 012 \\n  New Line         | A      65  41 101     Capital A\n"
                "(vt)   11  0b 013 \\v  Vertical Tab     | a      97  61 141     Lowercase a\n"
                "\n"
                "=============================================================================\n"
                "                                 ASCII Table\n"
                "=============================================================================\n"
                "Char  Dec Hex Oct | Char  Dec Hex Oct | Char  Dec Hex Oct | Char  Dec Hex Oct\n"
                "-----------------------------------------------------------------------------\n"
                "(nul)   0  00 000 | (sp)   32  20 040 | @      64  40 100 | `      96  60 140\n"
                "(soh)   1  01 001 | !      33  21 041 | A      65  41 101 | a      97  61 141\n"
                "(stx)   2  02 002 | \"      34  22 042 | B      66  42 102 | b      98  62 142\n"
                "(etx)   3  03 003 | #      35  23 043 | C      67  43 103 | c      99  63 143\n"
                "(eot)   4  04 004 | $      36  24 044 | D      68  44 104 | d     100  64 144\n"
                "(enq)   5  05 005 | %      37  25 045 | E      69  45 105 | e     101  65 145\n"
                "(ack)   6  06 006 | &      38  26 046 | F      70  46 106 | f     102  66 146\n"
                "(bel)   7  07 007 | '      39  27 047 | G      71  47 107 | g     103  67 147\n"
                "(bs)    8  08 010 | (      40  28 050 | H      72  48 110 | h     104  68 150\n"
                "(ht)    9  09 011 | )      41  29 051 | I      73  49 111 | i     105  69 151\n"
                "(nl)   10  0a 012 | *      42  2a 052 | J      74  4a 112 | j     106  6a 152\n"
                "(vt)   11  0b 013 | +      43  2b 053 | K      75  4b 113 | k     107  6b 153\n"
                "(np)   12  0c 014 | ,      44  2c 054 | L      76  4c 114 | l     108  6c 154\n"
                "(cr)   13  0d 015 | -      45  2d 055 | M      77  4d 115 | m     109  6d 155\n"
                "(so)   14  0e 016 | .      46  2e 056 | N      78  4e 116 | n     110  6e 156\n"
                "(si)   15  0f 017 | /      47  2f 057 | O      79  4f 117 | o     111  6f 157\n"
                "(dle)  16  10 020 | 0      48  30 060 | P      80  50 120 | p     112  70 160\n"
                "(dc1)  17  11 021 | 1      49  31 061 | Q      81  51 121 | q     113  71 161\n"
                "(dc2)  18  12 022 | 2      50  32 062 | R      82  52 122 | r     114  72 162\n"
                "(dc3)  19  13 023 | 3      51  33 063 | S      83  53 123 | s     115  73 163\n"
                "(dc4)  20  14 024 | 4      52  34 064 | T      84  54 124 | t     116  74 164\n"
                "(nak)  21  15 025 | 5      53  35 065 | U      85  55 125 | u     117  75 165\n"
                "(syn)  22  16 026 | 6      54  36 066 | V      86  56 126 | v     118  76 166\n"
                "(etb)  23  17 027 | 7      55  37 067 | W      87  57 127 | w     119  77 167\n"
                "(can)  24  18 030 | 8      56  38 070 | X      88  58 130 | x     120  78 170\n"
                "(em)   25  19 031 | 9      57  39 071 | Y      89  59 131 | y     121  79 171\n"
                "(sub)  26  1a 032 | :      58  3a 072 | Z      90  5a 132 | z     122  7a 172\n"
                "(esc)  27  1b 033 | ;      59  3b 073 | [      91  5b 133 | {     123  7b 173\n"
                "(fs)   28  1c 034 | <      60  3c 074 | \\      92  5c 134 | |     124  7c 174\n"
                "(gs)   29  1d 035 | =      61  3d 075 | ]      93  5d 135 | }     125  7d 175\n"
                "(rs)   30  1e 036 | >      62  3e 076 | ^      94  5e 136 | ~     126  7e 176\n"
                "(us)   31  1f 037 | ?      63  3f 077 | _      95  5f 137 | (del) 127  7f 177\n")))
    (if (fboundp 'with-displaying-help-buffer)
        (with-displaying-help-buffer
         (lambda ()
           (princ chart))
         "ASCII Chart")
      (with-output-to-temp-buffer "ASCII Chart"
        (princ chart)))))
