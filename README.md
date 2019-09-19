# Dockerized Bashfusctator (Unofficial)
## Project

The [Bashfuscator](https://github.com/Bashfuscator/Bashfuscator) seems like a really cool project, and I love what they are doing with it.

## This repo
I figured since every linux distro (_I believe_) can run docker, and since more and more things are getting pushed to the cloud. I figured why not dockerize the Bashfuscator tool, so it is portable and people don't even have to run python (even though linux should come with it by default) or build it. This allows the barrier to entry to be even lower, and let people play around with it and not have to install anything.

## Normal execution
If you want to run the container from this Dockerfile, then you will probably need to go with at least this command: `docker container run --rm -t elrey741/bashfuscator`
- `--rm` - since you don't need to keep teh container around
- `-t` - allocates a pseudo-TTY, which is used by the bashfuscator project to figure out how to output the obfuscated bash

## autocomplete
Bashfuscator has built in autocompletion, but unfornatley docker doesn't like to play nice with the generated autocompletion (mainly because you don't acutally have it installed on YOUR machine but in the docker conatiner). So instead if you want to view/use bashfuscator autocompletion you can run follow these steps.
- Launch bashfuscator in the docker container like this `docker container run --rm --entrypoint '/bin/bash' elrey741/bashfuscator`
- then you can type `bashfuscator` and all the tab functionality will be there.

So unfortunately without writing a custom parser (that you would hit enter and it would tell you your options from there) which I thought about traveling down that [road](https://github.com/elreydetoda/docker-bashfuscator/issues/5), but then decided to make this my first iteration.

Since you have the tab completion [now](#autocomplete), you can build the command on your machine and then paste it wherever you want it executed.

Maybe down the road there will be a better solution, but for now it works... :grin:
