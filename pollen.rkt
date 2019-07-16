#lang racket

(require racket/list racket/string racket/match racket/date racket/format
         txexpr xml/path
         pollen/decode pollen/setup pollen/core pollen/unstable/typography)
(require (only-in  srfi/19 string->date))

;; Override Pollen parameters
(module setup racket/base
  (require racket/path pollen/setup)
  (provide (all-defined-out))

  (define publish-directory (expand-user-path "~/output/"))
  (define img-path (path->complete-path "images/"))
  (define js-path (path->complete-path "js/"))

  (define (omitted-path? path)
    (define p-only (path-only (path->complete-path path)))
    (printf "Checking path: ~a\n" path)
    (or (default-omitted-path? path)
        (equal? p-only img-path)
        (equal? p-only js-path)))
 )
