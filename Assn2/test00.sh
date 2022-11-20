#!/bin/dash

# ==============================================================================
# test00.sh
# Test the q command.
# Written by: Jun Bai
# For COMP9044 Assignment 2
# ==============================================================================

#start testing
echo "===========Test start============"

# Add the current directory to the PATH so scripts.
PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_directory="$(mktemp -d)"
cd "$test_directory" || exit 1

# Create some files to hold output.
exp_output="$(mktemp)"
act_output="$(mktemp)"

# Remove the temporary directory when the test is done.
trap 'rm "$exp_output" "$act_output" -rf "$test_directory"' INT HUP QUIT TERM EXIT


#Test1
seq 1 10 | slippy '5q' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
2
3
4
5
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test1 Failed!!!"
    exit 1
else
    echo "Test1 Pass..."
fi

#Test2
seq 2 8 | slippy '7q' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
2
3
4
5
6
7
8
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test2 Failed!!!"
    exit 1
else
    echo "Test2 Pass..."
fi

#Test3
seq 1 5 | slippy '/^2/q' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
1
2
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test3 Failed!!!"
    exit 1
else
    echo "Test3 Pass..."
fi

#Test4
seq 10 17| slippy '/.1/q' > "$act_output" 2>&1

#exp_ouput
cat > "$exp_output" <<EOF
10
11
EOF

if ! diff "$act_output" "$exp_output"
then
    echo "Test4 Failed!!!"
    exit 1
else
    echo "Test4 Pass..."
fi


echo  "All Test00 Passed!!!"
exit 0
