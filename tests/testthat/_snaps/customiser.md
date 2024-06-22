# cannot overwrite existing file by default

    ".Rprofile" already exists.
    Do you want to set `allow_overwrite: TRUE`?

# cannot overwrite existing file if disallowed

    ".Rprofile" already exists.
    Do you want to set `allow_overwrite: TRUE`?

# cannot overwrite existing file if allowed

    Code
      readLines(out)
    Output
       [1] "FALSE"                                                                                   
       [2] ""                                                                                        
       [3] "on_rstudio <- function() {"                                                              
       [4] "  if (commandArgs()[[1L]] == \"RStudio\") {"                                             
       [5] "    return(TRUE)"                                                                        
       [6] "  }"                                                                                     
       [7] "  FALSE"                                                                                 
       [8] "}"                                                                                       
       [9] ""                                                                                        
      [10] "options(max.print = 40)"                                                                 
      [11] ""                                                                                        
      [12] "if (interactive() & requireNamespace(\"shrtcts\", quietly = TRUE)) {"                    
      [13] "  shrtcts::add_rstudio_shortcuts(set_keyboard_shortcuts = TRUE)"                         
      [14] "}"                                                                                       
      [15] ""                                                                                        
      [16] "options(usethis.destdir = \"/Users/jameslaird-smith/Google Drive/Applications/RStudio\")"
      [17] ""                                                                                        
      [18] "if (requireNamespace(\"prompt\", quietly = TRUE)) {"                                     
      [19] "  # my_prompt <- function(...) paste0(\"[\", prompt :: git_branch(),\"]\", \" > \")"     
      [20] "  my_prompt <- function(...) paste0(prompt::prompt_runtime())"                           
      [21] "  prompt::set_prompt(my_prompt)"                                                         
      [22] "  rm(my_prompt)"                                                                         
      [23] "}"                                                                                       

