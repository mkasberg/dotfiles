#!/bin/bash

# Read JSON input
input=$(cat)

# Extract values from JSON
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
effort=$(echo "$input" | jq -r '.effort.level // empty')
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
tokens=$(echo "$input" | jq -r '(.context_window.total_input_tokens + .context_window.total_output_tokens) // empty')

# Get time and username
time=$(date +%H:%M:%S)
username=$(whoami)

# Display directory with ~ for home
display_dir="${cwd/#$HOME/~}"

# Git information
git_info=""
if git --no-optional-locks -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git --no-optional-locks -C "$cwd" branch --show-current 2>/dev/null || echo "")

    if [ -n "$branch" ]; then
        # Check for changes
        is_dirty=false
        if ! git --no-optional-locks -C "$cwd" diff --quiet 2>/dev/null || ! git --no-optional-locks -C "$cwd" diff --cached --quiet 2>/dev/null; then
            is_dirty=true
        fi

        # Get diff stats (additions and deletions)
        diff_stats=$(git --no-optional-locks -C "$cwd" diff --numstat 2>/dev/null | awk '{add+=$1; del+=$2} END {print add, del}')
        cached_stats=$(git --no-optional-locks -C "$cwd" diff --cached --numstat 2>/dev/null | awk '{add+=$1; del+=$2} END {print add, del}')
        
        # Sum up the stats
        read -r add del <<< "$diff_stats"
        read -r cached_add cached_del <<< "$cached_stats"
        
        # Handle empty values
        add=${add:-0}
        del=${del:-0}
        cached_add=${cached_add:-0}
        cached_del=${cached_del:-0}
        
        total_add=$((add + cached_add))
        total_del=$((del + cached_del))
        
        # Build git info with branch
        git_info=$(printf "\033[38;5;25m(\033[38;5;5m%s\033[38;5;25m)" "$branch")
        
        # Add dirty marker if needed
        if [ "$is_dirty" = true ]; then
            git_info="$git_info $(printf "\033[38;5;3m✗\033[0m")"
        fi
        
        # Add diff stats
        git_info="$git_info $(printf "\033[38;5;25m(\033[38;5;28m+%d\033[38;5;25m, \033[38;5;1m-%d\033[38;5;25m)\033[0m" "$total_add" "$total_del")"
    fi
fi

# Build the status line
printf "\033[48;5;7m\033[38;5;0m %s \033[0m" "$time"
printf "\033[38;5;173m %s \033[0m" "$username"
printf "\033[1m\033[38;5;34m➜ \033[0m"
printf "\033[1m\033[38;5;173m%s\033[0m" "$display_dir"

if [ -n "$git_info" ]; then
    printf " %s" "$git_info"
fi

printf " \033[38;5;4m|\033[0m"
printf " \033[38;5;3m%s" "$model"

if [ -n "$effort" ]; then
    printf " · %s" "$effort"
fi

printf "\033[0m"
printf " \033[38;5;4m|\033[0m"

if [ -n "$ctx_used" ]; then
    printf " \033[38;5;5m%.0f%% ctx\033[0m" "$ctx_used"
else
    printf " \033[38;5;5m-- ctx\033[0m"
fi

if [ -n "$tokens" ] && [ "$tokens" != "null" ] && [ "$tokens" != "0" ]; then
    if [ "$tokens" -ge 1000 ]; then
        formatted_tokens=$(awk "BEGIN {printf \"%.1fK\", $tokens/1000}")
    else
        formatted_tokens="$tokens"
    fi
    printf " \033[38;5;4m·\033[0m \033[38;5;5m%s tokens\033[0m" "$formatted_tokens"
fi
