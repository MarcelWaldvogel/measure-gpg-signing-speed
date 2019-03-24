# GPG sigining speed measurements

You need to following packages installed to run this test: `gnupg`, `bc`, e.g.
by
```sh
apt install gnupg bc
```

## Measuring time

Run `./timeme.sh` to obtain the results. This will use the pre-generated keys
to make the tests as comparable and reproducible as possible.

Each will sign its keyid (40 bytes) with itself ten (10) times and print the
key (including its type) and the resulting time for all ten runs.

To ensure a warm cache and that any necessary background processes are already
running (notably `gpg-agent`), run the test twice on an otherwise idle system
and only report the second set of results.

This is a single-threaded test, as `gpg` will serialize the actual private-key
operation (in this case, signing) through the single `gpg-agent` anyway.
Little is gained from running it in parallel. See `doc/Cryptography.md` in the
`igitt` repository for more information and test results.
