FROM python:3-stretch
LABEL author='alex(at)secureideas(dot)com'
RUN git clone https://github.com/Bashfuscator/Bashfuscator
WORKDIR /Bashfuscator
RUN python setup.py install
ENTRYPOINT ["/usr/local/bin/bashfuscator"]
CMD ["--help"]
