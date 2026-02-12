#!/usr/bin/bash

tmpfile=$(mktemp)
awk 'BEGIN{errorsN=1; requestN=1; responseN=1}
{    
    if ($0 ~ /^                -   \[Request\]\(#request-[0-9]+\)/) 
    {
        $i="                -   [Request](#request-" requestN ")"
        requestN++
    }

    if ($0 ~ /^                -   \[Success Response\]\(#success-response-[0-9]+\)/) 
    {
        $i="                -   [Success Response](#success-response-" responseN ")"
        responseN++
    }

    if ($0 ~ /^                -   \[Errors\]\(#errors-[0-9]+\)/) 
    {
        $i="                -   [Errors](#errors-" errorsN ")"
        errorsN++
    }
    
    print
}' README.md > $tmpfile && mv $tmpfile README.md
