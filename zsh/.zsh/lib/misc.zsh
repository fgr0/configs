#
# Environment
#

# TODO: Merge with other files?

setopt long_list_jobs   # List jobs in the long format by default
setopt auto_resume      # Attempt to resume existing jobs before creating a new process
setopt notify           # Report the status of background jobs immediately
unsetopt bg_nice        # Don't run all background jobs at a lower priority
