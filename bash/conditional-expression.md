In Bash, conditional expressions are used by the [[ compound command and the [built-in commands to test file attributes and perform string and arithmetic comparisons.

**Note that `[[` is actually a command/program that returns either 0 (`true`) or 1 (`false`).** Any program that obeys the same logic (like all base utils, such as grep(1) or ping(1)) can be used as condition.[^1]

Here is a list of the most popular Bash conditional expressions.

## File Expressions

- True if file exists.

```bash
[[ -a ${file} ]]
```

- True if file exists.

```bash
[[ -e ${file} ]]
```

- True if file exists and is **a block special file**.

```bash
[[ -b ${file} ]]
```

- True if file exists and is **a character special file**.

```bash
[[ -c ${file} ]]
```

- True if file exists and is **a directory**.

```bash
[[ -d ${file} ]]
```

- True if file exists and is **a regular file**.

```bash
[[ -f ${file} ]]
```

- True if file exists and is **readable**.

```bash
[[ -r ${file} ]]
```

- True if file exists and has **a size greater than 0**.

```bash
[[ -s ${file} ]]
```

- True if file exists and is **writeable**.

```bash
[[ -w ${file} ]]
```

- True if file exists and is **executable**.

```bash
[[ -x ${file} ]]
```

- True if file exists and is **a symbolic link**.

```bash
[[ -h ${file} ]]
```

- True if file exists and is **a symbolic link**.

```bash
[[ -L ${file} ]]
```

## String Expressions

- True if the shell variable varname is **set** (has been assigned a value).

```bash
[[ -v ${varname} ]]
```

- True if the length of string is 0.

```bash
[[ -z ${string} ]]
```

- True if the length of string is not 0.

```bash
[[ -n ${string} ]]
```

- True if the strings are equal. = should be used with the test command for POSIX conformance. When used with the [[ command, this performs pattern matching as described above (Compound Commands).

```bash
[[ ${string1} == ${string2} ]]
[[ ${string1} != ${string2} ]]
[[ ${string1} > ${string2} ]]
[[ ${string1} < ${string2} ]]
```

## Arithmetic Operators

```bash
[[ ${arg1} -eq ${arg2} ]] #==
[[ ${arg1} -ne ${arg2} ]] #!=
[[ ${arg1} -le ${arg2} ]] #<=
[[ ${arg1} -lt ${arg2} ]] #<
[[ ${arg1} -ge ${arg2} ]] #>=
[[ ${arg1} -gt ${arg2} ]] #>
[[ test_case_1 ]] && [[ test_case_2 ]] #And
[[ test_case_1 ]] || [[ test_case_2 ]] #Or
```

***Source : Introduction to Bash Scripting by Bobby Iliev***

[^1]: [devhints](https://devhints.io/bash)
