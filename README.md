# Guess Who No Fuzzy
A no fuzzy-search implementation of guess_who gem [https://github.com/odina/guess_who].

### Installing:
`gem install guess_who_no_fuzzy`

### Trying out:
```
> profiler = GuessWhoNoFuzzy::Profiler.profile!("john.doe@gmail.com")
> profiler.full_name # should say "John Doe"
> profiler.email # should say "john.doe@gmail.com"
```
