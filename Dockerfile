FROM python:3-stretch
LABEL author='alex(at)secureideas(dot)com'
RUN git clone https://github.com/Bashfuscator/Bashfuscator
WORKDIR /Bashfuscator
RUN python setup.py install
COPY ./docker-entrypoint.sh ./
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["--help"]
